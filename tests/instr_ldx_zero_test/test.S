.macro stop
.byte 0xff
.endm

; Test za LDX instrukciju u slucaju kada se ucitava
; broj 0
; Ocekuje se:
; PSWN = 0, PSWZ = 1;

.global _start
_start:
ldx #$ff
ldx #$00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

