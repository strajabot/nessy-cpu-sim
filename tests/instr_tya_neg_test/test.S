.macro stop
.byte 0xff
.endm

; Test za TYA instrukciju u slucaju kada se 
; prebacuje broj manji od 0
; Ocekuje se:
; PSWN = 1, PSWZ = 0

.global _start
_start:
ldy #$89
ldx #$00
tya
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

