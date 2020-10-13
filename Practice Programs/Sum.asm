  
.model small
.data
a dw 2345h
b dw 4521h
d dw 1256h
c dw ?
.code
mov ax,@data
mov ds,ax
mov bx,a
add bx,b
sub bx,d
mov c,bx
mov ah,4ch
int 21h
end