#include <stdio.h> 
#include <string.h>
#include </home/user41/exercises/day02/ex2/libreverse/src/reverselib/reverse.h>

// int main()
int main(int argc, char* argv[]){
    char str1[20];
    int size;

    printf("Enter a string to reverse: ");
    scanf("%s", str1);
    size = strlen(str1);
    reverse(str1, 0, size - 1);
    printf("The string after reversing is: %s\n", str1);
    return 0;
}

