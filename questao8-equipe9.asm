;Componentes do grupo: Indaiara, Maiara, Liang, Pedro Miranda

section .data
message1: db "Digite l1",10,0
message2: db "Digite l2",10,0
message3: db "Digite l3",10,0
message4: db "equilatero",10,0
message5: db "escaleno",10,0
message6: db "isosceles",10,0

fmt2 db "%lf",0
section .bss
l1: resq 1
l2: resq 1 
l3: resq 1 

section .text
global main
extern printf
extern scanf

main: 
     push rbp
     mov rbp,rsp
   
     mov rdi, message1
     call printf
     
     mov rdi, fmt2
     mov rsi, l1
     call scanf

     mov rdi,message2
     call printf

     mov rdi, fmt2
     mov rsi, l2
     call scanf

     mov rdi,message3
     call printf

     mov rdi, fmt2
     mov rsi, l3
     call scanf

    mov rax ,[l2]   ;move l2 pra rax
    cmp rax,[l1]    ; compara l2 com l1
    jnz ehdiferente  ; se l1 for diferente de l2 pula
    cmp rax,[l3]     ;compara l2 com l3
    je equilatero    ;se igual pula pra equilatero
    jnz isosceles    ;se diferente pula pra isosceles
    jmp fim
    
    ehdiferente:
    cmp rax,[l3]     ;compara l2 com l3 
    je isosceles     ;se l2 e l3 sao iguais pula para isosceles
    jne escaleno     ;se l2 e l3 diferente ,pula pra escaleno
      
    equilatero:
    mov rdi ,message4
    call printf
    jmp fim
    
    escaleno:
    mov rdi ,message5
    call printf
    jmp fim

    isosceles:
    mov rdi ,message6
    call printf
 
    fim:
    leave
    ret

    ;nasm -felf64 main.asm -o main.o
    ;gcc main.o  -o programa -no-pie -lm
    ;./programa
