.macro stop
.byte 0xff
.endm

; Test za instrukciju RTI.
; Ocekuje se da se vrati na rts_here
; i PSW = 0xCF

.global _start
_start:
rti
stop
rts_here:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

