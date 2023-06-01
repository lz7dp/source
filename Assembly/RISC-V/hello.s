.global _start

_start:

    addi    a7, zero, 64
    addi    a0, zero, 1
    la      a1, helloworld
    addi    a2, zero, 13
    ecall

    addi    a7, zero, 93
    addi    a0, zero, 13
    ecall

helloworld:
    .string "Hello World!\n"
