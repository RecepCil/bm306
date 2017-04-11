; xchg komutuyla deger degistirme

.model small 

    
.code
    
    mov ax, 0aaaah  ; ax'e aaaa degerini ata
    mov bx, 0ffffh  ; bx'e ffff degerini ata
    xchg ax, bx     ; ax'in icerigi ile bx'in icerigini degistir
    mov cx, ax      ; cx'e ax'teki son deger, ffff'i ata
    mov dx, bx      ; dx'e bx'teki son deger, aaaa'yi ata

    mov AH, 4CH
    int 21H
    end
