; Arquivo: LCDletraGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD a letra do grupo de vocês
;  - Valide no hardawre
;  - Bata uma foto!

leaw $16384, %A
movw (%A), %D

LOOP:
    movw $-1, (%A)
    movw $LOOP, (%A)
    jmp
    nop

;quadrado 20X20
