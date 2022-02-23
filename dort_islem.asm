;4 islem yapan program
hesap segment
ana proc far
assume cs:hesap,ds:hesap
mov ax,0
push ds ax
mov ax,hesap
mov ds,ax

jmp giris
m1 db 10,13,'ilk sayiyi giriniz:$'
m2 db 10,13,'ikinci sayiyi giriniz:$'
m3 db 10,13,'islem seciniz(+,-,*,/):$'
m4 db 10,13,'Cevap:$'
m5 db 10,13,'Gecersiz islem.$'
birinci db ?
ikinci db ?

giris:mov ah,09h
lea dx,m1
int 21h

mov ah,01h
int 21h
sub al,30h
mov birinci,al

mov ah,09h
lea dx,m2
int 21h

mov ah,01h
int 21h
sub al,30h
mov ikinci,al

mov ah,09h
lea dx,m3
int 21h

mov ah,01h
int 21h
cmp al,'+'
je topla
cmp al,'-'
je cikart
cmp al,'/'
je bol
cmp al,'*'
je carp

mov ah,09h
lea dx,m5
int 21h
jmp son

bol:mov al,birinci
mov ah,0
div ikinci
mov birinci,al
jmp goster

cikart:mov bl,ikinci
sub birinci,bl
jmp goster

carp:mov al,birinci
mul ikinci
mov birinci,al
jmp goster

topla:mov bl,ikinci
add birinci,bl
jmp goster

goster:mov ah,09h
lea dx,m4
int 21h

mov ah,02h
mov dl,birinci
add dl,30h
int 21h


son:ret 
ana endp
hesap ends
end