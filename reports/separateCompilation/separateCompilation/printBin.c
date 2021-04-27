#include "printBin.h"

void printBin(int a, int n) {
    a <<= 8 - n;
    for (int j = 0; j < n; j++) {
        printf("%c", (a & 128) ? '1' : '0');
        a <<= 1;
    }
    printf("\n");
}


