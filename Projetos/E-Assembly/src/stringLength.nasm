; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000


leaw $0, %A
movw $0, (%A) ;RAM[0]=0 --> meu contador
 
leaw $8, %A 
movw %A, %D ;D=8
leaw $1, %A 
movw %D, (%A) ;RAM[1]=8

 

WHILE:
 leaw $1, %A ;RAM[1]
 movw (%A), %A
 movw (%A), %D

 

 leaw $END, %A ;se saltar vou para final do loop
 je %D ;se o que ta em RAM[RAM[1]]=0 eu vou pro final 
 nop
 
;se o que ta na RAM[RAM[1]] for diferente de 0 venho pra ca
;preciso add 1 no meu contador RAM[0]
;preciso add 1 na RAM[1] 
;volto pro inicio do loop depois disso
 
 leaw $0, %A 
 movw (%A), %D ;D=RAM[0]
 incw %D ; D=D+1
 movw %D, (%A)
 
 leaw $1, %A 
 movw (%A), %D ;D=RAM[1]
 incw %D ; D=D+1
 movw %D, (%A)
 
 leaw $WHILE, %A 
 jmp
 nop
 
END: