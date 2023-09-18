.macro stop
.byte 0xff
.endm

; Test za instrukciju STA
; Treba da upise podatak iza ACC u MEM

.global _start
_start:
lda #$aa
sta $1000
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

