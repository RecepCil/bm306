; dallanma komutlari kendilerine has bayraklari kullanir
; bu bayraklarin durumuna gore hedef adrese dallanilir
; ya da normal program akisi devam ettirilir


; Mantiksal Tanimlamaya Gore Dallanmalar
; Sembol           Acilim                     Bayrak
; ------           ------                     ------
; je               esitse                     zf
; jz               sifirsa                    zf
; jne              esit degilse               zf
; jnz              sifir degilse              zf
; ja               yuksekse                   cf, zf
; jnbe             dusuk ya da esit degilse   cf, zf
; jae              yuksekse ya da esitse      cf
; jnb              dusuk degilse              cf
; jb               dusukse                    cf
; jnae             yuksek ya da esit degilse  cf
; jbe              dusukse ya da esitse       af, cf
; jna              yuksek degilse             af, cf

; Aritmetik Tanimlamaya Gore Dallanmalar
; Sembol           Acilim                     Bayrak
; ------           ------                     ------
; je               esitse                     zf
; jz               sifirsa                    zf
; jne              esit degilse               zf
; jnz              sifir degilse              zf
; jg               buyukse                    of, sf, zf
; jnle             kucuk ya da esit degilse   of, sf, zf
; ...

  

.model small 

.data
    sayi1 db 12
    sayi2 db 14
    
.code
    mov ax, @data   ; data segmenti
    mov ds, ax      ; ds kaydedicisine kur
    
    ;cmp sayi1, sayi2 ; bu sekilde kullanim mumkun degil
    mov bh, sayi1   ; birinci sayiyi bh'ye yukluyoruz
    cmp bh, sayi2   ; bh'deki birinci sayi ile ikinci sayiyi karsilastir
    je esit         ; sayilar esitse esit etiketine dallan
    jmp esitdegil   ; esit degilse de esitdegil etiketine dallan
    
esit:
    mov dx, 00h     ; etikete geldigini gormek icin dx'e 00h ata
    jmp cikis       ; esitdegil etiketine gecilmemesi icin cikis'a dallan

esitdegil:          ; etikete geldigini gormek icin dx'e 11h ata
    mov dx, 11h
        
cikis:    
    mov AH, 4CH
    int 21H
    end
