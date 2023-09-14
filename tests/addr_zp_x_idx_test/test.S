.macro stop
.byte 0xff
.endm

; Provera zeropage x indexed adresiranja, 
; Prvo immed loaduje 0xCD u X
; Nakon cega radi zeropage x indexed lda sa pomerajem 0xAB
; U adresnoj fazi lda cita 0xbd sa lokacije 0x78.

.global _start
_start:
ldx #$CD
lda $AB,x
stop

.global nmi
nmi:
stop

.global irq
irq:
stop
