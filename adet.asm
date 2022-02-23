;Girilen sayılardan 3'ten büyüklerin adedini bulan ve görüntüleyen program.
adet segment
ana proc far
Assume cs:adet, ds:adet
Mov ax,0
Push ds ax
Mov ax,adet
Mov ds,ax

jmp basla
m1 db 10,13,'Sayi giriniz:$'
m2 db 10,13,'3ten buyuk olanlarin sayisi:$'



basla:mov bl,0

mov cx,9
kontrol:
	mov ah,09h
	mov dx,offset m1
	int 21h
	
	mov ah,01h
	int 21h
	
	cmp al,'3'
	jg artir
	loop kontrol
	jmp yazdir

artir:
	add bl,1
	loop kontrol
	

yazdir:mov ah,09h
mov dx, offset m2
int 21h


mov ah,02h
mov dl,bl
add dl,30h
int 21h

ret
ana endp
adet ends
end