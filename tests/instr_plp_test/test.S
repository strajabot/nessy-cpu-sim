.macro stop
.byte 0xff
.endm

; Test instrukcja PLP

.global _start
_start:
plp
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

