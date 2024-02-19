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
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, s1
    MOV EDX, s1len
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num1
    MOV EDX, 4
    int 0x80

    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num2
    MOV EDX, 4
    int 0x80

    ;If we use AX, BX registers the garbage values don't arise it seems
    MOV EAX, [num1]; We can use atmost one mem location
    SUB EAX, '0'; to convert ASCII to decimal
    MOV EBX, [num2]; stores addr of num2 to EBX
    SUB EBX, '0'
    ADD EAX, EBX; performs actual addition on the operands
    SUB EAX, '0'
    MOV [num1], EAX; moves value in EAX to num1

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, s2
    MOV EDX, s2len
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num1
    MOV EDX, 4
    int 0x80

MOV EAX, 1
MOV EBX, 0
int 0x80
