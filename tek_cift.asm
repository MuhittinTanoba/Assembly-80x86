;bolme komutuyla tek çift bulan program
tekcift segment
ana proc far
assume cs:tekcift,ds:tekcift
mov ax,0
push ds ax
mov ax,tekcift
mov ds,ax

jmp giris
m1 db 10,13,'Sayi girin:$'
iki db 2
m2 db 10,13,'Sayi tek.$'
m3 db 10,13,'Sayi cift.$'

giris:mov ah,09h
lea dx,m1
int 21h

mov ah,01h
int 21h
sub al,30h
mov bl,iki
div bl

cmp ah,0
je cift

tek:mov ah,09h
lea dx,m2
int 21h
jmp son

cift: mov ah,09h
lea dx,m3
int 21h


son:ret
ana endp
tekcift ends
end