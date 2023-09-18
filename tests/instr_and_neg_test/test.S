.macro stop
.byte 0xff
.endm

; Test AND instrukcije u slucaju 
; kada je rezultat manji od 0
; Ocekuje se:
; PSWN = 1, PSWZ = 0

.global _start
_start:
lda #$80
ldx #$00
and #$80
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

