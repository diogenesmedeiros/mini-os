[BITS 16]            ; Indica que estamos usando o modo real de 16 bits
[ORG 0x7C00]         ; O código será carregado no endereço 0x7C00

; Início do bootloader
start:
    mov ah, 0x0E      ; Função de impressão de caractere (modo de vídeo)
    
    mov al, 'H'       
    int 0x10          
    mov al, 'i'       
    int 0x10
    mov al, ' '       
    int 0x10

    mov si, msg

print_string:
    ; Carrega o próximo caractere da string
    lodsb
    cmp al, 0
    je done
    int 0x10
    jmp print_string

; Captura de tecla
wait_for_key:
    mov ah, 0
    int 0x16
    mov ah, 0x0E
    int 0x10
    jmp wait_for_key

done:
    jmp $

msg db 'Diogenes Junior', 0

times 510 - ($ - $$) db 0
dw 0xAA55