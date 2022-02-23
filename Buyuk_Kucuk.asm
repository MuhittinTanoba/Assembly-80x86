;String komutlarını kullanarak girilen cümledeki büyük harfleri küçük harfe dönüştüren ve dizinin yeni halini görüntüleyen program
buyuk segment
ana proc far
assume cs:buyuk,ds:buyuk,es:buyuk
mov ax,0
push ds ax
mov ax,buyuk
mov ds,ax
mov es,ax

jmp giris
m1 db 10,13,'Bir dizi giriniz:$'
m2 db 10,13,'Dizinin yeni hali:$'
boyut db 0
dizi db 50 dup('$')

giris:mov ah,09h
lea dx,m1
int 21h

lea di,dizi

dizigir:mov ah,01h
int 21h

cmp al,13
je dizibitir

stosb
inc boyut

jmp dizigir

dizibitir:
lea si,dizi

mov cl,boyut

karsilastir:lodsb

cmp al,65
jge kucukmu
jmp yazdir

kucukmu:cmp al,90
jle donustur
jmp yazdir

donustur:
add al,32
jmp yazdir

yazdir:
mov ah,02h
mov dl,al
int 21h
loop karsilastir

son:ret 
ana endp
buyuk ends
end









