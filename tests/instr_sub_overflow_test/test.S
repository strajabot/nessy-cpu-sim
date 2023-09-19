.macro stop
.byte 0xff
.endm

; Treba da se oduzme 0x80 iz akumulatora sa 0x01, treba da se upali overflow bit

.global _start
_start:
lda #$80
sec
sbc #$01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

