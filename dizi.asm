;Girilen dizideki 'a' harflerinin adedini ekrana basan program
dizi segment
ana proc far
Assume cs:dizi, ds:dizi
Mov ax,0
Push ds ax
Mov ax,dizi
Mov ds,ax

jmp basla
m1 db 10,13,'dizi giriniz:$'
m2 db 10,13,'a harfinden su kadar var:$'
gir db 30 dup('$')

basla:mov ah,09h
	  mov dx,offset m1
	  int 21h
	  
	  mov ah,0ah
	  mov dx,offset gir
	  int 21h
	  
	  mov bl,0
	  mov cx,9
dongu:mov bx,offset gir
	  mov al,bl
	  xlat
	  cmp al,'a'
	  add bl,1
	  je artir
	  loop dongu
jmp yazdir
	  
	  
artir:
	  
yazdir:mov ah,02h
	   mov dl,bl
	   add dl,30h
	   int 21h
son:ret
ana endp
dizi ends
end
	  