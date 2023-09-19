.macro stop
.byte 0xff
.endm

; Test CMP instrukcije u slucaju 0xa9 cmp 0xaa.
; Ocekuje se:
; PSWN = 1, PSWZ = 0, PSWC = 0
; TESTIRA N, C i Z BITOVE

.global _start
_start:
lda #$a9
ldy #$00
sec
cmp #$aa
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

