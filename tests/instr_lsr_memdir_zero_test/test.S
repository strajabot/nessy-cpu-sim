.macro stop
.byte 0xff
.endm

; Siftovanje u desno gde se u memoriji nalazi nula
; Treba da doce do promene PSWa gde se aktivira zero bit

.global _start
_start:
lda #$00
sta $00
lsr $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

