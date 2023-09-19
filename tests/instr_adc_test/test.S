.macro stop
.byte 0xff
.endm

; Treba da sabere 0x02 iz akumulatora sa 0x01, bez promene PSWa

.global _start
_start:
lda #$02
adc #$01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

