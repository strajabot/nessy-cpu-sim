.macro stop
.byte 0xff
.endm

; Test za TAX instrukciju u slucaju kada se 
; prebacuje broj jednak 0
; Ocekuje se:
; PSWN = 0, PSWZ = 1

.global _start
_start:
lda #$00
ldy #$89
tax
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

