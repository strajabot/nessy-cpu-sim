.macro stop
.byte 0xff
.endm

; Treba da se oduzme 0x02 iz akumulatora sa 0x01, bez promene PSWa

.global _start
_start:
lda #$04
sec
sbc #$01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

