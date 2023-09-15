.macro stop
.byte 0xff
.endm

; Test CPX instrukcije u slucaju 0xaa cmp 0xbb.
; Ocekuje se:
; PSWN = 0, PSWZ = 0, PSWC = 0
; TESTIRA N i Z BITOVE

.global _start
_start:
ldx #$07
lda #$ff
sec
cpx #$b7
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

