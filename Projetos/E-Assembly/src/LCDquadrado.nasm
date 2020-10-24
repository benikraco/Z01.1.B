; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadrado no LCD

leaw $16, %A
movw %A, %D
;contador no RAM 8
leaw $8, %A 
movw %D, (%A)

;inicializando 
leaw $17384, %A
movw %A, %D
leaw $9, %A 
movw %D, (%A)

WHILE:

    leaw $9, %A
    movw (%A), %D
    movw %D, %A 

    movw $-1, (%A)
    
;para ir para a linha de baixo
    movw %A, %D
    leaw $20, %A
    addw %D, %A, %A

;atualiza o RAM do LCD sendo usado
    movw %A, %D
    leaw $9, %A 
    movw %D, (%A)

;atualiza (decrementa) o contador
    leaw $8, %A
    movw (%A), %D
    decw %D
    movw %D, (%A)

    leaw $WHILE, %A
    jg %D
    nop

FIM: