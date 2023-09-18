.macro stop
.byte 0xff
.endm

; Test za instrukciju STY
; Treba da upise podatak iz Y u MEM

.global _start
_start:
ldy #$aa
sty $1000
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

