.macro stop
.byte 0xff
.endm

; Test instrukcije DEY u slucaju
; kada je Y = 0x01
; Ocekuje se:
; PSWN = 0, PSWZ = 0

.global _start
_start:
ldy #$01
dey
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

