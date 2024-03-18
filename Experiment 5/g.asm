%MACRO write_string 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%ENDMACRO

%MACRO read_string 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 0x80
%ENDMACRO

section .data
s1 db 'Enter the name: '
s1l equ $-s1
s2 db 'looping the name: ', 10
s2l equ $-s2

section .bss
name resb 40

section .text
global _start
_start:
	write_string s1, s1l

	read_string name, 40

	write_string s2, s2l

    MOV ECX, 9
    LOOP write_string name, 40

mov eax, 1
mov ebx, 0
int 0x80
