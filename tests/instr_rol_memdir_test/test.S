.macro stop
.byte 0xff
.endm

; Siftovanje memorije za jedan bit u levo bez promene PSWa

.global _start
_start:
lda #$01
sta $00
rol $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

