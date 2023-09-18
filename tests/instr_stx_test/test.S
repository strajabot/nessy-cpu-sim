.macro stop
.byte 0xff
.endm

; Test za instrukciju STX
; Treba da upise podatak iza X u MEM

.global _start
_start:
ldx #$aa
stx $1000
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

