.macro stop
.byte 0xff
.endm

; Test CPY instrukcije u slucaju 0xbb cmp 0xaa.
; Ocekuje se:
; PSWN = 0, PSWZ = 0, PSWC = 1
; TESTIRA N i C BITOVE

.global _start
_start:
ldy #$bb
lda #$ff
cpy #$aa
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

