.macro stop
.byte 0xff
.endm

; Treba da sabere 0xff sa 0x01 time se dobije 0x00 i paljenje zero bita

.global _start
_start:
lda #$ff
adc #$01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

