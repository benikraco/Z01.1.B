; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

leaw $0, %A  
movw %A, %D
leaw $2, %A
movw %D, (%A) 

LOOP:
leaw $0, %A
movw (%A), %D
leaw $1, %A
subw %D, (%A), %D  
leaw $0, %A
movw %D, (%A)
leaw $FIM, %A
jl 
nop

leaw $2, %A
movw (%A), %D
addw $1, %D, %D
movw %D, (%A)

leaw $LOOP, %A
jmp
nop

FIM:



















































































