.macro stop
.byte 0xff
.endm

; Treba da clearuje PSWC bit

.global _start
_start:
sec
clc
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

