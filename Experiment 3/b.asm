section .data
s1 db 'Enter two numbers: '
s1len equ $-s1
s2 db 'The sum is: '
s2len equ $-s2

section .bss
num1 resb 4
num2 resb 4
a resb 4
s resb 4
m resb 4
d resb 4
q resb 4

section .text
global _start

_start:
    ;Entering two numbers
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, s1
    MOV edx, s1len
    int 0x80

    MOV eax, 3
    MOV ebx, 2
    MOV ecx, num1
    MOV edx, 4
    int 0x80

    MOV eax, 3
    MOV ebx, 2
    MOV ecx, num2
    MOV edx, 4
    int 0x80

    ;Addition
    MOV a, num1
    ADD a, num2
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, astr
    MOV edx, astrlen
    int 0x80

    MOV eax, 4
    MOV ebx, 1
    MOV ecx, a
    MOV edx, 4
    int 0x80

    ;Subtraction
    MOV b, num1
    SUB b, num2
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, substr
    MOV edx, substrlen
    int 0x80

    MOV eax, 4
    MOV ebx, 1
    MOV ecx, b
    MOV edx, 4
    int 0x80

    ;Multiplication
    MOV m, num1
    MULT m, num2
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, multstr
    MOV edx, multstrlen
    int 0x80

    MOV eax, 4
    MOV ebx, 1
    MOV ecx, m
    MOV edx, 4
    int 0x80

    ;Division
    MOV d, num1
    DIV d, num2
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, quotstr
    MOV edx, quotstrlen
    int 0x80

    MOV eax, 4
    MOV ebx, 1
    MOV ecx, d
    MOV edx, 4
    int 0x80

    ;Remainder
    MOV r, num1
    DIV r, num2
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, remstr
    MOV edx, remstrlen
    int 0x80

    MOV eax, 4
    MOV ebx, 1
    MOV ecx, r
    MOV edx, 4
    int 0x80

MOV eax, 1
MOV ebx, 0
int 0x80
