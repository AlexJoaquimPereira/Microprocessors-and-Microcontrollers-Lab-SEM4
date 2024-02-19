;write ALP to display odd numbers from 0 to 9 without looping
section .bss
num resb 4

section .text
global _start

_start:
    ;initializing to 1
    MOV EAX, [num]
    MOV EAX, 1
    SUB EAX, '0'
    MOV [num], EAX

    ;Incrementing and printing the odd numbers four times
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num
    MOV EDX, 4
    int 0x80
    INC [num]
    INC [num]

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, 10
    MOV EDX, 0
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num
    MOV EDX, 4
    int 0x80
    INC [num]
    INC [num]

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, 10
    MOV EDX, 0
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num
    MOV EDX, 4
    int 0x80
    INC [num]
    INC [num]
    
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, 10
    MOV EDX, 0
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num
    MOV EDX, 4
    int 0x80
    INC [num]
    INC [num]
    
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, 10
    MOV EDX, 0
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num
    MOV EDX, 4
    int 0x80

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, 10
    MOV EDX, 0
    int 0x80

MOV EAX, 1
MOV EBX, 0
int 0x80