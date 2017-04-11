; ekrana 10 kere Merhaba Dunya yazan program
; https://sites.google.com/site/cehars/
.model small

.data
    merhaba db "Merhaba Dunya",0ah,0dh,24h
    
.code
    mov ax, @data
    mov ds, ax
    
    mov cx, 0ah
dongu:
    mov ah, 9
    mov dx, offset merhaba
    int 21h
    loop dongu
    
    mov ah, 4ch
    int 21h
    end
    