
;;;;;;;;;;;;;; C program main.c call Assembly function add42.asm
;
;vi add42.asm
;nasm -f elf32 add42.asm -o add42.o
;vi add42.h
;vi main.c
;gcc -m32 add42.o main.c -o t17
