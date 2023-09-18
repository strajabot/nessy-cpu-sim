.macro stop
.byte 0xff
.endm

; Test instrukcije DEY u slucaju
; kada je Y = 00;
; Ocekuje se:
; PSWN = 1, PSWZ = 0

.global _start
_start:
ldy #$00
dey
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

