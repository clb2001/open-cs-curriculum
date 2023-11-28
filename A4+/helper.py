import torch
import torch.nn.functional as F
from torch import Tensor, nn, optim
import random

def reset_seed(number):
    random.seed(number)
    torch.manual_seed(number)
    return

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
        mask = get_subsequent_mask(dec_inp[:, :, 0])
        out1 = self.attention_self(dec_inp, dec_inp, dec_inp)
        tmp = self.norm1(dec_inp + out1)
        # N, K, M = dec_inp.shape
        # norm1 = torch.nn.LayerNorm(normalized_shape=(K, M))
        y = self.dropout(tmp)
        return y

reset_seed(0)
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

dec_out2 = dec_block(dec_inp, enc_out)
print(dec_out2)