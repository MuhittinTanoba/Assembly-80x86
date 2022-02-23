;Girilen sayının 8'den büyük mü küçük mü olduğunu bulan ve ekrana yazan program
buyuk segment
ana proc far
assume cs:buyuk,ds:buyuk
mov ax,0
push ds ax
mov ax, buyuk
mov ds,ax

jmp basla
m1 db 10,13,'Bir deger giriniz: $'
m2 db 10,13,'Buyuk$'
m3 db 10,13,'Kucuk$'

basla:mov cl,5
sayial:mov ah,09h
mov dx,offset m1
int 21h

mov ah, 01h
int 21h

cmp al,'8'
jg buyuktur

kucuktur:mov ah, 09h
mov dx,offset m3
int 21h
jmp dongusonu

buyuktur:mov ah,09h
mov dx,offset m2
int 21h

dongusonu: loop sayial



ret
ana endp
buyuk ends
end