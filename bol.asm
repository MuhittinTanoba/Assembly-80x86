;Girilen iki sayiyi birbirine bolen ve sonuçları ekrana yazan program
orn segment
ana proc far

	assume cs:orn,ds:orn
	mov ax,0
	push ds ax
	mov ax, orn
	mov ds, ax
	
	jmp sayi1_al
	
	sayi1 db ?
	sayi2 db ?
	bolum db ?
	kalan db ?
	
	m1 db 10,13,'Birinci sayiyi giriniz:$'
	m2 db 10,13,'Ikinci sayiyi giriniz:$'
	m3 db 10,13,'Bolum:$'
	m4 db 10,13,'Kalan:$'
	
	
	sayi1_al: mov ah,09h
			  mov dx, offset m1
			  int 21h
			  
			  mov ah, 01h
			  int 21h
			  sub al,30h
			  mov sayi1,al
			  
	sayi2_al: mov ah,09h
			  mov dx, offset m2
			  int 21h
			  
			  mov ah, 01h
			  int 21h
			  sub al,30h
			  mov sayi2,al
		
	   bolme: mov ah,0
			  mov al,sayi1
			  mov bl,sayi2
			  div bl
			  mov bolum,al
			  mov kalan,ah
			  
			  mov ah,09h
			  lea dx, m3
			  int 21h
			  
			  mov ah,02h
			  mov dl,bolum
			  add dl,30h
			  int 21h
			  
			  mov ah,09h
			  lea dx,m4
			  int 21h
			  
			  mov ah,02h
			  mov dl,kalan
			  add dl,30h
			  int 21h
			  
		ret
		ana endp
		orn ends
		end