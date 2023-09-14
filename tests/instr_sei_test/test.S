.macro stop
.byte 0xff
.endm

; Treba da setuje PSWI bit

.global _start
_start:
cli
sei
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

