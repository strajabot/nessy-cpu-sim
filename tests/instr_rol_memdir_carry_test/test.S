.macro stop
.byte 0xff
.endm

; Siftovanje u levo za memoriju gde rezultat treba da bude 0x01
; Treba u PSW da se upise samo carry bit

.global _start
_start:
lda #$80
sta $00
rol $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

