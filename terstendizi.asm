;String komutlarını kullanarak klavyeden girilen bir diziyi yeni bir diziye kopyalayan ve yeni diziyi tersten görüntüleyen program
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
m2 db 10,13,'Yeni dizi:$'
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
lea si,dizi
lea di,yenidizi
mov cl,boyut
rep movsb

yazdir:
dec di
std
mov si,di

mov cl,boyut
mov ah,09h
lea dx,m2
int 21h

dongu:
lodsb
mov ah,02h
mov dl,al
int 21h
loop dongu

ret
ana endp
odev ends
end
