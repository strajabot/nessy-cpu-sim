.macro stop
.byte 0xff
.endm

; Test CPX instrukcije u slucaju 0xaa CMP 0xaa
; Ocekuje se:
; PSWN=0, PSWZ= 1, PSWC = 1 
; TESTIRA N, Z i C BITOVE

.global _start
_start:
clc
ldx #$aa
cpx #$aa 
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

