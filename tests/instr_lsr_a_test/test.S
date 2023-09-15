.macro stop
.byte 0xff
.endm

; Siftovanje u desno za akumulator, ne treba da doce do promene PSWa

.global _start
_start:
lda #$02
lsr
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

