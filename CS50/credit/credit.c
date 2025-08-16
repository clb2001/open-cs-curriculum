#include <cs50.h>
#include <stdio.h>

int length(long b);
int sum(long b, int bit);
int divide(long b, int bit);
bool Luhn(int num[], int bit);

int main(void)
{
    long a;
    do
    {
        a = get_long("Number: ");
    }
    while (a <= 0);

    long b = a;
    int bit = length(b);
    int num_sum = sum(b, bit);
    int num[bit];

    //将号码拆开，不过C语言不允许返回数组
    for (int i = 0; i < bit; i++)
    {
        num[i] = b % 10;
        b /= 10;
    }

    printf("%d\n", Luhn(num, bit));
    printf("%d\n", bit);
    printf("%d\n", num[bit - 1]);

    if ((num[bit - 1] == 3) & (num[bit - 2] == 4 || num[bit - 2] == 7) & Luhn(num, bit) & bit == 15)
    {
        printf("AMEX\n");
    }
    else if ((num[bit - 1] == 5) & (num[bit - 2] == 1 || num[bit - 2] == 2 || num[bit - 2] == 3 || num[bit - 2] == 4
                                    || num[bit - 2] == 5)
             & Luhn(num, bit) & bit == 16)
    {
        printf("MASTERCARD\n");
    }
    else if ((num[bit - 1] == 4) & Luhn(num, bit) & (bit == 13 || bit == 16))
    {
        printf("VISA\n");
    }
    else
    {
        printf("INVALID\n");
    }
}

//获得号码的位数，可以把它封装成一个函数
int length(long b)
{
    int bit = 1;
    int a;
    do
    {
        a = b / 10;
        b /= 10;
        bit++;
    }
    while (a >= 10 || a < 0);
    //printf("%d\n",bit);
    return bit;
}

//获得号码、编码的位数之和
int sum(long b, int bit)
{
    int number = 0;
    for (int i = 0; i < bit; i++)
    {
        number += b % 10;
        b /= 10;
    }
    // printf("%d",bit);
    //printf("%d\n",num[bit-2]);
    return number;
}

//判别函数
bool Luhn(int num[], int bit)
{
    int c = 0;
    int d = 0;
    int e;
    for (int j = 1; j < bit; j += 2)
    {
        int bit_s = length(2 * num[j]);
        c += sum(2 * num[j], bit_s);
    }
    for (int j = 0; j < bit; j += 2)
    {
        d += num[j];
    }
    e = c + d;
    // printf("%d\n",num[1]);
    // printf("%d\n",bit);
    // printf("%d\n",c);
    // printf("%d\n",d);
    // printf("%d\n",e);
    // 还需要对c进行分解
    if (e % 10 == 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}