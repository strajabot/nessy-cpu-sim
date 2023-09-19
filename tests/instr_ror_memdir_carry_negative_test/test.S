.macro stop
.byte 0xff
.endm

; Siftovanje u desno za memoriju gde rezultat reba da bude 0x80
; Treba u PSW da se upise carry bit i negativni bit

.global _start
_start:
lda #$01
sta $00
ror $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

