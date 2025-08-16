#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // int a = get_int("Height:");
    int a;
    do
    {
        a = get_int("Height: ");
    }
    while (a <= 0 || a > 8);

    for (int i = 1; i <= a; i++)
    {
        for (int j = 1; j <= a - i; j++)
        {
            printf(" ");
        }
        for (int j = 1; j <= i; j++)
        {
            printf("#");
        }
        for (int j = 1; j <= 2; j++)
        {
            printf(" ");
        }
        for (int j = 1; j <= i; j++)
        {
            printf("#");
        }
        printf("\n");
    }
}