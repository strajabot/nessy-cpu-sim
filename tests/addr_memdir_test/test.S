.macro stop
.byte 0xff
.endm

; Provera memdir adresiranja, prvo immed loaduje 0x71 u akumulator
; nakon cega radi memdir store. 
; U adresnoj fazi sta upisuje 0x71 u lokaciju 0x0333.

.global _start
_start:
lda #$71
sta $0333
stop

.global nmi
nmi:
stop

.global irq
irq:
stop
