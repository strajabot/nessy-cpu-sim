.macro stop
.byte 0xff
.endm

; Test za TXS instrukciju u slucaju kada se 
; prebacuje broj jednak 0
; Ocekuje se:
; PSWN = 0, PSWZ = 1

.global _start
_start:
ldx #$00
ldy #$89
txs
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

