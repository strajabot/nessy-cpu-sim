.macro stop
.byte 0xff
.endm

; Test instrukcije DEY u slucaju
; kada je Y = 0x80
; Ocekuje se:
; PSWN = 0, PSWZ = 0

.global _start
_start:
ldy #$80
dey
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

