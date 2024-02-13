section .data
s1 db 'Enter two numbers: '
s1len equ $-s1
s2 db 'The sum is: '
s2len equ $-s2

section .bss
num1 resb 4
num2 resb 4

section .text
global _start

_start:
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

    MOV eax, [num1]; We can use atmost one mem location
    SUB eax, '0'; to convert ASCII to decimal
    MOV ebx, [num2]; stores addr of num2 to ebx
    SUB ebx, '0'
    ADD eax, ebx; performs actual addition on the operands
    SUB eax, '0'
    MOV [num1], eax; moves value in eax to num1

    MOV eax, 4
    MOV ebx, 1
    MOV ecx, s2
    MOV edx, s2len
    int 0x80

    MOV eax, 4
    MOV ebx, 1
    MOV ecx, num1
    MOV edx, 4
    int 0x80

MOV eax, 1
MOV ebx, 0
int 0x80
