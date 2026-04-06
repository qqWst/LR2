section .data
    msg db "Choose input: 1-console, 2-file:", 10
    msg_len equ $ - msg

    filename db "input.txt", 0

    yes db "Yes ", 0
    no db "No ", 0
    dash db "- ", 0

section .bss
    choice resb 2
    buffer resb 1024
    numbers resd 100
    count resd 1
    fd resq 1

section .text
    global _start

_start:

    ; ===== вывести меню =====
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall

    ; ===== прочитать выбор =====
    mov rax, 0
    mov rdi, 0
    mov rsi, choice
    mov rdx, 2
    syscall

    mov al, [choice]

    cmp al, '1'
    je read_console

    cmp al, '2'
    je read_file

    jmp exit

; =========================
; ЧТЕНИЕ С КОНСОЛИ
; =========================
read_console:
    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, 1024
    syscall
    jmp parse

; =========================
; ЧТЕНИЕ ИЗ ФАЙЛА
; =========================
read_file:
    mov rax, 2
    mov rdi, filename
    mov rsi, 0
    syscall
    mov [fd], rax

    mov rax, 0
    mov rdi, [fd]
    mov rsi, buffer
    mov rdx, 1024
    syscall

    mov rax, 3
    mov rdi, [fd]
    syscall

    jmp parse

; =========================
; ПАРСИНГ ЧИСЕЛ
; =========================
parse:
    mov rsi, buffer
    xor rcx, rcx
    xor rbx, rbx

parse_loop:
    mov al, [rsi]
    cmp al, 0
    je done_parse

    cmp al, '0'
    jl save
    cmp al, '9'
    jg save

    sub al, '0'
    imul rbx, rbx, 10
    add rbx, rax
    inc rsi
    jmp parse_loop

save:
    cmp rbx, 0
    je skip

    mov [numbers + rcx*4], ebx
    inc rcx
    xor rbx, rbx

skip:
    inc rsi
    jmp parse_loop

done_parse:
    mov [count], ecx

    ; =========================
    ; ОБРАБОТКА
    ; =========================
    xor rdi, rdi

process:
    cmp rdi, [count]
    jge exit

    mov eax, [numbers + rdi*4]

    cmp eax, 100
    jl print_dash
    cmp eax, 999
    jg print_dash

    mov ebx, eax
    xor ecx, ecx

rev_loop:
    cmp eax, 0
    je check

    xor edx, edx
    mov esi, 10
    div esi

    imul ecx, ecx, 10
    add ecx, edx
    jmp rev_loop

check:
    cmp ecx, ebx
    je print_yes
    jne print_no

print_yes:
    mov rax, 1
    mov rdi, 1
    mov rsi, yes
    mov rdx, 4
    syscall
    jmp next

print_no:
    mov rax, 1
    mov rdi, 1
    mov rsi, no
    mov rdx, 3
    syscall
    jmp next

print_dash:
    mov rax, 1
    mov rdi, 1
    mov rsi, dash
    mov rdx, 2
    syscall

next:
    inc rdi
    jmp process

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
