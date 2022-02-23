;Tum karakterleri ekrana basar.
ascii segment
ana proc far
	assume cs:ascii
	mov ax,0
	push ds ax
	mov cl,255	; döngü değeri olarak 255 cl’ye atanır
dongu:	mov ah,02h
		mov dl,cl
		int 21h
		Mov ah,02h
		Mov dl,13
		int 21h
		Mov ah,02h
		Mov dl,10
		int 21h

		loop dongu
son: ret
ana endP
ascii endS
end
