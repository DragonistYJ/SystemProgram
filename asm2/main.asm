.386  ;instruction set
.model flat,stdcall ;model

.code   ;this is a code segment 
main proc   ; define main function  
	mov ecx,1	; summand
	mov edx,2	; addend
	push ecx
	push edx
	call xaddy	
	ret     ;return
main endp   ;end of main

xaddy  proc
    push ebp
	mov ebp,esp
	sub esp,16
	xor eax,eax
	add eax,ecx
	add eax,edx
	mov esp,ebp
	pop ebp
	ret
xaddy endp
end         ;end of program
