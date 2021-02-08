#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
    int numbers_count = 0;
    int sum = 0;
    char temp_str[50];

    printf("The value of argc: %d\n", argc);
    printf("The value(s) in argv:\n");
    
    for(int i = 0; i < argc; i++) {
        printf("> argv[%d]=%s\n", i, argv[i]);
    }
    
    numbers_count = atoi(argv[1]);
    printf("Enter %d numbers:\n", numbers_count);
    
    for(int i = 0; i < numbers_count; i++) {
        scanf("%s", temp_str);
        sum += atoi(temp_str);
    }

    printf("Total sum is %d\n", sum);
}

