.macro stop
.byte 0xff
.endm

; Test AND instrukcije u slucaju 
; kada je rezultat veci od 0
; Ocekuje se:
; PSWN = 0, PSWZ = 0
; Proverava PSWN

.global _start
_start:
lda #$81
and #$01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

