%MACRO write_string 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%ENDMACRO

section .data
s1 db 'Enter the number: '
s1l equ $-s1
s2 db 'The number is: '
s2l equ $-s2

section .bss
num resb 4

section .text
global _start
_start:
    write_string s1, s1l

	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 4
	int 0x80

	write_string s2, s2l
	write_string num, 4
    write_string 10, 1

mov eax, 1
mov ebx, 0
int 80h
