.macro stop
.byte 0xff
.endm

; Siftovanje u desno gde u akumulatoru treba da se upise nula
; PSW mora da se promeni na 0x07 posto se pali zero bit i carry bit

.global _start
_start:
lda #$01
lsr
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

