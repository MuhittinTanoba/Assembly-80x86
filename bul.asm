;Girilen dizinin 7. indisindeki karakteri ekrana basan program
bul segment
ana proc far
assume cs:bul,ds:bul
mov ax,0
push ds ax
mov ax,bul
mov ds,ax

jmp basla
m1 db 10,13,'Bir dizi giriniz:$'
m2 db 10,13,'Karakter:$'
dizi db 50 dup('$')

basla:mov ah,09h
mov dx,offset m1
int 21h

mov ah,0ah
mov dx,offset dizi
int 21h

mov bx,offset dizi
mov al,7
xlat

mov ah,09h
mov dx,offset m2
int 21h

mov ah,02h
mov dl,al
int 21h

ret
ana endp
bul ends
end