.macro stop
.byte 0xff
.endm

; Test CPX instrukcije u slucaju 0xa9 cmp 0xaa.
; Ocekuje se:
; PSWN = 1, PSWZ = 0, PSWC = 0
; TESTIRA N, C i Z BITOVE

.global _start
_start:
ldx #$a9
lda #$00
sec
cpx #$aa
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

