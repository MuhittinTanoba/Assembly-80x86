;String komutlarıyla dizi kopyalama
kopyala segment
ana proc far
assume cs:kopyala,ds:kopyala,es:kopyala
mov ax,0
push ds ax
mov ax,kopyala
mov ds,ax
mov es,ax

jmp giris
m1 db 10,13,'Dizi giriniz:$'
m2 db 10,13,'Kopyalanan dizi:$'
ilkdizi db 50 dup('$')
kopyalanan db 50 dup('$')
boyut db 0


giris:mov ah,09h
lea dx,m1
int 21h

lea di,ilkdizi
dizigir:mov ah,01h
int 21h

cmp al,13
je dizison

stosb
inc boyut
jmp dizigir

dizison:lea si,ilkdizi
lea di,kopyalanan
mov cl,boyut
rep movsb

yazdir:lea si,kopyalanan
mov cl,boyut
mov ah,09h
lea dx,m2
int 21h

dongu:lodsb
mov ah,02h
mov dl,al
int 21h
loop dongu

ret
ana endp
kopyala ends
end