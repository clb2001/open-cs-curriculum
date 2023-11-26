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


class SelfAttention(nn.Module):
    def __init__(self, dim_in: int, dim_q: int, dim_v: int):
        super().__init__()
        self.q = nn.Linear(dim_in, dim_q)
        self.k = nn.Linear(dim_in, dim_q)
        self.v = nn.Linear(dim_in, dim_v) # 这里要注意不是dim_q
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
        self.norm1 = LayerNormalization(emb_dim)
        self.dropout = nn.Dropout(dropout)

    def forward(
        self, dec_inp: Tensor, enc_inp: Tensor, mask: Tensor = None
    ) -> Tensor:
        N, K, M = dec_inp.shape
        mask = get_subsequent_mask(dec_inp[:, :, 0])
        out1 = self.attention_self(dec_inp, dec_inp, dec_inp, mask)
        y = self.dropout(self.norm1(dec_inp + out1))
        return y


N = 2
num_heads = 2
seq_len_enc = K1 = 4
seq_len_dec = K2 = 4
feedforward_dim = 4
M = emb_dim = 4
out_emb_size = 8
dropout = 0.2

dec_inp = torch.linspace(-0.4, 0.6, steps=N * K1 * M, requires_grad=True).reshape(
    N, K1, M
)  
enc_out = torch.linspace(-0.4, 0.6, steps=N * K2 * M, requires_grad=True).reshape(
    N, K2, M
)  
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
y = norm(inp)
print(y)
y_expected = torch.tensor(
    [[-1.34164, -0.44721, 0.44721, 1.34164], [-1.34164, -0.44721, 0.44721, 1.34164]]
)
print("LayerNormalization error: ", rel_error(y_expected, y))

dec_out2 = dec_block(dec_inp, enc_out)

print(dec_out2)

print("DecoderBlock error: ", rel_error(dec_out2, dec_out_expected))


# softmax
# out1: 
# tensor([[[-1.6776, -0.5399,  0.5978,  1.7355],
#          [-1.5238, -0.4301,  0.6636,  1.7574],
#          [-1.3200, -0.2845,  0.7509,  1.7864],
#          [-1.0614, -0.0998,  0.8617,  1.8232]],

#         [[-0.6377,  0.2027,  1.0431,  1.8835],
#          [-0.4347,  0.3477,  1.1301,  1.9124],
#          [-0.1839,  0.5268,  1.2375,  1.9481],
#          [ 0.0867,  0.7200,  1.3533,  1.9866]]], grad_fn=<ViewBackward0>)
# out1 + dec_inp: 
# tensor([[[-2.0776, -0.9077,  0.2623,  1.4322],
#          [-1.7948, -0.6688,  0.4572,  1.5832],
#          [-1.4619, -0.3942,  0.6735,  1.7412],
#          [-1.0743, -0.0805,  0.9133,  1.9071]],

#         [[-0.5216,  0.3511,  1.2237,  2.0964],
#          [-0.1895,  0.6251,  1.4397,  2.2544],
#          [ 0.1903,  0.9332,  1.6762,  2.4191],
#          [ 0.5899,  1.2555,  1.9211,  2.5866]]], grad_fn=<AddBackward0>)
# --> normalization
# tensor([[[ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441]],

#         [[ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441]]], grad_fn=<AddBackward0>)


# no mask softmax
# out1:
# tensor([[[-1.2404, -0.2277,  0.7850,  1.7977],
#          [-1.1715, -0.1785,  0.8145,  1.8075],
#          [-1.1110, -0.1353,  0.8404,  1.8161],
#          [-1.0614, -0.0998,  0.8617,  1.8232]],

#         [[ 0.0176,  0.6707,  1.3237,  1.9768],
#          [ 0.0474,  0.6920,  1.3365,  1.9811],
#          [ 0.0699,  0.7080,  1.3461,  1.9842],
#          [ 0.0867,  0.7200,  1.3533,  1.9866]]], grad_fn=<ViewBackward0>)
# dec_inp + out1:
# tensor([[[-1.6404, -0.5955,  0.4495,  1.4945],
#          [-1.4424, -0.4172,  0.6081,  1.6333],
#          [-1.2530, -0.2450,  0.7630,  1.7710],
#          [-1.0743, -0.0805,  0.9133,  1.9071]],

#         [[ 0.1337,  0.8191,  1.5044,  2.1897],
#          [ 0.2926,  0.9694,  1.6462,  2.3230],
#          [ 0.4441,  1.1145,  1.7848,  2.4552],
#          [ 0.5899,  1.2555,  1.9211,  2.5866]]], grad_fn=<AddBackward0>)
# --> normalization
# tensor([[[ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441]],

#         [[ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441],
#          [ 0.4783, -0.2764,  0.5789,  3.0441]]], grad_fn=<AddBackward0>)