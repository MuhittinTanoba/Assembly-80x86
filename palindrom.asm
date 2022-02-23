;String komutlarını kullanarak girilen dizinin palindorme olup olmadığını bulan ve uygun mesajı görüntüleyen program
odev segment
ana proc far
assume cs:odev,ds:odev,es:odev
mov ax,0
push ds ax
mov ax,odev
mov ds,ax
mov es,ax

jmp giris
m1 db 10,13,'Dizi giriniz:$'
m2 db 10,13,'Palindromdur.$'
m3 db 10,13,'Palindrom degildir.$'
boyut db 0
dizi db 50 dup('$')
yenidizi db 50 dup('$')

giris:
mov ah,09h
lea dx,m1
int 21h

lea di,dizi

dizigir:
mov ah,01h
int 21h

cmp al,13
je dizison

stosb
inc boyut
jmp dizigir

dizison:
dec di
std
mov si,di
lea di,yenidizi
mov cl,boyut

dongu:
std
lodsb

yenidiziyap:
cld
stosb
loop dongu

kontrol:mov cl,boyut
lea di,dizi
lea si,yenidizi
repe cmpsb
jne polindromdegil

polindrom:mov ah,09h
lea dx,m2
int 21h
jmp son

polindromdegil:mov ah,09h
lea dx,m3
int 21h

son:ret
ana endp
odev ends
end

