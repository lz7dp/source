#include <stdio.h>   // Включване на стандартна библиотека за вход/изход

// Главна функция - стартова точка на програмата
int main() {
    int x = 10;
    int *p = &x; // p сочи към x

    printf("%d\n", *p); // Отпечатва 10 (стойността на x)
    *p = 20;            // Променя стойността на x на 20
    printf("%d\n", x); // Отпечатва 20 (стойността на x)

    // int chisla[5]; // Декларация
    int chisla[5] = {1, 2, 3, 4, 5}; // Инициализация
    chisla[0] = 10; // Доступ до първия елемент (индекси започват от 0)

    char zdrave[] = "Zdravei!"; // Автоматично се добавя '\0'
    char ime[20]; // Низ с максимална дължина 19 символа + '\0'

    // chisla е еквивалентно на &chisla[0].
    int *p2 = chisla;
    int *p3 = &chisla[0];
    printf("%d\n", *p2); // chisla = &chisla[0]
    printf("%d\n", *p3);

    char* ptr = "STRING";
    printf("%s\n", ptr);  // prints STRING
    printf("%p\n", &ptr); // variable pointer address - prints the address of the variable holding the pointer from before.
    printf("%p\n", &ptr[0]); // address of 1 element
    printf("%p\n", ptr);  // address of 1 element - prints the address of the string itself

    // STRING
    // 0x7ffd4d99bad0
    // 0x55f00f6b2008
    // 0x55f00f6b2008

}

