.macro stop
.byte 0xff
.endm

; Test EOR (Exclusive OR) instrukcije 
; u slucaju kada je rezultat veci od 0
; Ocekuje se:
; PSWN = 0, PSWZ = 0
; Proverava PSWN

.global _start
_start:
lda #$80
eor #$81
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

