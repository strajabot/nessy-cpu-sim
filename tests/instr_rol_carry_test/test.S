.macro stop
.byte 0xff
.endm

; Siftovanje u levo za akumulator gde rezultat reba da bude 0x01
; Treba u PSW da se upise samo carry bit

.global _start
_start:
lda #$80
rol
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

