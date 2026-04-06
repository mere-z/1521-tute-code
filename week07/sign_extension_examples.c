#include <stdio.h>
#include <stdint.h>


// Show students how the computer sign extends different types of integers
// 1. Extend a 16 bit unsigned integer into an unsigned 32 bit integer (top bits filled with 0s)
// 2. Extend a 16 bit signed integer into an unsigned 32 bit integer (top bits filled with the top bit of the 16 bit signed int)
// 3. Extend a 16 bit unsigned integer into an signed 32 bit integer (top bits filled with 0s)
// 4. Make the printf a %u on our signed integer (takes the bits in the signed integer and displays unsigned value)

// Show arithmetic/logical shift difference
int main() {
    
    // 1111111111111111 
    int16_t x = 0xFFFF;

    // 1111111111111111
    x = x >> 3;

    printf("%d", x); 

}