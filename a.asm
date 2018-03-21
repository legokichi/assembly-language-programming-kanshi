section .data
msg: db 0

section .text
global _start
_start:
mov rax,0
mov rdi,0
mov rsi,msg
mov rdx,1
syscall

cmp rax,1
jne end
mov r11b,[msg]
cmp r11b,10
je end

mov rax,1
mov rdi,1
mov rsi,msg
mov rdx,1
syscall

jmp _start
nop
end:
mov rax,60
mov rdi,0
syscall
