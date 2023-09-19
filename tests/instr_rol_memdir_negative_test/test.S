.macro stop
.byte 0xff
.endm

; Siftovanje u levo za memoriju
; Doci ce do promene PSWa paljenjem negativnog bita

.global _start
_start:
lda #$70
sta $00
rol $00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

