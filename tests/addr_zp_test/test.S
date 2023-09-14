.macro stop
.byte 0xff
.endm

; Provera zeropage adresiranja, prvo immed loaduje 0x71 u akumulator
; nakon cega radi zeropage sta
; U adresnoj fazi sta upisuje 0x71 na lokaciju 23.

.global _start
_start:
lda #$71
sta $23
stop

.global nmi
nmi:
stop

.global irq
irq:
stop
