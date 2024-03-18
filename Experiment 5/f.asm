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

    MOV EAX, [num1]
    MOV EAX, '0'
    MOV [num1], EAX

    MOV EAX, [num2]
    MOV EAX, '1'
    MOV [num2], EAX

    MOV ECX, [n]
    SUB ECX, '0'
    fibo:
        write_string num1, 4
        write_string 10, 1
        XOR EAX, EAX
        XOR EBX, EBX
        XOR EDX, EDX
        MOV AL, [num1]
        SUB AL, '0'
        MOV BL, [num2]
        SUB BL, '0'
        MOV DL, [temp]
        MOV DL, BL; temp = num2
        ADD BL, AL; num2 = num1 + num2
        ADD AL, '0'
        ADD AL, '0'
        ADD DL, '0'
        MOV [num1], DL; num1 = temp
        MOV [num2], BL
        LOOP fibo

MOV EAX, 1
MOV EBX, 0
int 0x80
