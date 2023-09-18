.macro stop
.byte 0xff
.endm

; Test instrukcije DEX u slucaju
; kada je X = 00;
; Ocekuje se:
; PSWN = 1, PSWZ = 0

.global _start
_start:
ldx #$00
dex
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

