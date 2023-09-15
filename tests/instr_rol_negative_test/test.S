.macro stop
.byte 0xff
.endm

; Siftovanje u levo za akumulator
; Doci ce do promene PSWa paljenjem negativnog bita

.global _start
_start:
lda #$70
rol
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

