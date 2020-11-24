.model small
.data
n dw 4
r dw 2
ncr dw 0

.code
mov ax,@data
mov ds,ax

mov ax,n
mov bx,r
call ncrpro
call disp
jmp final

ncrpro  proc near
        cmp ax,bx  ;r=n
        je res1
        cmp bx,0  ;r=0
        je res1                                ; 3c2 +3c1
        cmp bx,1   ;r=1                           
        je resn
        dec ax      ;r=n-1
        cmp bx,ax                
        je incr                                     
        push ax                                                       
        push bx                      
        call ncrpro             
pop bx
pop ax
dec bx
push ax
push bx
call ncrpro
pop bx
pop ax
ret

res1:inc ncr
ret

incr:inc ncr
resn:add ncr,ax  ;1+2 3+3=6
ret
ncrpro endp 

disp proc near
  mov bx,ncr
  add bx,3030h
  mov  dl,bh
  mov ah,02h
  int 21h
  mov dl,bl
  mov ah,02h
  int 21h
  ret
  disp endp

final: mov ah,4ch
     int 21h
     end
