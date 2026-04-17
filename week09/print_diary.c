#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Write a C program, print_diary.c, which prints the contents of the file $HOME/.diary to stdout
// The lecture example getstatus.c shows how to get the value of an environment variable.

// We want to make pathname = "$HOME/.diary"

const char *diary_name = ".diary";
int main(void) {    
    // How big is the string we want to make?
    // Declare a char array (string) to store the string
    // Then use snprintf()
    char *home = getenv("HOME");
    //home len + slash + .diary + null term
    int home_fullpath_len = strlen(home) + 1 + strlen(diary_name) + 1;
    char home_fullpath[home_fullpath_len];

    if (snprintf(home_fullpath, home_fullpath_len, "%s/%s", home, diary_name) < 0) {
        fprintf(stderr, "SNPRINTF DID NOT WORK\n");
        return 1;
    }

    FILE *fp = fopen(home_fullpath, "r");

    int c;

    while ((c = fgetc(fp)) != EOF) {
        fputc(c, stdout);
    }




}