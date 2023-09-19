.macro stop
.byte 0xff
.endm

; Test instrukcije INC u slucaju
; kada je vrednost 0x7F
; Ocekuje se:
; PSWN = 1 PSWZ = 0

.global _start
_start:
ldx #$7f
inc $01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

