;Dizi alan ve alınan diziyi tersten görüntüleyen program
ters segment
ana proc far
assume cs:ters,ds:ters,es:ters
mov ax,0
push ds ax
mov ax,ters
mov ds,ax
mov es,ax

jmp giris
m1 db 10,13,'Dizi giriniz:$'
m2 db 10,13,'Dizinin ters hali:$'
dizi1 db 50 dup('$')
boyut db 0

giris:
mov ah,09h
lea dx,m1
int 21h

lea di,dizi1

dizial:mov ah,01h
int 21h


cmp al,13
je yaz

stosb
inc boyut

jmp dizial

yaz:

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
ters ends
end
