#include <stdio.h>   // Включване на стандартна библиотека за вход/изход

// Глобални променливи (непрепоръчително)
int globalna_var;

// Декларация на функция (прототип)
int suma(int a, int b);

// Главна функция - стартова точка на програмата
int main() {
    // Тяло на програмата
    int rezultat = suma(5, 3);
    printf("Sumata e: %d\n", rezultat);
    return 0; // Връща 0 при успешно изпълнение
}

// Дефиниция на функция
int suma(int a, int b) {
    return a + b;
}
