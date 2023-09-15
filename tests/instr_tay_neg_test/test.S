.macro stop
.byte 0xff
.endm

; Test za TAY instrukciju u slucaju kada se 
; prebacuje broj manji od 0
; Ocekuje se:
; PSWN = 1, PSWZ = 0

.global _start
_start:
lda #$89
ldx #$00
tay
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

