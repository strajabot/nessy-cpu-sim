.macro stop
.byte 0xff
.endm

; Siftovanje u levo memoriju
; Treba da doce do promene PSWa gde se aktivira negativan bit

.global _start
_start:
lda #$70
sta $00
asl $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

