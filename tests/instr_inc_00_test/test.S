.macro stop
.byte 0xff
.endm

; Test instrukcije INC u slucaju
; kada je vrednost 0x00
; Ocekuje se:
; PSWN = 0, PSWZ = 0

.global _start
_start:
ldx #$00
inc $01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

