#include <stdio.h>

int factorial(int n);

int main(void) {
    int n;
    printf("Enter a number: ");
    scanf("%d", &n);
    printf("%d! = %d\n", n, factorial(n)); 
    return 0;
}

// 4!         =    4 * 3 * 2 * 1
// recurrence?
// factorial(4) =  4 * factorial(3) 

// factorial(n) =  n * factorial(n - 1);

// 0! = 1; <- look at later 

int factorial(int n) {
  // base case
  if (n == 1 || n == 0) {
    return 1;
  }
  
  // recursive case
  return n * factorial(n - 1);

}
