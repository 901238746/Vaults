section .data
    encoding db " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890~!@#$%^&*()`[{}]:;\"'<>.,?/|\\=+-_", 0
    data db "Hello, World!", 0
    key1 db "Key1", 0
    key2 db "Key2", 0
    encrypted db 128 dup(0) ; Placeholder for encrypted output
    decrypted db 128 dup(0) ; Placeholder for decrypted output
    msg_encrypt db "Encrypted: ", 0
    msg_decrypt db "Decrypted: ", 0

section .bss
    data_len resb 1
    key1_len resb 1
    key2_len resb 1

section .text
    global _my_start

_my_start:
    ; Initialize pointers and lengths
    lea rsi, [data]
    call strlen
    mov byte [data_len], al

    lea rsi, [key1]
    call strlen
    mov byte [key1_len], al

    lea rsi, [key2]
    call strlen
    mov byte [key2_len], al

    ; Encrypt data
    lea rsi, [data]
    lea rdi, [encrypted]
    lea rdx, [key1]
    lea rcx, [key2]
    call encrypt

    ; Print encrypted message
    mov rsi, msg_encrypt
    call print_string
    lea rsi, [encrypted]
    call print_string

    ; Decrypt data
    lea rsi, [encrypted]
    lea rdi, [decrypted]
    lea rdx, [key1]
    lea rcx, [key2]
    call decrypt

    ; Print decrypted message
    mov rsi, msg_decrypt
    call print_string
    lea rsi, [decrypted]
    call print_string

    ; Exit program
    mov rax, 60       ; sys_exit
    xor rdi, rdi
    syscall

; Subroutine: Encrypt
encrypt:
    xor rbx, rbx      ; i = 0
.next_char:
    cmp bl, [data_len]
    jge .done
    ; XOR data[i] with key1[i % key1_len] and key2[i % key2_len]
    movzx rax, byte [rsi + rbx]
    movzx r8, byte [rdx + rbx % byte [key1_len]]
    xor rax, r8
    movzx r9, byte [rcx + rbx % byte [key2_len]]
    xor rax, r9
    mov byte [rdi + rbx], al
    inc rbx
    jmp .next_char
.done:
    ret

; Subroutine: Decrypt (same as Encrypt)
decrypt:
    jmp encrypt

; Subroutine: strlen
strlen:
    xor rax, rax
    xor rcx, rcx
.next_char_strlen:
    cmp byte [rsi + rcx], 0
    je .done_strlen
    inc rcx
    jmp .next_char_strlen
.done_strlen:
    mov rax, rcx
    ret

; Subroutine: print_string
print_string:
    mov rax, 1        ; sys_write
    mov rdi, 1        ; stdout
    mov rdx, 128      ; length
    syscall
    ret
section .note.GNU-stack
   ; This empty section tells the linker that the stack is non-executable.