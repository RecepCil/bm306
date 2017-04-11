; koksal g.
; not: programin tamamini kontrol etmedim
; ama elemanlar arasý dolasmak icin bir artýrma yapýldýgi
; en azindan o kisim yanlis olabilir

.model small
.data 
    dizi dw 1,2,3,?,4,5,6,?  ; istenirse dizi baslangýcýna boyut belirtilebilirdi dizi dw 08,1,2,3,?,4,5,6,? 

.code
    mov ax,@data
    mov ds, ax  
    
    mov ax, 00  ; icerigi sifirladik  (garanti olsun diye)
    
    mov si,00   ; icerigi sifirladik  (garanti olsun diye)
     
    mov cx,00   ; icerigi sifirladik  (garanti olsun diye)
    mov cl,02
    
don1:    

    mov ax, dizi[si]    ; ax=birinci eleman
    xor ax, dizi[si+1]  ; ax=ax XOR ikinci eleman
    xor ax, dizi[si+2]  ; ax=ax XOR ucuncu eleman
    mov dizi[si+3], ax  ; dorduncu eleman= ax
    add si,04           ; bir sonrakine gecis
    
    loop don1           ;dongu kontrol
    
    
    mov si,00 ; dizinin basina donmek icin sifirladik
    mov cx,00 ; icerigi sifirladik (garanti olsun diye)
    mov cl,08 ; dongu degerini atadik
    mov ax,00 ; Ah ile kalan kontrolu (cift-tek icin) icin sifirladik (garanti olsun diye)
    mov bx,00 ; icerigi sifirladik  (garanti olsun diye)
    mov dx,00 ; icerigi sifirladik  (garanti olsun diye)
    mov dh,02 ; cift degeri bulmak icin 2 atadik
    
don2:    
    mov bx, dizi[si]
    xchg bh,bl
    mov al,cl
    div dh
    cmp ah,0 ; Ax/DH = AH (kalan)  kalan sifir ise cift
    je cift  ; cift ise  cift etiketine dallan
    Rol bx,01; tek ise 1 defa sola kaydir
    mov dizi[si], bx ; degistirilmis ve kaydirilmis icerigi yerine ata
    inc si   ; bir sonraki dizi elemani icin bir arttir 
    loop don2 ; cx sifirlanmadi ise don2 etiketine git
    
    jmp son   ; cx sifirlandi ise islem tamam ve son etiketine dallan
       
cift:
    Rol bx,02        ; cift ise 2 defa sola kaydir
    mov dizi[si], bx ; degistirilmis ve kaydirilmis icerigi yerine ata
    dec cl           ; cl bir azalt cunku loop gormedigi icin otomatik azaltmaz
    inc si           ; bir sonraki dizi elemani icin bir arttir  
    jmp don2         ; ne olursa olsun don2 etiketine dallan

son:

;gorevi isletim sistemine birakmak icin gerekli kesme
mov ah,4ch
int 21h
end
