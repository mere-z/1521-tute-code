#include <stdio.h>
#include <stdint.h>

// Get the 32 bit number u
// with its top 13 bits and bottom 13 bits ONLY
// delete the middle ! 
uint32_t six_middle_bits(uint32_t u) {

    uint32_t mask = 1;
    mask = mask << 6;
    mask = mask - 1;
    mask = mask << 13;
    mask = ~mask;
    
    return mask & u;

}

int main() {
    //           0b11111111111110000001111111111111
    uint32_t u = 0b01000111011010011100111001010110;  //001 110 in the middle  
    uint32_t result = six_middle_bits(u); 
    // do whatever 
    printf("Six middle bits: %d\n", result); 
    return 0;
}

// int a = 7
// option 1: a + a 
// option 2: a << 1
// option 3: 3a = 4a - a = 3a 
// 0111001010110