; lea (load effective address) ile
; goreli konum yukleme

.model small 

.data
    dizi1 db 0abh, 0cdh, 0efh, 012h
    
.code
    mov ax, @data   ; data segmenti
    mov ds, ax      ; ds kaydedicisine kur
    
    lea si, dizi1
    ;mov ax, [si]   ; ah: cd, al: ab
    ;inc si
    ;mov bx, [si]   ; bh: ef, bl: cd 
    mov ax, [si]    ; ah: cd, al: ab
    add si, 2
    mov bx, [si]    ; bh: 12, bl: ef 
    
    mov AH, 4CH
    int 21H
    end
