.macro stop
.byte 0xff
.endm

; Siftovanje u desno gde se u akumulator nalazi nula
; Treba da doce do promene PSWa gde se aktivira zero bit

.global _start
_start:
lda #$00
lsr
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

