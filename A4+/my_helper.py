import torch
import torch.nn.functional as F
from torch import Tensor, nn, optim

def rel_error(x, y, eps=1e-10):
    top = (x - y).abs().max().item()
    bot = (x.abs() + y.abs()).clamp(min=eps).max().item()
    return top / bot

def scaled_dot_product_no_loop_batch(
    query: Tensor, key: Tensor, value: Tensor, mask: Tensor = None
) -> Tensor:
    _, _, M = query.shape
    scaled_dot_product = torch.bmm(query, key.permute(0, 2, 1)) / (M ** 0.5) # (N, K, K)
    if mask is not None:
        scaled_dot_product = torch.masked_fill(scaled_dot_product, mask, -1e9)
    weights_softmax = F.softmax(scaled_dot_product, dim=-1)
    y = torch.bmm(weights_softmax, value)
    return y, weights_softmax

def get_subsequent_mask(seq):
    N, K = seq.shape
    mask = torch.ones((N, K, K), dtype=torch.bool, device=seq.device)
    for i in range(N):
        for j in range(K):
            mask[i, j, :j+1] = False
    return mask


class LayerNormalization(nn.Module):
    def __init__(self, emb_dim: int, epsilon: float = 1e-10):
        super().__init__()
        self.epsilon = epsilon
        self.gamma = nn.Parameter(torch.ones(emb_dim), True)
        self.beta = nn.Parameter(torch.zeros(emb_dim), True)

    def forward(self, x: Tensor):
        mean = x.mean(dim=-1, keepdim=True)
        std = x.std(dim=-1, unbiased=False, keepdim=True)
        y = self.gamma * (x - mean) / (std + self.epsilon) + self.beta
        return y


class FeedForwardBlock(nn.Module):
    def __init__(self, inp_dim: int, hidden_dim_feedforward: int):
        super().__init__()
        self.l1 = nn.Linear(inp_dim, hidden_dim_feedforward)
        self.l2 = nn.ReLU()
        self.l3 = nn.Linear(hidden_dim_feedforward, inp_dim)
        c = (6 / (inp_dim + hidden_dim_feedforward)) ** 0.5
        nn.init.uniform_(self.l1.weight.data, -c, c)
        nn.init.zeros_(self.l1.bias.data) 
        nn.init.uniform_(self.l3.weight.data, -c, c)
        nn.init.zeros_(self.l3.bias.data)       

    def forward(self, x):
        return self.l3(self.l2(self.l1(x)))


class SelfAttention(nn.Module):
    def __init__(self, dim_in: int, dim_q: int, dim_v: int):
        super().__init__()
        self.q = nn.Linear(dim_in, dim_q)
        self.k = nn.Linear(dim_in, dim_q)
        self.v = nn.Linear(dim_in, dim_v)
        c = (6 / (dim_in + dim_q)) ** 0.5
        nn.init.uniform_(self.q.weight.data, -c, c)
        nn.init.zeros_(self.q.bias.data)
        nn.init.uniform_(self.k.weight.data, -c, c)
        nn.init.zeros_(self.k.bias.data)
        nn.init.uniform_(self.v.weight.data, -c, c)
        nn.init.zeros_(self.v.bias.data)

    def forward(
        self, query: Tensor, key: Tensor, value: Tensor, mask: Tensor = None
    ) -> Tensor:
        Q, K, V = self.q(query), self.k(key), self.v(value)
        y, self.weights_softmax = scaled_dot_product_no_loop_batch(Q, K, V, mask)
        return y


class MultiHeadAttention(nn.Module):
    def __init__(self, num_heads: int, dim_in: int, dim_out: int):
        super().__init__()
        self.heads = nn.ModuleList([
            SelfAttention(dim_in, dim_out, dim_out) for _ in range(num_heads)
        ])
        self.linear_attn = nn.Linear(num_heads * dim_out, dim_in)
        c = (6 / (num_heads * dim_out + dim_in)) ** 0.5
        nn.init.uniform_(self.linear_attn.weight.data, -c, c)
        nn.init.zeros_(self.linear_attn.bias.data) 

    def forward(
        self, query: Tensor, key: Tensor, value: Tensor, mask: Tensor = None
    ) -> Tensor:
        head_outputs = [t(query, key, value, mask) for t in self.heads]
        y = self.linear_attn(torch.cat(head_outputs, dim=-1))
        return y


class EncoderBlock(nn.Module):
    def __init__(
        self, num_heads: int, emb_dim: int, feedforward_dim: int, dropout: float
    ):
        super().__init__()
        if emb_dim % num_heads != 0:
            raise ValueError(
                f"""The value emb_dim = {emb_dim} is not divisible
                             by num_heads = {num_heads}. Please select an
                             appropriate value."""
            )
        self.MultiHeadBlock = MultiHeadAttention(num_heads, emb_dim, emb_dim // num_heads)
        self.normalization_layer = LayerNormalization(emb_dim)
        self.feedforward_block = FeedForwardBlock(emb_dim, feedforward_dim)
        self.dropout_layer = nn.Dropout(dropout)

    def forward(self, x):
        out1 = self.MultiHeadBlock(x, x, x)
        out2 = self.dropout_layer(self.normalization_layer(out1 + x))
        out3 = self.feedforward_block(out2)
        y = self.dropout_layer(self.normalization_layer(out2 + out3))      
        return y


class DecoderBlock(nn.Module):
    def __init__(
        self, num_heads: int, emb_dim: int, feedforward_dim: int, dropout: float
    ):
        super().__init__()
        if emb_dim % num_heads != 0:
            raise ValueError(
                f"""The value emb_dim = {emb_dim} is not divisible
                             by num_heads = {num_heads}. Please select an
                             appropriate value."""
            )
        self.attention_self = MultiHeadAttention(num_heads, emb_dim, emb_dim // num_heads)
        self.attention_cross = MultiHeadAttention(num_heads, emb_dim, emb_dim // num_heads)
        self.feed_forward = FeedForwardBlock(emb_dim, feedforward_dim)
        self.norm1 = LayerNormalization(emb_dim)
        self.norm2 = LayerNormalization(emb_dim)
        self.norm3 = LayerNormalization(emb_dim)
        self.dropout = nn.Dropout(dropout)

    def forward(
        self, dec_inp: Tensor, enc_inp: Tensor, mask: Tensor = None
    ) -> Tensor:
        if mask == None:
            mask = get_subsequent_mask(dec_inp[:, :, 0])
        out1 = self.attention_self(dec_inp, dec_inp, dec_inp, mask)
        out2 = self.dropout(self.norm1(out1))
        out3 = self.attention_cross(out2, enc_inp, enc_inp)
        out4 = self.dropout(self.norm2(out3 + out2))
        out5 = self.feed_forward(out4)
        y = self.dropout(self.norm3(out5 + out4))
        return y

mode = "encode"

if mode == "encode":
    N = 2
    num_heads = 2
    emb_dim = K = 4
    feedforward_dim = 8
    M = inp_emb_size = 4
    out_emb_size = 8
    dropout = 0.2

    enc_seq_inp = torch.linspace(-0.4, 0.6, steps=N * K * M, requires_grad=True).reshape(
        N, K, M
    )  # **to_double_cuda

    enc_block = EncoderBlock(num_heads, emb_dim, feedforward_dim, dropout)

    for k, v in enc_block.named_parameters():
        # print(k, v.shape) # uncomment this to see the weight shape
        v.data.copy_(torch.linspace(-1.4, 1.3, steps=v.numel()).reshape(*v.shape))

    encoder_out1_expected = torch.tensor(
        [[[ 0.00000, -0.31357,  0.69126,  0.00000],
            [ 0.42630, -0.25859,  0.72412,  3.87013],
            [ 0.00000, -0.31357,  0.69126,  3.89884],
            [ 0.47986, -0.30568,  0.69082,  3.90563]],

            [[ 0.00000, -0.31641,  0.69000,  3.89921],
            [ 0.47986, -0.30568,  0.69082,  3.90563],
            [ 0.47986, -0.30568,  0.69082,  3.90563],
            [ 0.51781, -0.30853,  0.71598,  3.85171]]]
    )
    encoder_out1 = enc_block(enc_seq_inp)
    print("EncoderBlock error 1: ", rel_error(encoder_out1, encoder_out1_expected))

if mode == "decode":
    N = 2
    num_heads = 2
    seq_len_enc = K1 = 4
    seq_len_dec = K2 = 4
    feedforward_dim = 4
    M = emb_dim = 4
    out_emb_size = 8
    dropout = 0.2

    dec_inp = torch.linspace(-0.4, 0.6, steps=N * K1 * M, requires_grad=True).reshape(N, K1, M)  
    enc_out = torch.linspace(-0.4, 0.6, steps=N * K2 * M, requires_grad=True).reshape(N, K2, M)  
    dec_block = DecoderBlock(num_heads, emb_dim, feedforward_dim, dropout)

    for k, v in dec_block.named_parameters():
        # print(k, v.shape)
        v.data.copy_(torch.linspace(-1.4, 1.3, steps=v.numel()).reshape(*v.shape))

    dec_out_expected = torch.tensor(
        [[[ 0.46707, -0.31916,  0.66218,  3.95182],
            [ 0.00000, -0.31116,  0.66325,  0.00000],
            [ 0.44538, -0.32419,  0.64068,  3.98847],
            [ 0.49012, -0.31276,  0.68795,  3.90610]],

            [[ 0.45800, -0.33023,  0.64106,  3.98324],
            [ 0.45829, -0.31487,  0.66203,  3.95529],
            [ 0.59787, -0.00000,  0.72361,  0.00000],
            [ 0.70958, -0.37051,  0.78886,  3.63179]]]
    )

    norm = LayerNormalization(K1)
    inp = torch.linspace(-0.4, 0.6, steps=N * K1, requires_grad=True).reshape(N, K1)
    inp.retain_grad()

    dec_out2 = dec_block(dec_inp, enc_out)
    print(dec_out2)
    print("DecoderBlock error: ", rel_error(dec_out2, dec_out_expected))