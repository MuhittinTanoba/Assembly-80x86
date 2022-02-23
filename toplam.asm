;Klavyeden girilen 10 adet sayıdan tek sayıların toplamını gösteren program
deneme segment
ana proc far
assume cs:deneme,ds:deneme,es:deneme
mov ax,0
push ds ax
mov ax,deneme
mov ds,ax
mov es,ax

jmp giris
m1 db 10,13,'sayi giriniz:$'
m2 db 10,13,'toplam:$'
toplam db 0
on db 10
onlar db ?
birler db ?

giris:mov cl,10
dongu:mov ah,09h
lea dx,m1
int 21h

mov ah,01h
int 21h
sub al,30h

test al,00000001b
jz don

add toplam,al

don:loop dongu

yazdir:mov ah,09h
lea dx,m2
int 21h

mov al,toplam
mov bl,on
mov ah,0
div bl
mov birler,ah
mov onlar,al


mov ah,02h
mov dl,onlar
add dl,30h
int 21h

mov ah,02h
mov dl,birler
add dl,30h
int 21h



ret 
ana endp
deneme ends
end
