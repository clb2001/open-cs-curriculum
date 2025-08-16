#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>

// Points assigned to each letter of the alphabet
int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int compute_score(string word);

int main(void)
{
    // Get input words from both players
    string word1 = get_string("Player 1: ");
    string word2 = get_string("Player 2: ");

    // Score both words
    int score1 = compute_score(word1);
    int score2 = compute_score(word2);

    // TODO: Print the winner
    if (score1 > score2)
    {
        printf("Player 1 wins!\n");
    }
    if (score1 < score2)
    {
        printf("Player 2 wins!\n");
    }
    if (score1 == score2)
    {
        printf("Tie!\n");
    }
}

int compute_score(string word)
{
    // TODO: Compute and return score for string
    int len = strlen(word);
    int score = 0;
    for (int i = 0; i < len; i++)
    {
        if (islower(word[i]))
            score += POINTS[word[i] - 'a'];
        else if (isupper(word[i]))
            score += POINTS[word[i] - 'A'];
        else
            score += 0;
    // ugly!
    // for (int i = 0; i < len; i++)
    // {
    //     if (word[i] == 'a' || word[i] == 'A'
    //         || word[i] == 'e' || word[i] == 'E'
    //         || word[i] == 'i' || word[i] == 'I'
    //         || word[i] == 'l' || word[i] == 'L'
    //         || word[i] == 'n' || word[i] == 'N'
    //         || word[i] == 'o' || word[i] == 'O'
    //         || word[i] == 'r' || word[i] == 'R'
    //         || word[i] == 't' || word[i] == 'T'
    //         || word[i] == 'u' || word[i] == 'U'
    //         || word[i] == 's' || word[i] == 'S')
    //     {
    //         score += 1;
    //     }
    //     else if (word[i] == 'b' || word[i] == 'B'
    //              || word[i] == 'c' || word[i] == 'C'
    //              || word[i] == 'm' || word[i] == 'M'
    //              || word[i] == 'p' || word[i] == 'P')
    //     {
    //         score += 3;
    //     }
    //     else if (word[i] == 'd' || word[i] == 'D'
    //              || word[i] == 'g' || word[i] == 'G')
    //     {
    //         score += 2;
    //     }
    //     else if (word[i] == 'f' || word[i] == 'F'
    //              || word[i] == 'h' || word[i] == 'H'
    //              || word[i] == 'v' || word[i] == 'V'
    //              || word[i] == 'w' || word[i] == 'W'
    //              || word[i] == 'y' || word[i] == 'Y')
    //     {
    //         score += 4;
    //     }
    //     else if (word[i] == 'j' || word[i] == 'J'
    //              || word[i] == 'x' || word[i] == 'X')
    //     {
    //         score += 8;
    //     }
    //     else if (word[i] == 'k' || word[i] == 'K')
    //     {
    //         score += 5;
    //     }
    //     else if (word[i] == 'q' || word[i] == 'Q'
    //              || word[i] == 'z' || word[i] == 'Z')
    //     {
    //         score += 10;
    //     }
    //     else
    //     {
    //         score += 0;
    //     }
    }
    return score;
}
