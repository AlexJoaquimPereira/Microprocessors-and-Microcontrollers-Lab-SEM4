;write ALP to display multiples of 3 from 0 to 9
section .bss
num resb 4

section .text
global _start

_start:
    ;initializing to 3
    MOV EAX, [num]
    MOV EAX, 3
    SUB EAX, '0'
    MOV [num], EAX

    ;Incrementing and printing multiples 3 times
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, num
    MOV EDX, 4
    int 0x80
    INC [num]
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
    INC [num]

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, 10
    MOV EDX, 0
    int 0x80

MOV EAX, 1
MOV EBX, 0
int 0x80