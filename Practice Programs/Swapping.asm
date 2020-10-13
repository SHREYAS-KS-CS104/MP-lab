  
.model small
.data
a db 10h,20h,30h,40h,50h
b db 11h,22h,33h,44h,55h
.code
mov ax,@data
mov ds,ax
lea si,a
lea di,b

mov cl,05h
l1:mov al,[si]
xchg al,[di]
mov [si],al
inc si
inc di
loop l1
mov ah,4ch
int 21h
end 