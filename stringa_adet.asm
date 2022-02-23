;String komutlarıyla alınan dizi içerisindeki 'a' harflerinin adedini ekrana yazan program
aadet segment
ana proc far
assume cs:aadet,ds:aadet,es:aadet
mov ax,0
push ds ax
mov ax,aadet
mov ds,ax
mov es,ax

jmp giris
m1 db 10,13,'Dizi giriniz:$'
m2 db 10,13,'A adeti:$'
boyut db 0
dizi1 db 50 dup('$')

giris:mov ah,09h
lea dx,m1
int 21h

lea di,dizi1

dizial:mov ah,01h
int 21h

cmp al,13
je diziboyut

stosb
inc boyut

jmp dizial

diziboyut:lea si,dizi1
mov cl,boyut

dongu:lodsb

cmp al,97d
je artir
loop dongu
jmp yazdir


artir:add bl,1
loop dongu

yazdir:mov ah,09h
lea dx,m2
int 21h

mov ah,02h
mov dl,bl
add dl,30h
int 21h

ret
ana endp
aadet ends
end
