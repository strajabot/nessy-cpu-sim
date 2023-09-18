.macro stop
.byte 0xff
.endm

; Test instrukcije INY u slucaju
; kada je Y = 0x00
; Ocekuje se:
; PSWN = 0, PSWZ = 0

.global _start
_start:
ldy #$00
iny
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

