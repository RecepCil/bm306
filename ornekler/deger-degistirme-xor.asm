; xor islemiyle deger degistirme
; her zaman dogru oluyor mu kontrol edilmeli
; tasma, borc alma vs. durumlarda
; toplama islemiyle nasil olacak bulamadim simdilik

.model small 

    
.code
    
    mov ax, 0005h  ; ax'e 5 degerini ata
    mov bx, 0007h  ; bx'e 7 degerini ata
    
    xor ax, bx     ; ax: 101 xor 111 = 010 = 2
    xor bx, ax     ; bx: 111 xor 010 = 101 = 5
    xor ax, bx     ; ax: 010 xor 101 = 111 = 7

    mov AH, 4CH
    int 21H
    end
