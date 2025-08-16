//1.1.c

#include <stdio.h>
#include <stdlib.h>

#define BUFFER_SIZE 10

unsigned getbuf()
{
    char buf[BUFFER_SIZE];
    Gets(buf);
    return 1;
}

void test() 
{
    int val;
    val = getbuf();
    printf("No exploit. Getbuf returned 0x%x\n", val);
}

void touch1()
{
    int vlevel = 1; /* Part of validation protocol */
    printf("Touch1!: You called touch1()\n");
    validate(1);
    exit(0);
}

void touch2(unsigned val)
{
    int vlevel = 2; /* Part of validation protocol */
    
    if (val == 0x59b997fa) 
    {
        printf("Touch2!: You called touch2(0x%.8x)\n", val);
        validate(2);
    }
    else 
    {
        printf("Misfire: You called touch2(0x%.8x)\n", val);
        fail(2);
    } 
    exit(0);
}

/* Compare string to hex represention of unsigned value */
int hexmatch(unsigned val, char *sval)
{
    char cbuf[110];
    /* Make position of check string unpredictable */
    char *s = cbuf + random() % 100;
    sprintf(s, "%.8x", val);
    return strncmp(sval, s, 9) == 0;
}

void touch3(char *sval)
{
    int vlevel = 3; /* Part of validation protocol */
    if (hexmatch(0x59b997fa, sval)) {
        printf("Touch3!: You called touch3(\"%s\")\n", sval);
        validate(3);
    } else {
        printf("Misfire: You called touch3(\"%s\")\n", sval);
        fail(3);
    }
    exit(0);
}

int main(int argc, char* argv[]){
    test();
    return 0;
}