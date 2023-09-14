.macro stop
.byte 0xff
.endm

; Provera immed adresiranja, treba da u addr fazi loaduje
; 0xef u MDR registar iz IRDATA.

.global _start
_start:
ldx #$ef
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

