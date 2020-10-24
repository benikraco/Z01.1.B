; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadrado no LCD

;guardando o valor de 16384 em A
leaw $16384, %A
movw %A, %D ;transferindo para D
leaw $0, %A ;colocando o valor do RAM 0 em A
movw %D, (%A) ;transferindo o valor de D 16384 para RAM 0
leaw $1, %D ;atribuindo RAM 1 em D

LOOP:
    leaw $6, %A ;usando o RAM 6 como contador do primeiro loop
    leaw $0, %D
    movw $1, (%D)
    addw $1, (%A)
    ;incw (%A)
    ;LOOP:
        ;leaw $7, %A ;usando o RAM 7 como contador do segundo loop
    movw $LOOP, (%A)
    jmp
    nop