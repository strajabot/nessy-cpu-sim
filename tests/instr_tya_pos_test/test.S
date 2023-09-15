.macro stop
.byte 0xff
.endm

; Test za TYA instrukciju u slucaju kada se 
; prebacuje broj veci od 0
; Ocekuje se:
; PSWN = 0, PSWZ = 0

.global _start
_start:
ldy #$07
ldx #$89
tya
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

