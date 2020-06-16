/* netid : alhill@unm.edu  
 * Date Nov 26th 2019
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 * References https://github.com/chrzhang/computer_systems_architecture_and_programming/blob/master/Cache%20Lab/cachelab-handout/trans.c
 * https://www.tutorialgateway.org/transpose-of-a-matrix-in-c/ 
*/ 
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);



/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
  int i, j, tmp;

  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++) {
      tmp = A[i][j];
      B[j][i] = tmp;
    }
  }

}

char transpose_submit_desc[] = "Transpose submission";
/*
  * transpose_submit - This is the solution transpose function that you
  *     will be graded on for Part B of the assignment. Do not change
  *     the description string "Transpose submission", as the driver
  *     searches for that string to identify the transpose function to
  *     be graded.
  */
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
  int i, j, tmp = 0, vert = 0, hori = 0; // i and j are indexes. Buff is an intermediary value, for use in diagonal
  int buff = 0;                                     // transposition. Vert and hori both represent movement through corresponding planes
  if (N == 32){  // 32x32 square
    for(vert = 0; vert < N; vert += 8){ // Traverses horizontally through blocks via N by size of block
      for(hori = 0; hori < N; hori += 8){ // Traverse vertically through blocks via M by size of block
	for(i = hori; i < hori+8; i++){ // Progress by row via i
	  for(j = vert; j < vert+8; j++){ // Progress by column via j
	    if(i != j){ // If the index are not set equal, than the current matrix elements are not diagonal
	      B[j][i] = A[i][j]; // Swap
	    }
	    else{ // If the two index are equal, it is diagonal so...
	      buff = A[i][j]; // Set buff equal to position within A this iteration
	      tmp = i; // Hold index of current diagonal
	    }
	  }
	  if(vert == hori){
	    B[tmp][tmp] = buff; // Set B[i][i] equal to A[i][j] for diagonal transposition
	  }
	}
      }
    }
  }
  if (N == 64 && M == 64){  // 64x64 square
    for(vert = 0; N > vert; vert += 4){ // Traverses horizontally through blocks via N by size of block
      for(hori = 0; N > hori; hori += 4){ // Traverse vertically through blocks via M by size of block
	for(i = hori; hori+4 > i; i++){ // Progress by row via i
	  for(j = vert; vert+4 > j; j++){ // Progress by column via j
	    if(i != j){ // If the index are not set equal, than the current matrix elements are not diagonal
	      B[j][i] = A[i][j]; // Swap
	    }
	    else{ // If the two index are equal, it is diagonal so...
	      buff = A[i][j]; // Set buff equal to position within A this iteration
	      tmp = i; // Hold index of current diagonal
	    }
	  }
	  if(vert == hori){
	    B[tmp][tmp] = buff; // Set B[i][i] equal to A[i][j] for diagonal transposition
	  }
	}
      }
    }
  }
  else{ // all other test cases
    for(vert = 0; M > vert; vert += 16){ // Traverses horizontally through blocks via N by size of block
      for(hori = 0; N > hori; hori += 16){ // Traverse vertically through blocks via M by size of block
	for(i = hori; (N>i) && hori+16 > i; i++){ // Progress by row via i
	  for(j = vert; (M>j) && vert+16 > j; j++){ // Progress by column via j
	    if(i != j){ // If the index are not set equal, than the current matrix elements are not diagonal
	      B[j][i] = A[i][j]; // Swap
	    }
	    else{ // If the two index are equal, it is diagonal so...
	      buff = A[i][j]; // Set buff equal to position within A this iteration
	      tmp = i; // Hold index of current diagonal
	    }
	  }
	  if(vert == hori){
	    B[tmp][tmp] = buff; // Set B[i][i] equal to A[i][j] for diagonal transposition
	  }
	  
	}
      }
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
    registerTransFunction(trans, trans_desc); 

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

