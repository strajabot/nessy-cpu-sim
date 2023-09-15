.macro stop
.byte 0xff
.endm

; Test za TAY instrukciju u slucaju kada se 
; prebacuje broj veci od 0
; Ocekuje se:
; PSWN = 0, PSWZ = 0

.global _start
_start:
lda #$07
ldx #$89
tay
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

