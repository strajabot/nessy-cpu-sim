.macro stop
.byte 0xff
.endm

; Test za TXA instrukciju u slucaju kada se 
; prebacuje broj manji od 0
; Ocekuje se:
; PSWN = 1, PSWZ = 0

.global _start
_start:
ldx #$89
ldy #$00
txa
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

