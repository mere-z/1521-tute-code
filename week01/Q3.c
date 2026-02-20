#include <stdio.h>
#include <stdlib.h>

int *get_num_ptr(void);

int main(void) {
    int *num = get_num_ptr();
    printf("%d\n", *num);

    // gets rid of heap malloced memory
    free(num);
}

// Problem statement: cannot return the address of x 
// because x is allocated onto the stack and once 
// get_num_ptr ends as a function, its deleted

// Solution: malloc memory! malloced memory goes onto the heap
// gives programmer control 

// Print 42

int *get_num_ptr(void) {
    int *x = malloc(sizeof(int));
    *x = 42;
    return x;
}
