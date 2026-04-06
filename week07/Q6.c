#include <stdio.h>
#include <stdint.h>

int main(void) {

    // Simulating a machine with 16 bit ints by default
    // Can represent 60000 in a uint16_t or int32_t, but not int16_t!
    int32_t a = 30000;
    int32_t b = 30000;

    int32_t c = a + b;

    printf("a + b = c = %d", c);
}