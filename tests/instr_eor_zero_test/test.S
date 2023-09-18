.macro stop
.byte 0xff
.endm

; Test EOR (Exclusive OR) instrukcije 
; u slucaju kada je rezultat 0
; Ocekuje se:
; PSWN = 0, PSWZ = 1

.global _start
_start:
lda #$80
eor #$80
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

