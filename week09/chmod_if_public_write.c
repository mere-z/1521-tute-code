#include <stdio.h>
#include <sys/stat.h>

// Files/directories passed in through argv[]
// Iterate through argv[]
// Change file/directory perms to not public writeable (but keep everything else)

int main(int argc, char *argv[]) {

    for (int i = 1; i < argc; i++) {
        char *path = argv[i];
        struct stat s;
        if (stat(path, &s) == -1) {
            perror(argv[i]);
            return 1;
        }
        // Check if file is publically writeable, change to not writeable
        if (s.st_mode & S_IWOTH) {
            printf("%s is publically writeable, changing it to not\n", path);
            //    Change file to not pub write
            chmod(path, s.st_mode & ~S_IWOTH);
        } else {
            printf("%s not publically writeable\n", path);
        }

     

    }
    
        
}