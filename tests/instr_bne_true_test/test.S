.macro stop
.byte 0xff
.endm

; Test BNE (Branch Not Equal) instrukcije
; Treba da skoci ako je PSWZ = 0
; Testira kad je PSWZ = 0

.global _start
_start:
lda #$77
bne branch
stop
branch:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

