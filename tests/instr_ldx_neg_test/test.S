.macro stop
.byte 0xff
.endm

; Test za LDX instrukciju u slucaju kada se ucitava
; broj koji je manji od 0
; Ocekuje se:
; PSWN = 1, PSWZ = 0;

.global _start
_start:
ldx #$00
ldx #$ff
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

