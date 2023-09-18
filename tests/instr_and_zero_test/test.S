.macro stop
.byte 0xff
.endm

; Test AND instrukcije u slucaju 
; kada je rezultat 0
; Ocekuje se:
; PSWN = 0, PSWZ = 1

.global _start
_start:
lda #$80
and #$00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

