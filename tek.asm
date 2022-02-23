;Girilen sayılardan teklerin adedini bulan program
tek segment
ana proc far
assume cs:tek, ds:tek
mov ax,0
push ds ax
mov ax,tek
mov ds,ax

jmp giris
m1 db 10,13,'Sayi giriniz:$'
m2 db 10,13,'Teklerin sayisi:$'
sayac db 0

giris: mov bl,0
mov cx,25
dongu:mov ah,09h
mov dx,offset m1
int 21h

mov ah,01h
sub al,30h
int 21h

mov ah,0
mov dl,2
div dl

cmp ah,0
jne artir
loop dongu
jmp yazdir

artir:add sayac,1
loop dongu


yazdir:mov ah,09h
mov dx,offset m2
int 21h

mov ah,02h
mov dl,sayac
add dl,30h
int 21h


ret 
ana endp
tek ends
end