.macro stop
.byte 0xff
.endm

; Test instrukcije INC u slucaju
; kada je vrednost 0xFF
; Ocekuje se:
; PSWN = 0, PSWZ = 1

.global _start
_start:
ldx #$ff
inc $01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

