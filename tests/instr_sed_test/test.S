.macro stop
.byte 0xff
.endm

; Treba da setuje PSWD bit

.global _start
_start:
cld
sed
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

