; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos


; Exemplo ao quadrado:
;
; 3  *  3    
; r1 * r1
; r0 = 3 * 3 = 3 + 3 + 3
;
;
; r0 = 0
; r1 = 3
; r0 = 0 + 3
; --------
; RAM[3] = 0;      <====
; while(r1 > 0):    ??? r1 <= 0
;    r1 = r1 + r0     |
;    r2 = r2 - 1 -->R2 VAI SER NOSSO CONTADOR     |
; <---- ENDWHILE      v
;;



    leaw $0, %A ;A=0 --> RAM[0]
    movw $0, (%A) ;RAM[0]=0

    leaw $1, %A 
    movw (%A), %D ;D=RAM[1]
    
    leaw $2, %A ;A=2 --> RAM[0]
    movw %D, (%A) ;RAM[2]=RAM[1] -->PONTO DE PARTIDA DO CONTADOR

WHILE:

    leaw $2, %A ;carrega 2 em A
    movw (%A), %D; D=RAM[2]
    leaw $ENDWHILE, %A ;se pular vai pra endwhile
    jle %D ;jmp se RAM[2] menor igual a zero
    nop

    leaw $1, %A ;carrega 1 em A
    movw (%A), %D ; D=RAM[1]
    leaw $0, %A ; A=0
    addw (%A), %D, %D ; D=RAM[0]+RAM[1]
    movw %D, (%A) ; RAM[0]=RAM[0]+RAM[1]

    leaw $2, %A
    movw (%A), %D ;D=RAM[2]
    decw %D ;D=RAM[2]-1
    movw %D, (%A) ; RAM[2]=RAM[2]-1

    leaw $WHILE, %A
    jmp
    nop

ENDWHILE:
