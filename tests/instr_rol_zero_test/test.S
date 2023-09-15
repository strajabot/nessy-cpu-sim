.macro stop
.byte 0xff
.endm

; Treba samo u PSW da bude upaljen zero bit

.global _start
_start:
lda #$00
rol
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

