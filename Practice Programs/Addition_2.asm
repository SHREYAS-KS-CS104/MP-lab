.model small
.data
a dw 1234
b db 25
c dw ?
.code
        mov ax,@data
        mov ds,ax
        mov bl,b
        add ax,bx
        mov c,ax
        mov ah,4ch
        int 21h
        end