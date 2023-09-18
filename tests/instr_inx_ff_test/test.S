.macro stop
.byte 0xff
.endm

; Test instrukcije INX u slucaju
; kada je X = 0xFF
; Ocekuje se:
; PSWN = 0, PSWZ = 1

.global _start
_start:
ldx #$ff
inx
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

