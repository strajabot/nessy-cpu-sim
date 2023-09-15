.macro stop
.byte 0xff
.endm

; Siftovanje u levo za adresu, treba da se promeni carry bit i zero bit

.global _start
_start:
lda #$80
sta $00
asl $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

