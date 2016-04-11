	extern printf
	extern scanf
	global main
	
	section .data
	
newline:	db "", 10, 0
write_msg:	db "%d", 10, 0
read_msg:	db "Enter an integer: ", 0
read_format:	db "%d", 0
	
	section .bss      ; uninitialized data
	
number:	resb 8
xy_:	resb 8
xx_:	resb 8
	
	section .text
	
q:	
	mov r11, [16 + rbp]
	lea r8, [0 + r11]
	mov [-8 + rbp], r8
	mov r15, [8 + rbp]
	lea r13, [0 + r15]
	mov [-16 + rbp], r13
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [-8 + rbp]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [-16 + rbp]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r14, 1
	mov [xx_], r14
	mov r10, 2
	mov [xy_], r10
	mov r12, [xx_]
	push r12
	mov r9, [xy_]
	push r9
	push rbp
	mov rbp, rsp
	sub rsp, 1000000
	call q
	mov rsp, rbp
	pop rbp
	pop r9
	pop r12
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
