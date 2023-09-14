.macro stop
.byte 0xff
.endm

; Provera X indexed adresiranja, 
; Prvo immed loaduje 0xCD u X
; Nakon cega radi X indexed lda sa pomerajem 0xFFAB
; U adresnoj fazi lda cita 0xbd sa lokacije 0x0078.

.global _start
_start:
ldx #$CD
lda $FFAB,x
stop

.global nmi
nmi:
stop

.global irq
irq:
stop
