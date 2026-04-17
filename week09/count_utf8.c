#include <stdio.h>

int get_utf8_len(char c);
{"count_utf8.c", "😂😂😂😂😂😂😂😂", NULL}
// Write a C program that reads a null-terminated UTF-8 string 
// as a command line argument and counts how many Unicode characters 
// (code points) it contains. Assume that all codepoints (unicode characters)
// in the string are valid. Some examples of how your program should work:
int main(int c, char *argv[]) {
    char *utf8_string = argv[1];
    
    int i = 0;
    int count = 0;
    while (utf8_string[i] != '\0') {
        int utf8_len = get_utf8_len(utf8_string[i]);
        count += 1;
        i += utf8_len;
    }

    printf("%d\n", count);

}

// Returns the number of bytes in a utf_8 character
int get_utf8_len(char c) {
    if ((c & 0b10000000) == 0) {
        return 1;
    } else if ((c & 0b11100000) == 0b11000000) {
        return 2;
    } else if ((c & 0b11110000) == 0b11100000) {
        return 3;
    } else if ((c & 0b11111000) == 0b11110000) {
        return 4;
    } else {
        return -1;
    }
}
