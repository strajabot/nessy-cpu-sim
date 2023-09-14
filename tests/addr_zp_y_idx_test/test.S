.macro stop
.byte 0xff
.endm

; Provera zeropage Y indexed adresiranja, 
; Prvo immed loaduje 0xCD u Y
; Nakon cega radi zeropage Y indexed ldx sa pomerajem 0xAB
; U adresnoj fazi ldx cita 0xbd sa lokacije 0x78.

.global _start
_start:
ldy #$CD
ldx $AB,y
stop

.global nmi
nmi:
stop

.global irq
irq:
stop
