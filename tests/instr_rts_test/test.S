.macro stop
.byte 0xff
.endm

; Test za instrukciju RTS.
; Ocekuje se da se vrati na rts_here

.global _start
_start:
rts
stop
rts_here:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

