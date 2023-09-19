.macro stop
.byte 0xff
.endm

; Treba da se oduzme 0x01 iz akumulatora sa 0x01, time se pali zero bit

.global _start
_start:
lda #$01
sec
sbc #$01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

