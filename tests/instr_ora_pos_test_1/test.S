.macro stop
.byte 0xff
.endm

; Test ORA instrukcije u slucaju
; kada je rezultat veci od 0
; Ocekuje se:
; PSWN = 0, PSWZ = 0
; Proverava PSWZ

.global _start
_start:
lda #$00
ora #$01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

