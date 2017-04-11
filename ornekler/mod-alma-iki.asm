; 2'ye mod alan program
; mod alma genellikle bolme komutuyla yapilir. Bununla birlikte
; 2, 4, 8, 16 ve benzeri degerlerin modunun alinmasinin
; ozel bir durumu vardir: sayilar ikilik bicimde saklandiginden
; bu islem and komutuyla yapilabilir.
; bir sayinin ikiye bolunebilirliginin en hizli kontrolu en az
; degerlikli bitine bakmaktir. bunun icinde and komutu 1 degeri
; ile kullanilabilir.
; ikinin diger kuvetleri icin de and'i istenilen mod degerinin
; bir eksigiyle calistirabilirsiniz. or: x % 4 -> x & 3, x % 8 -> x & 7...
; http://stackoverflow.com/questions/20149681/how-to-write-modulus-in-c-in-assembly-language

.model small

.data
    dizi db 2, 3, 4, 6, 7

.code
    mov ax,@data
    mov ds, ax
    mov al,0
    mov cx,5
    lea si, dizi    ; dizinin baslangic ofset adresi si'ye yuklenir
    ;mov si, offset dizi
bas:
    and dizi[si], 1 ; sayinin 2'ye bolumunden kalani alir, yani mod 2 
    inc si
    loop bas

    mov ah,4ch
    int 21h
    end