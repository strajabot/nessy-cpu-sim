.macro stop
.byte 0xff
.endm

; Test instrukcije INX u slucaju
; kada je X = 0x00
; Ocekuje se:
; PSWN = 0, PSWZ = 0

.global _start
_start:
ldx #$00
inx
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

