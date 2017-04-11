; basit aritmetik islemler

.model small   

    
.code
    mov ax, 05  ; ax'e 5 atadik
    add ax, 02  ; ax'teki 5'e 2 ekledik
    sub ax, 05  ; ax'teki 7'den 5 cikardik
    mov bh, 03  ; bh'ye carpma icin 3 degerini yukledik
    mul bh      ; ax'teki 2 ile bh'deki 3'u carptik

    mov AH, 4CH
    int 21H
    end