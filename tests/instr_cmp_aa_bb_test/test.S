.macro stop
.byte 0xff
.endm

; Test CMP instrukcije u slucaju 0xaa cmp 0xbb.
; Ocekuje se:
; PSWN = 1, PSWZ = 0, PSWC = 1
; TESTIRA N, C i Z BITOVE

.global _start
_start:
lda #$aa
ldy #$00
sec
cmp #$bb
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

