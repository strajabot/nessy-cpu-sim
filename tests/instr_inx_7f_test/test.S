.macro stop
.byte 0xff
.endm

; Test instrukcije INX u slucaju
; kada je X = 0x7F
; Ocekuje se:
; PSWN = 1 PSWZ = 0

.global _start
_start:
ldx #$7f
inx
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

