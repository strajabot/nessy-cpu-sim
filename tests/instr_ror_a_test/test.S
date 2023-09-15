.macro stop
.byte 0xff
.endm

; Siftovanje akumulatora za jedan bit u desno bez promene PSWa

.global _start
_start:
lda #$02
ror
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

