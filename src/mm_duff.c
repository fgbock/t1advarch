#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <sys/time.h>
//#define IMPRIME

void multiplica(int m, int n, int **matA, int **matB, int **matC){
	int i, j, k, som, rounds;
	for (i=0;i<m;i++){
		for(j=0;j<n;j++){
			rounds = m  / 8;
			switch (m%8){
				case 0:
					while(!(rounds == 0)){
						rounds--;
						matC[i][j]+= matA[i][k]*matB[k][j];
						printf("k is %d\n",k);
						k++;
				case 7:
						matC[i][j]+= matA[i][k]*matB[k][j];
						k++;
				case 6:
						matC[i][j]+= matA[i][k]*matB[k][j];
						k++;				
				case 5:
						matC[i][j]+= matA[i][k]*matB[k][j];
						k++;				
				case 4:
						matC[i][j]+= matA[i][k]*matB[k][j];
						k++;				
				case 3:
						matC[i][j]+= matA[i][k]*matB[k][j];
						k++;				
				case 2:
						matC[i][j]+= matA[i][k]*matB[k][j];
						k++;				
				case 1:
						matC[i][j]+= matA[i][k]*matB[k][j];
						k++;				
				};
			}
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
