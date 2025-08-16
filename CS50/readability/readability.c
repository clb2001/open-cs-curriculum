#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);

int main(void)
{
    string a = get_string("Text: ");
    int num_letters = count_letters(a);
    int num_words = count_words(a);
    int num_sentences = count_sentences(a);
    // printf("%d\n", num_letters);
    // printf("%d\n", num_words);
    // printf("%d\n", num_sentences);
    double L = 100 * num_letters / (double)num_words;
    // printf("%f\n", L);
    double S = 100 * num_sentences / (double)num_words;
    // printf("%f\n", S);
    double index = 0.0588 * L - 0.296 * S - 15.8;
    // printf("%f\n", index);

    if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (1 <= index & index < 15.5) //pay attention to 1 <= index < 15.5, wrong!
    {
        if (index - (int)index < 0.5)
        {
            printf("Grade %d\n", (int)index);
        }
        else
        {
            printf("Grade %d\n", (int)(index + 1));
        }
    }
    else
    {
        printf("Grade 16+\n");
    }
}

int count_letters(string text)
{
    int num = 0;
    int len_letters = strlen(text);
    //string all = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
    for (int i = 0; i < len_letters; i++)
    {
        if (islower(text[i]) || isupper(text[i]))
        {
            num += 1;
        }
        else
        {
            num += 0;
        }
    }
    return num;
}

int count_words(string text)
{
    int num = 1;
    int len_letters = strlen(text);
    for (int i = 0; i < len_letters; i++)
    {
        if ((int)text[i] == 32)
        {
            num += 1;
        }
        else
        {
            num += 0;
        }
    }
    return num;
}

int count_sentences(string text)
{
    int num = 0;
    int len_letters = strlen(text);
    for (int i = 0; i < len_letters; i++)
    {
        if ((int)text[i] == 46 || (int)text[i] == 63 || (int)text[i] == 33)
        {
            num += 1;
        }
        else
        {
            num += 0;
        }
    }
    return num;
}