.macro stop
.byte 0xff
.endm

; Provera acc adresiranja, prvo immed loaduje 0x71 u akumulator
; nakon cega radi acc ror
; U adresnoj fazi ror upisuje 0x71 u MDR registar iz ACC.

.global _start
_start:
lda #$71
ror
stop

.global nmi
nmi:
stop

.global irq
irq:
stop
