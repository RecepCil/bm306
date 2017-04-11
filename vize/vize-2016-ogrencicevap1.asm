; Ramazan A.
; not: cevap anahtarina gore cevap dogru
; cevap anahtarindan tek farki tum elamanlarda
; dolasmak icin dongu kullanilmamis olmasi

.model small
.data
dizi dw 1,2,3,?,4,5,6,?
ciftsayi db 2
.code
    mov ax,@data
    mov ds,ax
    mov ax,00
    mov cx,08
basla:
    mov ax,dizi[si]
    add si,2
    xor ax,dizi[si]
    add si,2
    xor ax,dizi[si]
    add si,2
    mov dizi[si],ax
    add si,2
    
    mov ax,dizi[si]
    add si,2
    xor ax,dizi[si]
    add si,2
    xor ax,dizi[si]
    add si,2
    mov dizi[si],ax
    add si,2
    
    mov si,00
dongu:
    mov ax,dizi[si]
    mov bl,al
    mov al,ah
    mov ah,bl
    mov bx,ax
    mov ax,cx
    div ciftsayi
    cmp ah,00
    jne birsola
    rol bx,1
birsola:
    rol bx,1
    mov dizi[si],bx
    add si,2
    loop dongu
end
    