;Girilen cümlede kaç tane kelime olduğunu bulan program
sayisi segment
ana proc far
assume cs:sayisi, ds:sayisi, es:sayisi
mov ax,0
push ds ax
mov ax, sayisi
mov ds,ax
mov es, ax

jmp basla

m1 db 10,13,'kelimeler giriniz:$'
m2 db 10,13, 'kelime adeti:$'
dizi db 200 dup('$')
bosluksayisi db 1

basla: mov ah,09h
       lea dx, m1
       int 21h

       lea di, dizi

dizigirin: mov ah,01h
           int 21h
		   
           cmp al,13
           je dizison
           

		   stosb
		   
		   cmp al,32
		   jne dizigirin
		   inc bosluksayisi
           jmp dizigirin

dizison: mov ah,09h
         lea dx, m2
         int 21h


         mov ah,02h
         mov dl, bosluksayisi
		 add dl,30h
         int 21h

         ret
         ana endp
         sayisi ends
         end
           
           
