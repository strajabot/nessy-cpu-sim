.macro stop
.byte 0xff
.endm

; Test za instrukciju BRK
; na stek treba da stavi PC i PSW
; i nakon toga ucita adresu iz vektora


.global irq
irq:
stop

.global _start
_start:
nop
brk
stop

.global nmi
nmi:
stop


