section .data
    msg1 db "El numero es primo", 0
    msg2 db "Ingrese un numero: ", 0
    msg3 db "El numero no es primo", 0

section .text
    global _start
    %include "io.asm"
_start:
    sub esp, 8
    mov esi, msg2
    call print_str
    call scan_num
    mov [esp+4], eax
    cmp eax, 2
    je .Siprimo
    mov ebx, 3
    mov [esp+8], ebx
    mov ecx, 2
    xor edx, edx
    div ecx 
    cmp dl, 0
    je .Noprimo
    jmp .else1

.else1:
    mov eax, [esp+4]
    mov ecx, [esp+8]
    cmp ecx, eax
    jae .Siprimo

    mov eax, [esp+4]
    xor edx, edx
    div ecx
    cmp dl, 0
    je .Noprimo

    add dword [esp+8], 2 
    jmp .else1

.Siprimo:
    mov esi, msg1
    call print_str
    jmp .fin

.Noprimo:
    mov esi, msg3
    call print_str
    jmp .fin

.fin:
    add esp, 8
    mov eax, 1
    xor ebx, ebx
    int 0x80
    