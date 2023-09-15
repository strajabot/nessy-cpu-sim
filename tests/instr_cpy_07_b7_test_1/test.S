.macro stop
.byte 0xff
.endm

; Test CPY instrukcije u slucaju 0xaa cmp 0xbb.
; Ocekuje se:
; PSWN = 0, PSWZ = 0, PSWC = 0
; TESTIRA N i Z BITOVE

.global _start
_start:
ldy #$07
lda #$ff
sec
cpy #$b7
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

