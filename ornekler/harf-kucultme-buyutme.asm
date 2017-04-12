; kucuk harfleri buyuk harfe donusturen program
; A-Z, 41h-5ah arasi; a-z ise 61h-7ah'tir.
; yani kucuk harflerle buyuk harfler arasinda 20h'lik
; bir fark vardir. bu sayede msb bitinin birinci
; biti 1 yapilirsa kucuk harfe cevrilir

.model small
.data
    duzce db "duzce universitesi"

.code
    mov ax, @data
    mov ds, ax
    lea si, duzce
    mov cx, 18
    mov al, 0
bas:
    mov al, [si]
    cmp al, 61h
    ja buyut
don:
    inc si
    loop bas
buyut:
    sub al, 20h
    mov [si], al
    cmp cx, 0
    jz cik  ; programi aldigim kaynakta buna gerek kalmiyor?
    jmp don    
cik:
    mov AH, 4CH
    int 21H
    end
