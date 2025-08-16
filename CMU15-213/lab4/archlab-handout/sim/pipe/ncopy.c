#include <stdio.h>

typedef long long;

long src[8], dst[8];

/* $begin ncopy */
/*
 * ncopy - copy src to dst, returning number of positive ints
 * contained in src array.
 */

// word_t ncopy(word_t *src, word_t *dst, word_t len){
//     word_t count = 0;
//     word_t val;

//     while (len > 0) {
//         val = *src++;
//         *dst++ = val;
//         if (val > 0)
//             count++;
//         len--;
//     }

//     return count;
// }

long ncopy(long *src, long *dst, long len)
{
    long count = 0;
    long val;

    while (len > 5)
    {
        val = *src++;
        *dst++ = val;
        count += (val > 0); 

        val = *src++;
        *dst++ = val;
        count += (val > 0); 
        
        val = *src++;
        *dst++ = val;
        count += (val > 0); 
        
        val = *src++;
        *dst++ = val;
        count += (val > 0); 
        
        val = *src++;
        *dst++ = val;
        count += (val > 0); 
        
        val = *src++;
        *dst++ = val;
        count += (val > 0); 
        
        len -= 6;
    }

    while (len > 0)
    {
        val = *src++;
        *dst++ = val;
        count += (val > 0);
        len--;
    }
    return count;
}
/* $end ncopy */

int main()
{
    long i, count;

    for (i = 0; i < 8; i++)
        src[i] = i + 1;
    count = ncopy(src, dst, 8);
    printf("count=%d\n", count);
    exit(0);
}
