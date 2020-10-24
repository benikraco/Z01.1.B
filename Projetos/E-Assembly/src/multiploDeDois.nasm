; Arquivo: multiploDeDois.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; multiplo de dois, se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

;leaw $3, %A
;movw %A, %D

;movw %D, (%A)

leaw $5, %A
movw (%A), %D

WHILE:

    decw %D
    leaw $IMPAR, %A
    jle %D
    nop
    
    decw %D
    leaw $PAR, %A
    jle %D
    nop

    leaw $WHILE, %A
    jmp
    nop

IMPAR:
    leaw $0, %A
    movw $0, (%A)
    leaw $FIM, %A
    jmp
    nop

PAR:
    leaw $0, %A
    movw $1, (%A)
    leaw $FIM, %A
    jmp
    nop

FIM: