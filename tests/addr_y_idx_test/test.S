.macro stop
.byte 0xff
.endm

; Provera Y indexed adresiranja, 
; Prvo immed loaduje 0xCD u Y
; Nakon cega radi Y indexed lda sa pomerajem 0xFFAB
; U adresnoj fazi lda cita 0xbd sa lokacije 0x78.

.global _start
_start:
ldy #$CD
lda $FFAB,y
stop

.global nmi
nmi:
stop

.global irq
irq:
stop
