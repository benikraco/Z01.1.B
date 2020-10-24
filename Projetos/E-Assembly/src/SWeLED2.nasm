; Arquivo: SWeLED2.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF
;
;                                ^            ^
;                                | TRUQUE!    | TRUQUE!

leaw $21185, %A ; A aponta pra SW
movw (%A), %D  ; D=SW

;preciso fazer o or

; 0   0   0   1   1   0   1   0   0
; ---------------------------------- OR
;SW8 SW7 SW6 SW5 SW4 SW3 SW2 SW1 SW0
;===================================
;SW8 SW7 SW6  1   1  SW3  1  SW1 SW0  --> tenho 1s ok

leaw $52, %A ; A=52 
orw %A, %D, %D ; or entre %A(496) e %D (SW) e salva depois em %D dnv

;preciso fazer o and 

;SW8 SW7 SW6  1   1  SW3  1  SW1 SW0  
;------------------------------------ AND
; 1   0   0   1   1   0   1   0   0
;====================================
;SW8  0   0   1   1   0   1   0   0 ---> 1s e SW8 okay

leaw $308, %A ;A=564
andw %A, %D, %D ;and entre %A(308) e %D (or) e salva depois em %D dnv
leaw $21184, %A 
movw %D, (%A) ;salvo o que ta em D em A

;#########################################################################
;vamo fazer o !SW7 agr

leaw $21185, %A ; A aponta pra SW
movw (%A), %D  ; D=SW
notw %D ; D=!SW

;precisamos fazer o and e or para ter o resultado:
;SW8  !SW7   0   1   1   0   1   0   0
leaw $128, %A ;A=128 -->so o bit do sw7
andw %A, %D, %D ;0 !SW7 0 0 0 0 0 0 0
leaw $21184, %A ; A aponta pra led com sw8 e 1s
orw (%A), %D, %D ; orw RAM[LED], %D, (%A)
movw %D, (%A) ;copio o que ta em D pra LED (%A)

; 0  !SW7  0   0   0   0   0   0   0
;                                   OR
;SW8   0   0   1   1   0   1   0   0
;=====================================
;SW8 !SW7  0   1   1   0   1   0   0


;############################################################
;vamos fazer o SW0 

leaw $21185, %A ; A aponta pra SW
movw (%A), %D  ; D=SW

;precisamos fazer uma mascara binaria
; 1) AND - zero tudo e so deixo o SW0
; 2) ADD - somo o resultado do and com 1. O carry vai representar o SW0 no bit 1
; 3) AND - faco and com o resultado do ADD e 2 em binario para zerar o bit 1, vai resultar em 0 0 0 0 0 0 0 SW0 0
; 4) OR - com o resultado do passo 4 eu faco or com o que ta guardado no led. Vai resultar em ;SW8 !SW7  0   1   1   0   1   SW0   0
leaw $1, %A ;A=1 -->so o bit do sw0
andw %A, %D, %D ;0 0 0 0 0 0 0 0 sw0 
addw %A, %D, %D ;somar 0 0 0 1 + 0 0 0 SW0
leaw $2, %A ;a carrega 2 -->bit 10
andw %A, %D, %D 
leaw $21184, %A 
orw (%A), %D, %D 
movw %D, (%A)


;##################################################################
;vamos fazer o RAM[5][3]
leaw $5, %A ; A aponta pra RAM[5]
movw (%A), %D  ; D=RAM[5]

leaw $8, %A ;A=8 -->so o bit 3
andw %A, %D, %D ;0 0 0 0 RAM[5][3] 0 0 0 0
leaw $21184, %A ; A aponta pra led com sw8, !SW7, 1s e sw0
orw (%A), %D, %D ; orw RAM[LED], %D, (%A)
movw %D, (%A) ;copio o que ta em D pra LED (%A)