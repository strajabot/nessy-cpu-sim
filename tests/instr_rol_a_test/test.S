.macro stop
.byte 0xff
.endm

; Siftovanje akumulatora za jedan bit u levo bez promene PSWa

.global _start
_start:
lda #$01
rol
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

