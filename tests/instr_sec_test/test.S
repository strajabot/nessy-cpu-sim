.macro stop
.byte 0xff
.endm

; Treba da setuje PSWC bit

.global _start
_start:
clc
sec
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

