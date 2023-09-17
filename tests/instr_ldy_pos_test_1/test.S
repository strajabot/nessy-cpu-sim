.macro stop
.byte 0xff
.endm

; Test za LDY instrukciju u slucaju kada se ucitava
; broj koji je veci od 0
; Ocekuje se:
; PSWN = 0, PSWZ = 0;
; Testira Z bit

.global _start
_start:
ldy #$00
ldy #$01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

