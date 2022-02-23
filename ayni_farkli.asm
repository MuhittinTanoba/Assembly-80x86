;Alınan dizilerin farklı mı aynı mı olduğunu bulan program
comp segment
ana proc far
assume cs:comp,ds:comp,es:comp
mov ax,0
push ds ax
mov ax,comp
mov ds,ax
mov es,ax

jmp giris
m1 db 10,13,'Ilk diziyi giriniz:$'
m2 db 10,13,'Ikinci diziyi giriniz:$'
m3 db 10,13,'Diziler ayni.$'
m4 db 10,13,'Diziler farkli.$'
ilkdizi db 50 dup('$')
ikincidizi db 50 dup('$')
boyut1 db 0 
boyut2 db 0


giris:
mov ah,09h
lea dx,m1
int 21h

lea di,ilkdizi
ilkdizial:
mov ah,01h
int 21h

cmp al,13
je ilkdizibitir

stosb

inc boyut1
jmp ilkdizial

ilkdizibitir:mov ah,09h
lea dx,m2
int 21h

lea di,ikincidizi
ikincidizial:
mov ah,01h
int 21h

cmp al,13
je ikincidizibitir

stosb
inc boyut2
jmp ikincidizial

ikincidizibitir:
mov al,boyut1
cmp al,boyut2
jne esitdegil

karsilastirma:mov cl,boyut1
lea si,ilkdizi
lea di,ikincidizi

repe cmpsb
jne esitdegil

esit:mov ah,09h
mov dx,offset m3
int 21h
jmp son
esitdegil:mov ah,09h
mov dx,offset m4
int 21h

son:
ret
ana endp
comp ends
end