#include <stdio.h>

int main() {
    char* ptr = "STRING";  
    
    printf("ptr съдържа адрес: %p\n", ptr);
    printf("На този адрес има: %s\n", ptr);
    printf("Първи символ: %c\n", *ptr);
    printf("Втори символ: %c\n", *(ptr + 1));
    
    return 0;
}
