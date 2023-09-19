.macro stop
.byte 0xff
.endm

; Test CMP instrukcije u slucaju 0xaa CMP 0xaa
; Ocekuje se:
; PSWN=0, PSWZ= 1, PSWC = 1 
; TESTIRA N, Z i C BITOVE

.global _start
_start:
clc
lda #$aa
cmp #$aa 
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

