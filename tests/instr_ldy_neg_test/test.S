.macro stop
.byte 0xff
.endm

; Test za LDY instrukciju u slucaju kada se ucitava
; broj koji je manji od 0
; Ocekuje se:
; PSWN = 1, PSWZ = 0;

.global _start
_start:
ldy #$00
ldy #$ff
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

