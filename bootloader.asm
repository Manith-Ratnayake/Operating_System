org 0x7C00
bits 16


start:
  jmp main


puts:
  push si
  push ax


.loop:
  loadsb
  or al, al
  jz .done 

  mov ah, 0x0e
  int 0x10

.done:
  pop ax
  pop si
  ret


main
  mov ax , 0
  mov ds , ax
  mov es , ax 
  
  mov ss , ax
  mov sp , 0x7C00

  mov si , msg_hello
  call puts 

  hlt

.hlt
  jmp .hlt

times 510-($-$$) db 0 
dw 0A
