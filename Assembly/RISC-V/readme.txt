RISC-V Assembly compilation and execute on Ubuntu Linux host:

 2981  sudo apt install gcc-riscv64-linux-gnu
 2986  mkdir riscv
 2987  cd riscv/
 2988  vi hello.s

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

 2991  vi Makefile

default:
        rm -rf hello
        riscv64-linux-gnu-as hello.s -o hello.o
        riscv64-linux-gnu-gcc -o hello hello.o -nostdlib -static

 2994  make
 3000  sudo apt install qemu-user
 3001  qemu-riscv64 ./hello

Hello World!

 3007  echo $?

13
