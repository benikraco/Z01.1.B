; Arquivo: LCDnomeGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD o nome do grupo

;4x9
;palavra BOLA

;letra B

;linha 1 - tipo A
leaw $16384, %A
movw -1, (%A)
incw %A 
movw -1, (%A)
incw %A 
movw -1, (%A)

;linha 2 - tipo B
;16384 + 20 = 16404

leaw $16404, %A 
movw -1, (%A)
incw %A 
incw %A 
incw %A 
movw -1, (%A)

;linha 3 - tipo B
;16404 + 20 = 16424

leaw $16424, %A 
movw -1, (%A)
incw %A 
incw %A 
incw %A 
movw -1, (%A)

;linha 4 - tipo B
;16424 + 20 = 16444

leaw $16444, %A 
movw -1, (%A)
incw %A 
incw %A 
incw %A 
movw -1, (%A)

;linha 5 - tipo A
;16444 + 20 = 16464
leaw $16464, %A
movw -1, (%A)
incw %A 
movw -1, (%A)
incw %A 
movw -1, (%A)

;linha 6 - tipo B
;16464 + 20 = 16484

leaw $16484, %A 
movw -1, (%A)
incw %A 
incw %A 
incw %A 
movw -1, (%A)

;linha 7 - tipo B
;16484 + 20 = 16504

leaw $16504, %A 
movw -1, (%A)
incw %A 
incw %A 
incw %A
movw -1, (%A)

;linha 8 - tipo B
;16504 + 20 = 16524

leaw $16524, %A 
movw -1, (%A)
incw %A 
incw %A 
incw %A
movw -1, (%A)


;linha 9 - tipo A
;16524 + 20 = 16544
leaw $16544, %A
movw -1, (%A)
incw %A 
movw -1, (%A)
incw %A 
movw -1, (%A)

;letra o
;16384 + 5 + 4x20 -> (100) = 16489
;comeca em 16466

;linha 1 - tipo C
leaw $16489, %A 
movw $-1, (%A)
incw %A 
movw -1, (%A)
incw %A 
movw -1, (%A)
incw %A 
movw -1, (%A)

;linha 2 - tipo D
;16489 + 20 = 16509
leaw $16509, %A 
movw $-1, (%A)
incw %A 
incw %A 
incw %A 
movw -1, (%A)

;linha 3 - tipo D
;16509 + 20 = 16529
leaw $16529, %A 
movw $-1, (%A)
incw %A 
incw %A 
incw %A 
movw -1, (%A)

;linha 4 - tipo D
;16529 + 20 = 16549
leaw $16549, %A 
movw $-1, (%A)
incw %A 
incw %A 
incw %A 
movw -1, (%A)

;linha 5 - tipo C
;16549 + 20 = 16569
leaw $16569, %A 
movw $-1, (%A)
incw %A 
movw -1, (%A)
incw %A 
movw -1, (%A)
incw %A 
movw -1, (%A)

;letra L

;linha 1 - tipo E
;comeca no 16384 + 10 = 16394
leaw $16394, %A 
movw $-1, (%A)

;linha 2 - tipo E
;16394 + 20 = 16414
leaw $16414, %A 
movw $-1, (%A)

;linha 3 - tipo E
;16394 + 20 = 16414
leaw $16414, %A 
movw $-1, (%A)

;linha 4
;16414 + 20 = 16434
leaw $16434, %A 
movw $-1, (%A)

;linha 5 - tipo E
;16434 + 20 = 16454
leaw $16454, %A 
movw $-1, (%A)

;linha 6 - tipo E
;16454 + 20 = 16474
leaw $16474, %A 
movw $-1, (%A)

;linha 7 - tipo E
;16474 + 20 = 16494
leaw $16494, %A 
movw $-1, (%A)

;linha 8 - tipo E
;16494 + 20 = 16514
leaw $16514, %A 
movw $-1, (%A)

;linha 9 - tipo F
;16514 + 20 = 16534
leaw $16534, %A 
movw $-1, (%A)
incw %A 
movw $-1, (%A)
incw %A 
movw $-1, (%A)

;letra A
;comeca em 16384 + 3x20 = 16458

;linha 1 - tipo G
leaw $16458, %A 
movw $-1, (%A)
incw %A 
movw $-1, (%A)
incw %A 
movw $-1, (%A)
incw %A 
movw $-1, (%A)

;linha 2 - tipo H
;16458 + 3 + 20 = 16481
leaw $16481, %A
movw $-1, (%A)

;linha 3 - tipo G
;16481 - 3 + 20 = 16478 + 20 = 16498
leaw $16498, %A
movw $-1, (%A)
incw %A 
movw $-1, (%A)
incw %A 
movw $-1, (%A)
incw %A 
movw $-1, (%A)

;linha 4 - tipo I
;16498 + 20 = 16518
leaw $16518, %A
movw $-1, (%A)
incw %A 
incw %A 
incw %A 
movw $-1, (%A)

;linha 5 - tipo I
;16518 + 20 = 16538
leaw $16538, %A
movw $-1, (%A)
incw %A 
incw %A 
incw %A 
movw $-1, (%A)

;linha 6 - tipo G
;16538 + 20 = 16558
leaw $16558, %A
movw $-1, (%A)
incw %A 
movw $-1, (%A)
incw %A 
movw $-1, (%A)
incw %A 
movw $-1, (%A)