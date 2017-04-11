.model small

.data
    dizi db 1, 2, 3, 7, -1
    sonuc db ?

.code
    mov ax,@data
    mov ds, ax
    mov al,0
    mov cx,5
    lea si, dizi    ; dizinin baslangic ofset adresi si'ye yuklenir
    ;mov si, offset dizi
bas:
    add al, [si]    ; bu sekilde 12 (0c) adc olsaydi: 12 (0c) ? 
    inc si
    loop bas
    mov sonuc, al

    mov ah,4ch
    int 21h
    end