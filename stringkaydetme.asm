;String komutlarıyla dizi alıp diziyi ve boyutunu ekrana yazan program
dizi segment
ana proc far
assume cs:dizi,ds:dizi,es:dizi
mov ax,0
push ds ax
mov ax,dizi
mov ds,ax
mov es,ax


jmp giris
m1 db 10,13,'dizi girin:$'
m2 db 10,13,'girdiginiz dizi:$'
m3 db 10,13,'dizinin boyutu:$'
boyut db 0
dizi1 db 50 dup('$')


giris:
mov ah,09h
lea dx,m1
int 21h

lea di,dizi1

dizigir:
mov ah,01h
int 21h

cmp al,13
je yazdir

stosb
inc boyut
jmp dizigir

yazdir:mov ah,09h
lea dx,m2
int 21h

lea si,dizi1
mov cl,boyut

dongu:lodsb

mov ah,02h
mov dl,al
int 21h

loop dongu

mov ah,09h
lea dx,m3
int 21h
mov ah,02h
mov dl,boyut
add dl,30h
int 21h

ret
ana endp
dizi ends
end






