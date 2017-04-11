; lea (load effective address) ile
; yanlis goreli konum yukleme ornegi
; dizi boyutu olarak word kullanilmistir
; ama ikinci elemana ulasmak icin tek baytlik
; kayma yapildigindan dogru sonuc yuklenememistir

.model small 

.data
    dizi1 dw 0aaaah, 0bbbbh
    
.code
    mov ax, @data   ; data segmenti
    mov ds, ax      ; ds kaydedicisine kur
    
    lea si, dizi1
    mov ax, [si]    ; ah: aa, al: aa
    add si, 1       ; duzeltmek icin artirim degeri olarak 2 kullanilmali
    mov bx, [si]    ; bh: bb, bl: aa 
    
    mov AH, 4CH
    int 21H
    end
