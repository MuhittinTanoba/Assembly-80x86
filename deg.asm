;Klavyeden alınan 2 sayının yerini degistiren program
deg segment
ana proc far
assume ds:deg,cs:deg
mov ax,0
push ds ax
mov ax,deg
mov ds,ax

jmp basla
m1 db 10,13,'Birinci sayiyi giriniz:$'
m2 db 10,13,'Ikinci sayiyi giriniz:$'
m3 db 10,13,'Birinci sayinin yeni degeri:$'
m4 db 10,13,'Ikinci sayinin yeni degeri:$'
bir db ?
iki db ?

basla:mov ah,09h
mov dx,offset m1
int 21h

mov ah,01h
mov dx,offset bir
int 21h

mov ah,09h
lea dx,m2
int 21h

mov ah,01h
mov dx,offset iki
int 21h

mov al,bir
mov bl,iki
mov bir,bl
mov iki,al

mov ah,09h
mov dx,offset m3
int 21h

mov ah,02h
mov dx,offset bir
int 21h

mov ah,09h
mov dx,offset m4
int 21h

mov ah,02h
mov dx,offset iki
int 21h

ret
ana endp
deg ends
end