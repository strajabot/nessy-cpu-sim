.macro stop
.byte 0xff
.endm

; Test za TXS instrukciju u slucaju kada se 
; prebacuje broj veci od 0
; Ocekuje se:
; PSWN = 0, PSWZ = 0

.global _start
_start:
ldx #$07
ldy #$89
txS
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

