; Arquivo: LCDletraGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD a letra do grupo de vocês
;  - Valide no hardawre
;  - Bata uma foto!

;utilizando o codigo desenvolvido no lcd quadrado

;14 - tipo A da letra B
leaw $14, %A
movw %A, %D
leaw $10, %A
movw %D, (%A)

;9 - tipo B da letra B
leaw $9, %A
movw %A, %D
leaw $11, %A
movw %D, (%A)

leaw $9, %A
movw %A, %D
leaw $12, %A
movw %D, (%A)

leaw $9, %A
movw %A, %D
leaw $13, %A
movw %D, (%A)

leaw $14, %A
movw %A, %D
leaw $14, %A
movw %D, (%A)

leaw $9, %A
movw %A, %D
leaw $15, %A
movw %D, (%A)

leaw $9, %A
movw %A, %D
leaw $16, %A
movw %D, (%A)

leaw $9, %A
movw %A, %D
leaw $17, %A
movw %D, (%A)

leaw $14, %A
movw %A, %D
leaw $18, %A
movw %D, (%A)

;contador de linhas (sao 9)
leaw $0, %A
movw %A, %D
leaw $20, %A
movw %D, (%A)

;inicializando 
leaw $16384, %A
movw %A, %D
leaw $21, %A 
movw %D, (%A)

;mascara 1
leaw $8, %A
movw %A, %D
leaw $22, %A
movw %D, (%A)

;mascara 2
leaw $4, %A
movw %A, %D
leaw $23, %A
movw %D, (%A)

;mascara 3
leaw $2, %A
movw %A, %D
leaw $24, %A
movw %D, (%A)

;mascara 4
leaw $1, %A
movw %A, %D
leaw $25, %A
movw %D, (%A)

;contador de mascaras/colunas
leaw $0, %A
movw %A, %D
leaw $26, %A
movw %D, (%A)

WLINHA:
    leaw $20, %A 
    movw (%A), %D 
    leaw $10, %A
    addw %A, %D, %A
    movw (%A), %D
    leaw $8, %A 
    andw %A, %D, %D

    leaw $DESENHA, %A 
    jne %D 
    nop

;coluna 1
RETORNO1:
;incrementando os contadores
;inicio do proximo pixel
    leaw $21, %A 
    movw (%A), %D
    incw %D
    movw %D, (%A)

;contador
    leaw $26, %A 
    movw (%A), %D
    incw %D
    movw %D, (%A)





    leaw $20, %A 
    movw (%A), %D 
    leaw $10, %A
    addw %A, %D, %A
    movw (%A), %D
    leaw $4, %A 
    andw %A, %D, %D

    leaw $DESENHA, %A 
    jne %D 
    nop

;coluna 2
RETORNO2:
;incrementando os contadores
;inicio do proximo pixel
    leaw $21, %A 
    movw (%A), %D
    incw %D
    movw %D, (%A)

;contador
    leaw $26, %A 
    movw (%A), %D
    incw %D
    movw %D, (%A)




    leaw $20, %A 
    movw (%A), %D 
    leaw $10, %A
    addw %A, %D, %A
    movw (%A), %D
    leaw $2, %A 
    andw %A, %D, %D

    leaw $DESENHA, %A 
    jne %D 
    nop

;coluna 3
RETORNO3:
;incrementando os contadores
;inicio do proximo pixel
    leaw $21, %A 
    movw (%A), %D
    incw %D
    movw %D, (%A)

;contador
    leaw $26, %A 
    movw (%A), %D
    incw %D
    movw %D, (%A)




    leaw $20, %A 
    movw (%A), %D 
    leaw $10, %A
    addw %A, %D, %A
    movw (%A), %D
    leaw $1, %A 
    andw %A, %D, %D

    leaw $DESENHA, %A 
    jne %D 
    nop

;coluna 4
RETORNO4:
;incrementando os contadores
;inicio do proximo pixel
    leaw $21, %A 
    movw (%A), %D
    incw %D
    movw %D, (%A)

;contador
    leaw $26, %A 
    movw (%A), %D
    incw %D
    movw %D, (%A)

leaw $FIM, %A 
jmp
nop


DESENHA:



leaw $16, %A
movw %A, %D
;contador no RAM 8
leaw $8, %A 
movw %D, (%A)

leaw $21, %A
movw (%A), %D
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

    leaw $26, %A 
    movw (%A), %D
    leaw $RETORNO1, %A 
    je %D
    nop
    decw %D 

    leaw $RETORNO2, %A 
    je %D
    nop
    decw %D 

    leaw $RETORNO3, %A 
    je %D
    nop
    decw %D 

    leaw $RETORNO4, %A 
    je %D
    nop
    decw %D 

FIM: