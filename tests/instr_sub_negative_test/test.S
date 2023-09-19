.macro stop
.byte 0xff
.endm

; Treba da se oduzme 0x00 iz akumulatora sa 0x01, gde se menja negativ bit i carry bit

.global _start
_start:
lda #$00
sec
sbc #$01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

