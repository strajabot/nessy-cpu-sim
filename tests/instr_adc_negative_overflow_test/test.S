.macro stop
.byte 0xff
.endm

; Treba da se sabere 0x70 sa 0x01 i doci ce do paljenja overflow bita a zajedno sa time i negativnog bita

.global _start
_start:
lda #$70
adc #$10
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

