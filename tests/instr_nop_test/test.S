.macro stop
.byte 0xff
.endm

; Treba da poveca PC i ne ubije procesor.
; Juniore, NOP ne treba da poveca akumulator 

.global _start
_start:
nop
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

