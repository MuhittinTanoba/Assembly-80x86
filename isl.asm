;Sayilar üstünde aritmetik islemler yapan program
islem segment
ana proc far
assume cs:islem,ds:islem
mov ax,0
push ds ax
mov ax,islem
mov ds,ax

jmp basla
m1 db 10,13,'Birinci sayiyi giriniz:$'
m2 db 10,13,'Ikinci sayiyi giriniz:$'
m3 db 10,13,'Sayilarin farki:$'
m4 db 10,13,'Sayilarin toplami:$'

basla:mov ah,09h
lea dx, m1
int 21h
mov ah,01h
int 21h
sub al,30h
mov bl,al
mov ah,09h
mov dx, offset m2
int 21h
mov ah,01h
int 21h
cmp bl,al
jg cikart

add bl,al
mov ah,09h
mov dx, offset m4
int 21h
Mov ah,02h
Mov dl,bl
Add dl,30h
int 21h
jmp son

cikart:sub bl,al
mov ah,09h
mov dx, offset m3
int 21h
mov ah,02h
mov dl,bl
add dl,30h
int 21h

son:ret
ana endp
islem ends
end