.macro stop
.byte 0xff
.endm

; Test instrukcja PLA u slucaju
; kada skida broj manji od 0
; Ocekuje se:
; PSWN = 1, PSWZ = 0

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

