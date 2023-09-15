.macro stop
.byte 0xff
.endm

; Dekrementiranje adrese sa paljenjem zero bita u PSW

.global _start
_start:
lda #$01
sta $00
dec $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

