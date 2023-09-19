.macro stop
.byte 0xff
.endm

; Siftovanje memorije za jedan bit u desno bez promene PSWa

.global _start
_start:
lda #$02
sta $00
ror $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

