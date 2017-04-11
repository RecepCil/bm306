; Duzce Universitesi Bilgisayar Muhendisligi
; Sistem Programlama 2015 - 2016 Bahar Donemi
; 7 Nisan 2016 Vize Sinavi
; Asagidaki ozellikleri saglayan Assembly programini yaziniz:
; a sikki:
; icerigi 1, 2, 3, ?, 5, 6, 7, ? olan word dizinin birinci elemanini ikinci elemaniyla xor'layip
; bu sonucu ucuncu elemaniyla xor'layan ve sonucu dorduncu elemana atayan ve sonraki dort eleman
; icin de bu islemleri (tercihen bir dongu kullanarak) tekrarlayan program bolumunu yaziniz.
; b sikki:
; Dizinin son halindeki tum elemanlarin dusuk degerliklikli (lsb) kisimlarini
; yuksek degerlikli kisimlariyla degistirin.
; c cikki:
; Dizinin elemanlarinin indislerini kontrol ettirin, indis cift sayiysa
; elamanin ikilik degerini iki kere sola kaydirin, elemanin indisinin degeri
; tek sayiysa elemanin ikilik degerini bir kere sola kaydirin.
; (soru siklari, program kodlarindan ve aciklama satirlarindan tahmini olarak yazilmistir)

.model small
.data
	dizi dw 1, 2, 3, ?, 5, 6, 7, ?
	cift db 2 ; dizi indisi tek mi cift mi? kontrol degiskeni
.code
	mov ax, @data
	mov ds, ax
	mov ax, 00	; ax'i temizle
	mov cx, 08	; dongu degerini cx'e ata
bas:
	mov ax, dizi[si]	; dizinin 1. elemani ax'te
	add si, 2	; 2. word elemana gec
	xor ax, dizi[si]	; ax:=1. eleman (zaten ax'te idi) xor 2. elaman
	add si, 2	; 3. word elemana gec
	xor ax, dizi[si]	; ax:=sonuc (1. ve 2. elemani xor'lamistik) xor 3. eleman
	add si, 2	; 4. word elemana gec
	mov dizi[si], ax	; ve ax icerigini (1. eleman xor 2. eleman xor 3. eleman) bu elemana yukle
	add si, 2	; 5. word elemana gec
	cmp si, 16	; si, 2'ser artti ve 8 adet word eleman icin 16 oldu mu? yani dizi bitti mi?
	jne bas		; bitmediyse bas etiketine git ve 5, 6, 7. elemanlari da ayni sekilde xor'la
	mov si, 00	; dizi uzerindeki 2. adima (b sikki) gecmek icin indisi sifirla
don:
	mov ax, dizi[si]	; dizinin word elemani ax'e al
	mov bl, al	; bu elemanin dusuk degerlikli (lsb) kismini bl'de tut
	mov al, ah	; yuksek degerlikli (msb) kismini al'ye al
	mov ah, bl	; dusuk degerlikli (lsb) kismini ah'a al. Yani tersleme yapildi!!!
	mov bx, ax	; terslenen word elemani bx'e al
	mov ax, cx	; bu elemanin indisini ax'e yukle
	div cift	; ve 2'ye bol
	cmp ah, 00	; ve kalana bakarak tek mi cift mi kontrol et
	jne bir	; kalan 0 degilse indis tekse bir defa kaydirmak icin alttaki satırı atlayarak bir etiketine git
	rol bx, 1	; kalan 0 ise, indis ciftse word elemani 1 defa sola kaydir
bir:
	rol bx, 1	; ve word elemani 2. defa sola kaydir
	mov dizi[si], bx	; yeni word elemani dizi icinde kendi yerine at
	add si, 2	; ve sonraki word elemana gec
	loop don	; cx = 0 olana kadar devam
	end
