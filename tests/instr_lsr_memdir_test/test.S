.macro stop
.byte 0xff
.endm

; Siftovanje u desno za memoriju, ne treba da doce do promene PSWa

.global _start
_start:
lda #$02
sta $00
lsr $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

