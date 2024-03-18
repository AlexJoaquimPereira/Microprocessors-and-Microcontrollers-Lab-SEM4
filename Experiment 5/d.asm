%MACRO read_string 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 0x80
%ENDMACRO

section .data
s db 'Enter two numbers: '
sl equ $-s
s1 db 'Num 1: '
s1l equ $-s1
s2 db 'Num 2: '
s2l equ $-s2

section .bss
num1 resb 4
num2 resb 4

section .text
global _start
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, s
    mov edx, sl
    int 0x80

	read_string num1, 4
	read_string num2, 4

    mov eax, 4
	mov ebx, 1
	mov ecx, s1
	mov edx, s1l
	int 0x80

    mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 4
	int 0x80

    mov eax, 4
	mov ebx, 1
	mov ecx, s2
	mov edx, s2l
	int 0x80

    mov eax, 4
	mov ebx, 1
	mov ecx, num2
	mov edx, 4
	int 0x80

    mov eax, 4
	mov ebx, 1
	mov ecx, 10
	mov edx, 1
	int 0x80

mov eax, 1
mov ebx, 0
int 0x80
