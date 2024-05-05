#include <stdio.h>

#define N 4
#define M 4
#define column 3

void process(int n, int m, int matrix [M][N], int *result){
        for (int j = 0; j < n; ++j) {
            result += matrix[column][j];
        }
}

void initMatrix(int n, int m, int matrix [M][N]){
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }
}

int main(int argc, char** argv)
{
    int matrix[M][N];
    int result;

    initMatrix(N, M, matrix);

    process(N, M, matrix, result);

    printf("%d ", result);

    return 0;
}