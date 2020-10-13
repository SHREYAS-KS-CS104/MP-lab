.model small
.data
.code
        mov ax,@data
        mov ds,ax
        mov al,63h
        add al,88h
        daa
        mov ah,4ch
        int 21h
        end