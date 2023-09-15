.macro stop
.byte 0xff
.endm

; Siftovanje u levo za adresu, ne treba da doce do promene PSWa

.global _start
_start:
lda #$01
sta $00
asl $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

