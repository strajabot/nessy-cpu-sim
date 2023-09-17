.macro stop
.byte 0xff
.endm

; Test za LDY instrukciju u slucaju kada se ucitava
; broj 0
; Ocekuje se:
; PSWN = 0, PSWZ = 1;

.global _start
_start:
ldy #$ff
ldy #$00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

