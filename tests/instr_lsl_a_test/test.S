.macro stop
.byte 0xff
.endm

; Siftovanje u levo za akumulator, ne treba da doce do promene PSWa

.global _start
_start:
lda #$01
asl
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

