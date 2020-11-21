leaw $0, %A
movw (%A), %D
leaw $FIM, %A 
je
nop
leaw $1, %A
movw (%A), %D
leaw $FIM, %A 
je
nop
LOOP:
leaw $0, %A
movw (%A), %D
leaw $3,%A 
addw %D, (%A), %D 
movw %D, (%A)
leaw $1, %A
movw (%A), %D
subw %D, %A , %D 
movw %D, (%A)
leaw $LOOP, %A 
jg
nop
FIM: