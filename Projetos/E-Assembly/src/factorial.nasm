; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

; Exemplo:
;
; 3   
; r0
; r1 = 3 * 2 * 1 = 3 + 3
;
;
; r0 = 3
; r1 = 0
; --------
; RAM[1] = 1;   
; while(r0 > 0):    
;    r1 = r1 * r0     
;    r0 = r0 - 1      
; <---- ENDWHILE      
;;

 

    leaw $0, %A 
    movw (%A), %D 

    leaw $1, %A 
    movw %D, (%A)

 LOOP:
    
    leaw $0, %A 
    movw (%A), %D 
    decw %D 
    movw %D, (%A) 

    leaw $ENDWHILE, %A
    je %D 
    nop

    leaw $3, %A 
    movw %D, (%A) 

    leaw $1, %A 
    movw (%A), %D 

    leaw $2, %A 
    movw %D, (%A)

    leaw $WHILE, %A
    jmp
    nop


WHILE:

    leaw $3, %A 
    movw (%A), %D 
    decw %D 
    movw %D, (%A) 

    leaw $3, %A 
    movw (%A), %D 
    leaw $LOOP, %A 
    je %D 
    nop

    leaw $2, %A
    movw (%A), %D
    leaw $1, %A
    addw (%A), %D, %D
    movw %D, (%A)

    leaw $WHILE, %A 
    jmp
    nop

 ENDWHILE:

    leaw $2, %A 
    movw $0, (%A)
