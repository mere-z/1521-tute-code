#include <stdio.h>

int main(void) {
    char str[10]; 

    // Ved
    str[0] = 'V';
    str[1] = 'e';
    str[2] = 'd';
    str[3] = '\0';
    str[4] = 'K';
    str[5] = '\0';

    printf("%s", &str[4]);
    return 0;
}