; basitlestirilmis modda tanimlanmis ve
; segmentlerle yazilmis bir aritmetik
; program ornegi

.model small 

.data
    sayi1 db 25
    sayi2 db 45
    sonuc db ? 
    
.code
    mov ax, @data   ; data segmenti
    mov ds, ax      ; ds kaydedicisine kur
    
    mov al, sayi1   ; birinci sayiyi al'ye al
    add al, sayi2   ; al'deki birinci sayi ile ikinci sayiyi topla
    mov sonuc, al   ; toplami, ayrilan yere aktar

    mov AH, 4CH
    int 21H
    end
