%macro write_string 2
	MOV EAX, 4
	MOV EBX, 1
    PUSH ECX
	MOV ECX, %1
	MOV EDX, %2
	int 80h
    POP ECX
%endmacro

%macro read_string 2
	MOV EAX, 3
	MOV EBX, 2
	MOV ECX, %1
	MOV EDX, %2
	int 80h
%endmacro

section .data
	ask db 'Enter the limit: '
	asklen equ $-ask
	show db 'Fibonacci series: '
	showlen equ $-show
	space db ' '
	spacelen equ $-space
	newline db 10

section .bss
	i resb 1
	n resb 4
	a resb 4
	b resb 4
	c resb 4


section .text
	global _start
_start:

	write_string ask, asklen
	read_string n, 4
	write_string show, showlen

	MOV [i], byte '0'
	MOV [a], byte '0'
	MOV [b], byte '1'

    ;push function parameters to stack
    MOV EAX, [n]
    MOV EDX, [b]
    MOV ECX, [a]
    PUSH ECX
    PUSH EDX
    PUSH EAX
    CALL recursive_fibonacci
    CALL exit

;normal_fibonacci 

recursive_fibonacci: ;recursion gives segmentation fault
    POP EAX
    POP EDX
    POP ECX
    CMP ECX, '0'
    JE exit ; if n == 0 return
    write_string EAX, 4; else print
    write_string 10, 1
    DEC ECX
    PUSH EDX
    SUB EAX, '0'
    SUB EDX, '0'
    ADD EDX, EAX    ;b = b + a
    SUB EDX, '0'
    POP EAX         ; a = b
    PUSH ECX
    PUSH EDX
    PUSH EAX
    CALL recursive_fibonacci

exit:
	write_string newline, 1
	MOV EAX, 1
	MOV EBX, 0
	int 80h
