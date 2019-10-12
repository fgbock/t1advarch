#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <immintrin.h>
#include <sys/time.h>
// #define IMPRIME

void multiplica(int m, int n, int **matA, int **matB, int **matC){
	int i, j, k, som;
	for (i=0; i<m; i++){
		// += 8 columns
		for(j=0; j<n; j+= 8){
			// Each integer on the avx register is a cell on the result matrix.
			// They will work as an accumulator
			__m256i sum = _mm256_setzero_si256();
			for (int k = 0; k < m; k++) {
				// Load continuous memory
				// r1[0] = matA[i][k+0]
				// r2[1] = matA[i][k+1]
				// ...
				// r2[7] = matA[i][k+7]
				__m256i r1 = _mm256_set1_epi32(matA[i][k]);
				
				// Load from matB[k][j] to every vector position
				// r2[0] = matB[k][j]
				// r2[1] = matB[k][j]
				// ...
				// r2[7] = matB[k][j]
				__m256i r2 = _mm256_loadu_si256((__m256i*)&matB[k][j]);
				
				// Multiply avx registers
				__m256i multiplied = _mm256_mullo_epi32(r1, r2);

				// Add on cell accumulator
				sum = _mm256_add_epi32(sum, multiplied);
			}
			// Store final cell value for each column
			_mm256_storeu_si256((__m256i*)&matC[i][j], sum);
		}   
	}
}

int **aloca(int m, int n, int **matriz){
	int i;
	matriz=(int**)calloc(m, sizeof(int*));
	for(i=0;i<m;i++){
		matriz[i]=(int*)calloc(n, sizeof(int));
	}
	return matriz;
}

double GetTime(void)
{
   struct  timeval time;
   double  Time;
   
   gettimeofday(&time, (struct timezone *) NULL);
   Time = ((double)time.tv_sec*1000000.0 + (double)time.tv_usec);
   return(Time);
}

void imprime(int m, int n, int **matriz){
	int i, j;
	for(i=0; i<m; i++){
		for(j=0; j<n; j++){
			printf("%d ", matriz[i][j]);
		}
		printf("\n");
	}
}

void inicializa(int m, int n, int **matriz){
	int i, j;
	for (i=0;i<m;i++){
		for(j=0;j<n;j++){
			matriz[i][j]=i+j;
		}
	}
}


void desaloca(int m, int n, int **matriz){
	int i;
	for(i=0;i<m;i++){
		free(matriz[i]);
	}
	free(matriz);
}

int main (int argc, char *argv[]) {
	int **matA,**matB,**matC; 
	int m,n,i,j,k; // m(linhas) e n (colunas)
	double clockBegin;
	double timeElapsed;
	if(argc!=3){
		printf("Digite %s M_Linhas N_Colunas\n\n", argv[0]);
		exit(0);
	}
	m=atoi(argv[1]);
	n=atoi(argv[2]);
	
	/*ALOCA AS MATRIZES*/
	matA=aloca(m, n, matA);
	matB=aloca(m, n, matB);
	matC=aloca(m, n, matC);
	
	#ifdef IMPRIME
	printf("Antes da inicializacao!\n");
	imprime(m, n, matA);
	imprime(m, n, matB);
	imprime(m, n, matC);
	printf("\n");
	#endif

	/*POPULA AS MATRIZES A e B*/
	inicializa(m, n, matA);
	inicializa(m, n, matB);

	#ifdef IMPRIME
	printf("Depois da inicializacao!\n");
	imprime(m, n, matA);
	imprime(m, n, matB);
	imprime(m, n, matC);
	printf("\n");
	#endif
	
	/*MULTIPLICA AS MATRIZES A e B*/
	clockBegin = GetTime();
	multiplica(m, n, matA, matB, matC);
	timeElapsed = (GetTime() - clockBegin)/1000000;	
			
	#ifdef IMPRIME
	printf("Depois da Multiplicacao!\n");
	imprime(m, n, matA);
	imprime(m, n, matB);
	imprime(m, n, matC);
	printf("\n");
	#endif
	
	printf("%5lf\n", timeElapsed);

	/*DESALOCA AS MATRIZES*/
	desaloca(m, n, matA);
	desaloca(m, n, matB);
	desaloca(m, n, matC);
	return 0;
}

