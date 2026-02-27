// Simple example of what simplified c looks like 

#include <stdio.h>
int main(void) {
    

    // todo: create a flag to conditionally skip print
   
    // In c, false is 0
    // True is everything else 
    int skip_print = 0;
    if (skip_print) goto after_print; 
    printf("Hello, I'm being skipped by the goto above me!\n");
 after_print:
    printf("After the after_print label\n");



    return 0;
}