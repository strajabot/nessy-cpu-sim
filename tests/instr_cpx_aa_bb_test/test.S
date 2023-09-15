.macro stop
.byte 0xff
.endm

; Test CPX instrukcije u slucaju 0xaa cmp 0xbb.
; Ocekuje se:
; PSWN = 1, PSWZ = 0, PSWC = 1
; TESTIRA N, C i Z BITOVE

.global _start
_start:
ldx #$aa
lda #$00
sec
cpx #$bb
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

