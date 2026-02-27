// Demonstrate translation of varied if statements in c
// Key: Ask yourself: where does the code go in this case? 
#include <stdio.h>

int main(void) {

    int x;
    scanf("%d", &x);

    if (x > 60 && x < 30) {
        
        printf("x is outside of the range 30-60");
    } 

    //OR example: 
    
    if (x > 60 || x < 30) {
        
        printf("x is either above 60, below 30 or both!");

    } 


}