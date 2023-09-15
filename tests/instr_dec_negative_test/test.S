.macro stop
.byte 0xff
.endm

; Dekrementiranje adrese za koje se pali negativan PSW bit

.global _start
_start:
lda #$00
sta $00
dec $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

