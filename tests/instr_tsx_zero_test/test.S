.macro stop
.byte 0xff
.endm

; Test za TSX instrukciju u slucaju kada se 
; prebacuje broj 0
; Ocekuje se:
; PSWN = 0, PSWZ = 1

.global _start
_start:
; SP je $fd hardverski u pocetku
ldx #$ee
pla
pla
pla
lda #$ff
tsx
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

