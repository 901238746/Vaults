#include <stdio.h>

extern void _my_start(); // Declare the entry point of the assembly code.

int main() {
    printf("Starting assembly program...\n");
    _my_start();  // Call the entry point of the assembly program
    return 0;
}