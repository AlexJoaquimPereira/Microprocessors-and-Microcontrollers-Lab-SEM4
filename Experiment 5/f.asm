%MACRO write_string 2
    MOV EAX, 4
    MOV EBX, 1
    PUSH ECX
    MOV ECX, %1
    MOV EDX, %2
    int 0x80
    POP ECX
%ENDMACRO

%MACRO read_string 2
    MOV EAX, 3
    MOV EBX, 2
    MOV ECX, %1
    MOV EDX, %2
    int 0x80
%ENDMACRO

section .data
s1 db 'Enter the limit: ', 10
s1len equ $-s1

section .bss
n resb 4
num1 resb 4
num2 resb 4
temp resb 4

section .text
global _start

_start:
    write_string s1, s1len
    read_string n, 4

    MOV ECX, 0
    MOV [num1], byte '0'
    MOV [num2], byte '1'

fibo:
    MOV AL, [num1]
    SUB AL, '0'
    MOV BL, [num2]
    SUB BL, '0'
    ADD AL, BL        ; num1 = num1 + num2
    MOV [temp], AL    ; temp = num1
    MOV [num1], [num2]; num1 = num2
    MOV [num2], AL    ; num2 = num1
    ADD AL, '0'
    write_string temp, 4
    write_string 10, 1

    INC ECX
    CMP ECX, [n]
    JB fibo


MOV EAX, 1
MOV EBX, 0
int 0x80