.macro stop
.byte 0xff
.endm

; Test za instrukciju JSR
; Treba da na steku sacuva PC, i udje u potprogram


.global _start
_start:
jsr subfunc

.global nmi
nmi:
stop

subfunc:
stop

.global irq
irq:
stop

