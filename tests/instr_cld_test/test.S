.macro stop
.byte 0xff
.endm

; Treba da clearuje PSWD bit

.global _start
_start:
sed
cld
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

