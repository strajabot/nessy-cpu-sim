.macro stop
.byte 0xff
.endm

; Treba da clearuje PSWI bit

.global _start
_start:
sei
cli
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

