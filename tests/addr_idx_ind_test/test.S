.macro stop
.byte 0xff
.endm

; Provera indexed indirect adresiranja, 
; Prvo immed loaduje 0xCD u X
; Nakon cega radi indexed indirect lda sa pomerajem 0xAB
; Adresna faza
; Nakon cega dovlaci nizi bajt 0x65 sa adrese 0x78
; Nakon cega dovlaci visi bajt 0x17 sa adrese 0x79
; Nakon cega ucitava u akumulator podatak 0x57 sa adrese 0x1765 

.global _start
_start:
ldx #$CD
lda ($AB,x)
stop

.global nmi
nmi:
stop

.global irq
irq:
stop
