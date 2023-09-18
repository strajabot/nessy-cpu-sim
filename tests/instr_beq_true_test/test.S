.macro stop
.byte 0xff
.endm

; Test BEQ (Branch EQual) instrukcije
; Treba da skoci ako je PSWZ = 1
; Testira kad je PSWZ = 1

.global _start
_start:
lda #$00
beq branch
stop
branch:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

