#include <stdio.h>
#include <stdlib.h>

void ans(int* a, int* b, int n) {
    for (int i = 0; i < n; ++i) {
        if (a[i] > 5) {
            b[i] = a[i] + 5;
        }
        else if (a[i] < -5) {
            b[i] = a[i] - 5;
        }
        else {
            b[i] = 0;
        }
    }
}

int main(void) {
    int n;
    scanf("%d", &n);
    int* a, * b;
    a = (int*)malloc(n * sizeof(int));
    b = (int*)malloc(n * sizeof(int));
    for (int i = 0; i < n; ++i) {
        scanf("%d", &a[i]);
    }
    ans(a, b, n);
    for (int i = 0; i < n; ++i) {
        printf("%d ", b[i]);
    }
    free(a);
    free(b);
    return 0;
}
