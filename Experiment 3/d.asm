section .data
s1 db 'Enter three numbers: '
s1len equ $-s1
s2 db 'The sum is: '
s2len equ $-s2

section .bss
num1 resb 4
num2 resb 4
num3 resb 4

section .text
global _start

_start:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, s1
    MOV EDX, s1len
    int 0x80

    ;enter num1
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num1
    MOV EDX, 4
    int 0x80

    ;enter num2
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num2
    MOV EDX, 4
    int 0x80

    ;enter num3
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, num3
    MOV EDX, 4
    int 0x80

    ;num1 = num1 + num2
    MOV EAX, [num1]
    SUB EAX, '0'
    MOV EBX, [num2]
    SUB EBX, '0'
    ADD EAX, EBX
    SUB EAX, '0'
    MOV [num1], EAX

    ;num1 = num1 + num3
    MOV EAX, [num1]
    SUB EAX, '0'
    MOV EBX, [num3]
    SUB EBX, '0'
    ADD EAX, EBX
    SUB EAX, '0'
    MOV [num1], EAX

    ;prints the sum
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
