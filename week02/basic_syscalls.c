// Q4 tutorial, introduces students to basic operations in c (like scanf, printf) that 
// are implemented as syscalls in MIPS.
 
// Prints the square of a number

#include <stdio.h>
int main(void) {
    int x, y;
    printf("Enter a number: ");
    scanf("%d", &x);

    y = x * x;

    printf("%d\n", y);

    return 0;
}