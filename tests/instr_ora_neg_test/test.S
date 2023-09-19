.macro stop
.byte 0xff
.endm

; Test ORA instrukcije u slucaju 
; kada je rezultat manji od 0
; Ocekuje se:
; PSWN = 1, PSWZ = 0

.global _start
_start:
lda #$00
ora #$80
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

