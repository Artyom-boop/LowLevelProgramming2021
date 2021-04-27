#include "gray.h"
#include "printBin.h"

void gray(unsigned n) {
    const size_t size = 1 << n;
    int arr[size];
    for (int i = 0; i < size; ++i) {
        arr[i] = i ^ i >>1;
        printBin(arr[i], n);
    }
}