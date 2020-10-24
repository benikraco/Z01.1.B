; Arquivo: SWeLED.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Faça os LEDs exibirem 
; LED = ON ON ON ON ON !SW3 !SW2 !SW1 0
; Mesma questão da prova


leaw $21185, %A ; A aponta pra SW
movw (%A), %D  ; D=SW
notw %D ; D=!SW

leaw $496, %A ; A=496 -->5 primeiros LEDS acesos
orw %A, %D, %D ; or entre %A(496) e %D (!SW) e salva depois em %D dnv

; 1   1   1   1   1   0   0   0   0
; ---------------------------------- OR
;SW8 SW7 SW6 SW5 SW4 SW3 SW2 SW1 SW0
;===================================
; 1   1   1   1   1  SW3 SW2 SW1 SW0  

;preciso fazer o and agora pra fazer com que o LSB seja 0

; 1   1   1   1   1  SW3 SW2 SW1 SW0  
;------------------------------------ AND
; 1   1   1   1   1   1   1   1   0
;====================================
; 1   1   1   1   1  SW3 SW2 SW1  0

leaw $510, %A ;A=510
andw %A, %D, %D ;and entre %A(510) e %D (or) e salva depois em %D dnv

leaw $21184, %A ; A aponta pro LED
movw %D, (%A) ;copio D para LED



