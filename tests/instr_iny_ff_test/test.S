.macro stop
.byte 0xff
.endm

; Test instrukcije INY u slucaju
; kada je Y = 0xFF
; Ocekuje se:
; PSWN = 0, PSWZ = 1

.global _start
_start:
ldy #$ff
iny
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

