.macro stop
.byte 0xff
.endm

; Test instrukcije DEX u slucaju
; kada je X = 0x01
; Ocekuje se:
; PSWN = 0, PSWZ = 0

.global _start
_start:
ldx #$01
dex
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

