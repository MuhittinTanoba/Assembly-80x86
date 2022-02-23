;Iki basamakli sayidan tek basamakli sayıyı cıkartan ve sonucu ekrana yazan program
fark segment
ana proc far
assume cs:fark, ds:fark
mov ax,0
push ds ax
mov ax,fark
mov ds,ax

jmp giris
m1 db 10,13,'iki basamakli sayi giriniz:$'
m2 db 10,13,'tek basamakli sayi giriniz:$'
m3 db 10,13,'fark=$'
oncarp db 10


giris:mov ah,09h
mov dx,offset m1
int 21h

mov ah,01h
int 21h

sub al,30h
mov ah, 0
mul oncarp

mov bl,al
mov ah,01h
int 21h

sub al,30h
add bl,al

mov ah,09h
lea dx,m2
int 21h

mov ah,01h
int 21h
sub al,30h

sub bl,al

mov ah,09h
lea dx,m3
int 21h

mov ah,02h
mov dl,bl
add dl,30h
int 21h

son: ret
ana endp
fark ends
end 
