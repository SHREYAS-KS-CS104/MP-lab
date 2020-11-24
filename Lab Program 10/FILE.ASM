.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.data
msg1 db 0dh,0ah,"Enter the filename for creation: $"
msg2 db 0dh,0ah,"File Created Succesfully: $"
msg3 db 0dh,0ah,"File Creation Unsuccesfull: $"
msg4 db 0dh,0ah,"Enter the filename for deletion: $"
msg5 db 0dh,0ah,"File Deleted Succesfully: $"
msg6 db 0dh,0ah,"File Deleteion failed: $"
fname1 db 10 dup(0)
fname2 db 10 dup(0)

.code
mov ax,@data
mov ds,ax
display msg1
mov si,00
back1: mov ah,01h
       int 21h
       cmp al,0dh
       je next1
       mov fname1[si],al
       inc si
       jmp back1

next1: mov fname1[si],'$'
       lea dx,fname1
       mov cx,00
       mov ah,3ch
       int 21h
       jc cfail
       display msg2
       jmp del

cfail: display msg3
del: display msg4
     mov si,00


back2: mov ah,01h
       int 21h
       cmp al,0dh
       je next2
       mov fname2[si],al
       inc si
       jmp back2

next2: mov fname2[si],'$'
       lea dx,fname2
       mov ah,41h
       int 21h
       jc dfail
       display msg5
       jmp final

dfail: display msg6

final: mov ah,4ch
       int 21h

end
