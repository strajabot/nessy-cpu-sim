.macro stop
.byte 0xff
.endm

; Siftovanje u levo gde se u akumulator nalazi 0x70
; Treba da doce do promene PSWa gde se aktivira negativan bit

.global _start
_start:
lda #$70
asl
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

