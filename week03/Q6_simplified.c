// A simple program that will print 10 numbers from an array

#define N_SIZE 10

#include <stdio.h>

int main(void) {
    // store int i in $t0
    int i;
    int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};


print_loop_init:
    i = 0;

print_loop_cond:
    if (i >= N_SIZE) goto loop_end;
    printf("%d\n", numbers[i]);

print_loop_increment:
    i++;
    goto loop_cond;
    
print_loop_end:
    ;
}