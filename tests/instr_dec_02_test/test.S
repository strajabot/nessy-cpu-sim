.macro stop
.byte 0xff
.endm

; Dekrementiranje adrese bez promene PSWa

.global _start
_start:
lda #$02
sta $00
dec $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

