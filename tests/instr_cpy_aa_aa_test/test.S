.macro stop
.byte 0xff
.endm

; Test CPY instrukcije u slucaju 0xaa CMP 0xaa
; Ocekuje se:
; PSWN=0, PSWZ= 1, PSWC = 1 
; TESTIRA N, Z i C BITOVE

.global _start
_start:
clc
ldy #$aa
cpy #$aa 
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

