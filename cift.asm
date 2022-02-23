;Girilen sayinin tek mi çift mi olduğunu ekrana yazan program
cift segment
ana proc far
assume cs:cift, ds:cift
push ds ax
mov ax,0
mov ax, cift
mov ds,ax

jmp giris
m1 db 10,13,'Sayi giriniz:$'
m2 db 10,13,'Sayi cift.$'
m3 db 10,13,'Sayi tek.$'

giris:mov ah,09h
lea dx,m1
int 21h

mov ah,01h
int 21h
sub al,30h
cmp al,0
je cifts

bolme:mov ah,0
mov bl,2
div bl
cmp ah,0
je cifts

tek:
mov ah, 09h
lea dx,m3
int 21h
jmp son

cifts:
mov ah,09h
lea dx,m2
int 21h

son:
ret
ana endp
cift ends
end