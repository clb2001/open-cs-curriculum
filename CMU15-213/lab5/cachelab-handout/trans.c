/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    if (M == 32 && N == 32){
        int k1, k2, k3, k4, k5, k6, k7, k8;
        int i, j;
        int size = 8;
        int i1;
        for (j = 0; j < M; j += size) {
            for (i = 0; i < N; i += size) {
                for (i1 = i; i1 < i + size; ++i1){
                    k1 = A[i1][j];
                    k2 = A[i1][j+1];
                    k3 = A[i1][j+2];
                    k4 = A[i1][j+3];
                    k5 = A[i1][j+4];
                    k6 = A[i1][j+5];
                    k7 = A[i1][j+6];
                    k8 = A[i1][j+7];
                    B[j][i1] = k1;
                    B[j+1][i1] = k2;
                    B[j+2][i1] = k3;
                    B[j+3][i1] = k4;
                    B[j+4][i1] = k5;
                    B[j+5][i1] = k6;
                    B[j+6][i1] = k7;
                    B[j+7][i1] = k8;
                }
            }
        } 
    }

    if (M == 64 && N == 64){
        int k1, k2, k3, k4, k5, k6, k7, k8;
        int i, j;
        int i1, j1;
        for (i = 0; i < N; i += 8) {
            for (j = 0; j < M; j += 8) {
                // convert A11 to B11 and convert A12 to B12
                for (i1 = i; i1 < i + 4; ++i1){
                    k1 = A[i1][j];
                    k2 = A[i1][j+1];
                    k3 = A[i1][j+2];
                    k4 = A[i1][j+3];

                    k5 = A[i1][j+4];
                    k6 = A[i1][j+5];
                    k7 = A[i1][j+6];
                    k8 = A[i1][j+7];

                    B[j][i1] = k1;
                    B[j+1][i1] = k2;
                    B[j+2][i1] = k3;
                    B[j+3][i1] = k4;

                    B[j][i1+4] = k5; 
                    B[j+1][i1+4] = k6;
                    B[j+2][i1+4] = k7;
                    B[j+3][i1+4] = k8;
                }
                // convert A21 to B21 and convert A22 to B22 and swap
                // directly swap!!!!!!
                for (j1 = j; j1 < j + 4; ++j1){
                    // caution the sequence!
                    k1 = A[i+4][j1];
                    k2 = A[i+5][j1];
                    k3 = A[i+6][j1];
                    k4 = A[i+7][j1];

                    k5 = B[j1][i+4];
                    k6 = B[j1][i+5];
                    k7 = B[j1][i+6];
                    k8 = B[j1][i+7];

                    B[j1][i+4] = k1;
                    B[j1][i+5] = k2;
                    B[j1][i+6] = k3;
                    B[j1][i+7] = k4;

                    B[j1+4][i] = k5; 
                    B[j1+4][i+1] = k6;
                    B[j1+4][i+2] = k7;
                    B[j1+4][i+3] = k8;
                }
                for (i1 = i + 4; i1 < i + 8; ++i1){
                    k5 = A[i1][j+4];
                    k6 = A[i1][j+5];
                    k7 = A[i1][j+6];
                    k8 = A[i1][j+7];
                    B[j+4][i1] = k5; 
                    B[j+5][i1] = k6;
                    B[j+6][i1] = k7;
                    B[j+7][i1] = k8;
                }
            }
        } 
    }

    if (M == 61 && N == 67){
        int k1, k2, k3, k4, k5, k6, k7, k8;
        int i, j;
        int i1, j1;
        for (i = 0; i < 64; i += 8) {
            for (j = 0; j < 56; j += 8) {
                // convert A11 to B11 and convert A12 to B12
                for (i1 = i; i1 < i + 4; ++i1){
                    k1 = A[i1][j];
                    k2 = A[i1][j+1];
                    k3 = A[i1][j+2];
                    k4 = A[i1][j+3];

                    k5 = A[i1][j+4];
                    k6 = A[i1][j+5];
                    k7 = A[i1][j+6];
                    k8 = A[i1][j+7];

                    B[j][i1] = k1;
                    B[j+1][i1] = k2;
                    B[j+2][i1] = k3;
                    B[j+3][i1] = k4;

                    B[j][i1+4] = k5; 
                    B[j+1][i1+4] = k6;
                    B[j+2][i1+4] = k7;
                    B[j+3][i1+4] = k8;
                }
                // convert A21 to B21 and convert A22 to B22 and swap
                // directly swap!!!!!!
                for (j1 = j; j1 < j + 4; ++j1){
                    // caution the sequence!
                    k1 = A[i+4][j1];
                    k2 = A[i+5][j1];
                    k3 = A[i+6][j1];
                    k4 = A[i+7][j1];

                    k5 = B[j1][i+4];
                    k6 = B[j1][i+5];
                    k7 = B[j1][i+6];
                    k8 = B[j1][i+7];

                    B[j1][i+4] = k1;
                    B[j1][i+5] = k2;
                    B[j1][i+6] = k3;
                    B[j1][i+7] = k4;

                    B[j1+4][i] = k5; 
                    B[j1+4][i+1] = k6;
                    B[j1+4][i+2] = k7;
                    B[j1+4][i+3] = k8;
                }
                for (i1 = i + 4; i1 < i + 8; ++i1){
                    k5 = A[i1][j+4];
                    k6 = A[i1][j+5];
                    k7 = A[i1][j+6];
                    k8 = A[i1][j+7];
                    B[j+4][i1] = k5; 
                    B[j+5][i1] = k6;
                    B[j+6][i1] = k7;
                    B[j+7][i1] = k8;
                }
            }
        } 
        for (i = 64; i < 67; i += 3){
            for (j = 0; j < 60; j += 3){
                for (i1 = i; i1 < i + 3; ++i1){
                    k1 = A[i1][j];
                    k2 = A[i1][j+1];
                    k3 = A[i1][j+2];
                    B[j][i1] = k1;
                    B[j+1][i1] = k2;
                    B[j+2][i1] = k3;
                }
            }
        }
        for (i = 0; i < 64; i += 4){
            for (i1 = i; i1 < i + 4; ++i1){
                k1 = A[i1][56];
                k2 = A[i1][57];
                k3 = A[i1][58];
                k4 = A[i1][59];
                k5 = A[i1][60];
                B[56][i1] = k1;
                B[57][i1] = k2;
                B[58][i1] = k3;
                B[59][i1] = k4;
                B[60][i1] = k5;
            }
        }
        for (i = 64; i < 67; ++i){
            B[60][i] = A[i][60];
        }       
    }
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc_1[] = "result for 32*32: ";
void trans_1(int M, int N, int A[N][M], int B[M][N])
{
    int k1, k2, k3, k4, k5, k6, k7, k8;
    int i, j;
    int size = 8;
    int i1;
    for (j = 0; j < M; j += size) {
        for (i = 0; i < N; i += size) {
            for (i1 = i; i1 < i + size; ++i1){
                k1 = A[i1][j];
                k2 = A[i1][j+1];
                k3 = A[i1][j+2];
                k4 = A[i1][j+3];
                k5 = A[i1][j+4];
                k6 = A[i1][j+5];
                k7 = A[i1][j+6];
                k8 = A[i1][j+7];
                B[j][i1] = k1;
                B[j+1][i1] = k2;
                B[j+2][i1] = k3;
                B[j+3][i1] = k4;
                B[j+4][i1] = k5;
                B[j+5][i1] = k6;
                B[j+6][i1] = k7;
                B[j+7][i1] = k8;
            }
        }
    } 
}

char trans_desc_2[] = "result for 64*64: ";
void trans_2(int M, int N, int A[N][M], int B[M][N])
{
    int k1, k2, k3, k4, k5, k6, k7, k8;
    int i, j;
    int i1, j1;
    for (i = 0; i < N; i += 8) {
        for (j = 0; j < M; j += 8) {
            // convert A11 to B11 and convert A12 to B12
            for (i1 = i; i1 < i + 4; ++i1){
                k1 = A[i1][j];
                k2 = A[i1][j+1];
                k3 = A[i1][j+2];
                k4 = A[i1][j+3];

                k5 = A[i1][j+4];
                k6 = A[i1][j+5];
                k7 = A[i1][j+6];
                k8 = A[i1][j+7];

                B[j][i1] = k1;
                B[j+1][i1] = k2;
                B[j+2][i1] = k3;
                B[j+3][i1] = k4;

                B[j][i1+4] = k5; 
                B[j+1][i1+4] = k6;
                B[j+2][i1+4] = k7;
                B[j+3][i1+4] = k8;
            }
            // convert A21 to B21 and convert A22 to B22 and swap
            // directly swap!!!!!!
            for (j1 = j; j1 < j + 4; ++j1){
                // caution the sequence!
                k1 = A[i+4][j1];
                k2 = A[i+5][j1];
                k3 = A[i+6][j1];
                k4 = A[i+7][j1];

                k5 = B[j1][i+4];
                k6 = B[j1][i+5];
                k7 = B[j1][i+6];
                k8 = B[j1][i+7];

                B[j1][i+4] = k1;
                B[j1][i+5] = k2;
                B[j1][i+6] = k3;
                B[j1][i+7] = k4;

                B[j1+4][i] = k5; 
                B[j1+4][i+1] = k6;
                B[j1+4][i+2] = k7;
                B[j1+4][i+3] = k8;
            }
            for (i1 = i + 4; i1 < i + 8; ++i1){
                k5 = A[i1][j+4];
                k6 = A[i1][j+5];
                k7 = A[i1][j+6];
                k8 = A[i1][j+7];
                B[j+4][i1] = k5; 
                B[j+5][i1] = k6;
                B[j+6][i1] = k7;
                B[j+7][i1] = k8;
            }
        }
    }       
}

char trans_desc_3[] = "result for 61*67: ";
void trans_3(int M, int N, int A[N][M], int B[M][N])
{
    int k1, k2, k3, k4, k5, k6, k7, k8;
    int i, j;
    int i1, j1;
    for (i = 0; i < 64; i += 8) {
        for (j = 0; j < 56; j += 8) {
            // convert A11 to B11 and convert A12 to B12
            for (i1 = i; i1 < i + 4; ++i1){
                k1 = A[i1][j];
                k2 = A[i1][j+1];
                k3 = A[i1][j+2];
                k4 = A[i1][j+3];

                k5 = A[i1][j+4];
                k6 = A[i1][j+5];
                k7 = A[i1][j+6];
                k8 = A[i1][j+7];

                B[j][i1] = k1;
                B[j+1][i1] = k2;
                B[j+2][i1] = k3;
                B[j+3][i1] = k4;

                B[j][i1+4] = k5; 
                B[j+1][i1+4] = k6;
                B[j+2][i1+4] = k7;
                B[j+3][i1+4] = k8;
            }
            // convert A21 to B21 and convert A22 to B22 and swap
            // directly swap!!!!!!
            for (j1 = j; j1 < j + 4; ++j1){
                // caution the sequence!
                k1 = A[i+4][j1];
                k2 = A[i+5][j1];
                k3 = A[i+6][j1];
                k4 = A[i+7][j1];

                k5 = B[j1][i+4];
                k6 = B[j1][i+5];
                k7 = B[j1][i+6];
                k8 = B[j1][i+7];

                B[j1][i+4] = k1;
                B[j1][i+5] = k2;
                B[j1][i+6] = k3;
                B[j1][i+7] = k4;

                B[j1+4][i] = k5; 
                B[j1+4][i+1] = k6;
                B[j1+4][i+2] = k7;
                B[j1+4][i+3] = k8;
            }
            for (i1 = i + 4; i1 < i + 8; ++i1){
                k5 = A[i1][j+4];
                k6 = A[i1][j+5];
                k7 = A[i1][j+6];
                k8 = A[i1][j+7];
                B[j+4][i1] = k5; 
                B[j+5][i1] = k6;
                B[j+6][i1] = k7;
                B[j+7][i1] = k8;
            }
        }
    } 
    for (i = 64; i < 67; i += 3){
        for (j = 0; j < 60; j += 3){
            for (i1 = i; i1 < i + 3; ++i1){
                k1 = A[i1][j];
                k2 = A[i1][j+1];
                k3 = A[i1][j+2];
                B[j][i1] = k1;
                B[j+1][i1] = k2;
                B[j+2][i1] = k3;
            }
        }
    }
    for (i = 0; i < 64; i += 4){
        for (i1 = i; i1 < i + 4; ++i1){
            k1 = A[i1][56];
            k2 = A[i1][57];
            k3 = A[i1][58];
            k4 = A[i1][59];
            k5 = A[i1][60];
            B[56][i1] = k1;
            B[57][i1] = k2;
            B[58][i1] = k3;
            B[59][i1] = k4;
            B[60][i1] = k5;
        }
    }

    for (i = 64; i < 67; ++i){
        B[60][i] = A[i][60];
    }
}

char trans_desc_4[] = "size = 4, temp";
void trans_4(int M, int N, int A[N][M], int B[M][N])
{
    int k1, k2, k3, k4, k5, k6, k7, k8;
    int i, j;
    int i1, j1;
    for (i = 0; i < 64; i += 8) {
        for (j = 0; j < 56; j += 8) {
            // convert A11 to B11 and convert A12 to B12
            for (i1 = i; i1 < i + 4; ++i1){
                k1 = A[i1][j];
                k2 = A[i1][j+1];
                k3 = A[i1][j+2];
                k4 = A[i1][j+3];

                k5 = A[i1][j+4];
                k6 = A[i1][j+5];
                k7 = A[i1][j+6];
                k8 = A[i1][j+7];

                B[j][i1] = k1;
                B[j+1][i1] = k2;
                B[j+2][i1] = k3;
                B[j+3][i1] = k4;

                B[j][i1+4] = k5; 
                B[j+1][i1+4] = k6;
                B[j+2][i1+4] = k7;
                B[j+3][i1+4] = k8;
            }
            // convert A21 to B21 and convert A22 to B22 and swap
            // directly swap!!!!!!
            for (j1 = j; j1 < j + 4; ++j1){
                // caution the sequence!
                k1 = A[i+4][j1];
                k2 = A[i+5][j1];
                k3 = A[i+6][j1];
                k4 = A[i+7][j1];

                k5 = B[j1][i+4];
                k6 = B[j1][i+5];
                k7 = B[j1][i+6];
                k8 = B[j1][i+7];

                B[j1][i+4] = k1;
                B[j1][i+5] = k2;
                B[j1][i+6] = k3;
                B[j1][i+7] = k4;

                B[j1+4][i] = k5; 
                B[j1+4][i+1] = k6;
                B[j1+4][i+2] = k7;
                B[j1+4][i+3] = k8;
            }
            for (i1 = i + 4; i1 < i + 8; ++i1){
                k5 = A[i1][j+4];
                k6 = A[i1][j+5];
                k7 = A[i1][j+6];
                k8 = A[i1][j+7];
                B[j+4][i1] = k5; 
                B[j+5][i1] = k6;
                B[j+6][i1] = k7;
                B[j+7][i1] = k8;
            }
        }
    } 
    for (i = 64; i < 67; i += 3){
        for (j = 0; j < 60; j += 3){
            for (i1 = i; i1 < i + 3; ++i1){
                k1 = A[i1][j];
                k2 = A[i1][j+1];
                k3 = A[i1][j+2];
                B[j][i1] = k1;
                B[j+1][i1] = k2;
                B[j+2][i1] = k3;
            }
        }
    }
    for (i = 0; i < 64; i += 4){
        for (i1 = i; i1 < i + 4; ++i1){
            k1 = A[i1][56];
            k2 = A[i1][57];
            k3 = A[i1][58];
            k4 = A[i1][59];
            k5 = A[i1][60];
            B[56][i1] = k1;
            B[57][i1] = k2;
            B[58][i1] = k3;
            B[59][i1] = k4;
            B[60][i1] = k5;
        }
    }

    for (i = 64; i < 67; ++i){
        B[60][i] = A[i][60];
    }   
}

char trans_desc_5[] = "orig";
void trans_5(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp, i1, j1;
    int size = 16;
    for (i = 0; i < 64; i += size) {
        for (j = 0; j < 48; j += size) {
            for (i1 = i; i1 < i + size; ++i1){
                for (j1 = j; j1 < j + size; ++j1){
                    tmp = A[i1][j1];
                    B[j1][i1] = tmp;
                }
            }
        }
    }  
    for (i = 64; i < 67; ++i){
        for (j = 0; j < 48; ++j){
            B[j][i] = A[i][j];
        }
    } 
    for (i = 0; i < 67; ++i){
        for (j = 48; j < 61; ++j){
            B[j][i] = A[i][j];
        }
    }
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    // registerTransFunction(trans_1, trans_desc_1); 
    // registerTransFunction(trans_2, trans_desc_2); 
    // registerTransFunction(trans_3, trans_desc_3); 
    // registerTransFunction(trans_4, trans_desc_4); 
    registerTransFunction(trans_5, trans_desc_5); 
}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}
// 跨磁盘跑得太慢啦！