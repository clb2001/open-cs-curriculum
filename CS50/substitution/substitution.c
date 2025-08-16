#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

bool repeat(char *arg);
bool alpha(char *arg);
char *decode(char *arg, char *input);

int main(int argc, string argv[])
{
    if (argv[1] == NULL)
    {
        printf("Usage: ./substitution key\n");
        return 1;
    }
    else if (strlen(argv[1]) != 26 & argc == 2)
    {
        printf("Key must contain 26 characters.\n");
        return 1;
    }
    else if (strlen(argv[1]) == 26)
    {
        if (argc != 2 || alpha(argv[1]) || repeat(argv[1]))
        {
            printf("Usage: ./substitution key\n");
            return 1;
        }
    }
    //get the input
    string input = get_string("plaintext: ");

    char *outputs;
    outputs = decode(argv[1], input);

    //get the output
    printf("ciphertext: %s\n", outputs);
    //printf("outcome: %d\n", islower(input[0]));
    free(outputs);
    return 0;
}

bool alpha(char *arg)
{
    for (int i = 0; i < strlen(arg); i++)
    {
        if (!(isalpha(arg[i])))
        {
            return true;
        }
    }
    return false;
}

bool repeat(char *arg)
{
    int len = 26;
    char *dest = malloc(26 * sizeof(char));
    char *src = malloc(26 * sizeof(char));
    //memset(dest, '\0', sizeof(dest));
    strcpy(src, arg);
    strcpy(dest, src);
    int flag = 0;
    for (int i = 0; i < len - 1; i++)
    {
        for (int j = i + 1; j < len; j++)
        {
            if (dest[i] == arg[j])
            {
                return true;
            }
        }
    }
    return false;
}

char *decode(char *arg, char *input)
{
    char *output = malloc((strlen(input)) * sizeof(char));
    for (int i = 0; i < strlen(input); i++)
    {
        if (isalpha(input[i]))
        {
            if (islower(input[i]) & islower(arg[input[i] - 'a']))
            {
                // I was overwhelmed then.
                // If isupper is true, it returns 256
                // If islower is true, it returns 512
                // So all conditions hold, the result may not be true.
                // Jesus!
                // char *str1 = strchr(arg, input[i]);
                // int index1 = str1 - arg;
                output[i] = arg[input[i] - 'a'];
                //printf("convert: %d", input[i] - 'a');
            }
            else if (isupper(input[i]) & isupper(arg[tolower(input[i]) - 'a']))
            {
                // I was overwhelmed then.
                // char *str1 = strchr(arg, input[i]);
                // int index1 = str1 - arg;
                output[i] = arg[tolower(input[i]) - 'a'];
                //printf("convert: %d\n", tolower(input[i]) - 'a');
            }
            else if (islower(input[i]) & (isupper(arg[input[i] - 'a']) + 256))
            {
                // char *str2 = strchr(arg, input[i]);
                // int index2 = str2 - arg;
                output[i] = tolower(arg[input[i] - 'a']);
                //printf("convert: %d\n", input[i] - 'a');
            }
            else if (isupper(input[i]) & (islower(arg[tolower(input[i]) - 'a']) - 256))
            {
                // char *str3 = strchr(arg, input[i]);
                // int index3 = str3 - arg;
                output[i] = toupper(arg[tolower(input[i]) - 'a']);
                //printf("convert: %d\n", tolower(input[i]) - 'a');
            }
        }
        else
        {
            output[i] = input[i];
            //printf("OUTPUT is: %c\n", output[i]);
        }
    }
    //printf("output is: %s\n", output);
    return output;
}