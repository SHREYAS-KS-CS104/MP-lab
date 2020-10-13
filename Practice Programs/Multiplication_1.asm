.model small
.data
a dw 2345h
b dw 4521h
c dw ?
d dw ?
.code
        mov ax,@data
        mov ds,ax
        mov ax,a
        mov bx,b
        mul bx
        mov c,ax
        mov d,dx
        mov ah,4ch
        int 21h
        end