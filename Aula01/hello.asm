; Complilar: Transformar o programa em linguagem de máquina
; - para compilar -> nasm -f elf64 hello.asm
; Linkeditar: Transformar o programa que está em linguagem de máquina em um programa executável pelo SO
; - para gerar o executavel -> ld -s -o hello hello.o

section .data

    msg db 'Hello World!', 0xA
    tam equ $- msg
    msgC db 'Hello America!', 0xA
    tamC equ $- msgC

section .text

global _start

_start:
    mov eax, 0x4 ; Estou mandando alguma coisa para saída padrão
    mov ebx, 0x1 ; eax e ebx andão pareados sempre que aparecem um em uma movimentação
    mov ecx, msg
    mov edx, tam
    int 0x80 ; Executa
    mov eax, 0x4 ; Estou mandando alguma coisa para saída padrão
    mov ebx, 0x1 ; eax e ebx andão pareados sempre que aparecem um em uma movimentação
    mov ecx, msgC
    mov edx, tamC
    int 0x80 ; Executa
    
    ; destino , origem EAX =1
    mov eax, 0x1 ; Informa o SO que está terminando o programa
    mov ebx, 0x0 ; Informa o SO que o valor de retorno é 0
    int 0x80