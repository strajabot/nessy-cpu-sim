.macro stop
.byte 0xff
.endm

; Test instrukcja PLA u slucaju
; kada skida broj 0
; Ocekuje se:
; PSWN = 0, PSWZ = 1

.global _start
_start:
pla
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

