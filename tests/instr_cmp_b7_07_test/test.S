.macro stop
.byte 0xff
.endm

; Test CMP instrukcije u slucaju 0xb7 cmp 0x07.
; Ocekuje se:
; PSWN = 1, PSWZ = 0, PSWC = 1
; TESTIRA N, C i Z BITOVE

.global _start
_start:
lda #$b7
ldy #$00
cmp #$07
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

