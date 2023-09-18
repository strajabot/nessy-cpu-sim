.macro stop
.byte 0xff
.endm

; Test instrukcije INY u slucaju
; kada je Y = 0x7F
; Ocekuje se:
; PSWN = 1 PSWZ = 0

.global _start
_start:
ldy #$7f
iny
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

