.macro stop
.byte 0xff
.endm

; Test CPY instrukcije u slucaju 0xbb cmp 0xaa.
; Ocekuje se:
; PSWN = 0, PSWZ = 0, PSWC = 1
; TESTIRA C i Z BITOVE

.global _start
_start:
ldy #$bb
lda #$00
cpy #$aa
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

