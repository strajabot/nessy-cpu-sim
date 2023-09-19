.macro stop
.byte 0xff
.endm

; Test CMP instrukcije u slucaju 0xaa cmp 0xbb.
; Ocekuje se:
; PSWN = 0, PSWZ = 0, PSWC = 0
; TESTIRA C i Z BITOVE

.global _start
_start:
lda #$07
ldy #$00
sec
cmp #$b7
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

