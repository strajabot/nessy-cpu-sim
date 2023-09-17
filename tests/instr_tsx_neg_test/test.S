.macro stop
.byte 0xff
.endm

; Test za TSX instrukciju u slucaju kada se 
; prebacuje broj manji od 0
; Ocekuje se:
; PSWN = 1, PSWZ = 0

.global _start
_start:
; SP je $fd hardverski u pocetku
ldy #$00
tsx
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

