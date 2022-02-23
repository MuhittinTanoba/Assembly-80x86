;Girilen iki sayı üzerinde ‘OR’ işlemini yaparak, sayıları ve sonucu binary olarak görüntüleyen program
odev segment
ana proc far
assume cs:odev,ds:odev,es:odev
mov ax,0
push ds ax
mov ax,odev
mov ds,ax
mov es,ax


jmp giris
m1 db 10,13,'birinci sayiyi giriniz:$'
m2 db 10,13,'ikinci sayiyi giriniz:$'
m3 db 10,13,'Sonuc:$'
iki db 2
bolum db ?
kalan db ?

giris:
mov ah,09h
lea dx,m1
int 21h

mov ah,01h
int 21h
mov bl,al

mov ah,09h
lea dx,m2
int 21h

mov ah,01h
int 21h

or al,bl


yazma:mov ah,09h
lea dx,m3
int 21h



dongu:mov ah,0
div iki
mov bolum,al
mov kalan,ah

cmp bolum,0
jge kalanibas

mov ah,02h
mov dl,bolum
add dl,30h
int 21h
jmp son


kalanibas:mov ah,02h
mov dl,kalan
add dl,30h
int 21h
mov al,bolum
jmp dongu


son:ret
ana endp
odev  ends
end
