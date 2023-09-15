.macro stop
.byte 0xff
.endm

; Test za TAY instrukciju u slucaju kada se 
; prebacuje broj jednak 0
; Ocekuje se:
; PSWN = 0, PSWZ = 1

.global _start
_start:
lda #$00
ldx #$89
tay
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

