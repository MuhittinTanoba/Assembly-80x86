;2 basamaklı sonucu ekrana yazan teklerin adedini bulma programı
tek segment
ana proc far
assume cs:tek,ds:tek

mov ax,0
push ds ax
mov ax,tek
mov ds,ax

jmp giris
m1 db 10,13,'Sayi giriniz:$'
m2 db 10,13,'Teklerin sayisi:$'
adet db 0
iki db 2

giris:mov cl,25              ;dongu sayısı
dongu:
mov ah,09h             ;sayı alma mesajı
lea dx,m1
int 21h

mov ah,01h             ; karakter alma
int 21h
sub al,30h             ;sayı al'de

mov ah,0
div iki                ;al'dekini iki değişkeniyle otomatik bölüyor. Tam kısım al'de kalan ah'ta.

cmp ah,1               ;kalan 1 mi diye bakıyoruz 1 se tek kısmına gidecek
je teksayi

loop dongu
jmp goster

teksayi:inc adet
loop dongu

goster: mov ah,09h
lea dx,m2
int 21h

mov ah,02h
mov dl,adet
add dl,30h
int 21h

son:ret
ana endp
tek ends
end




