.macro stop
.byte 0xff
.endm

; Test BMI (Branch MInus) instrukcije
; Treba da skoci ako je PSWN = 1
; Testira kad je PSWN = 0

.global _start
_start:
lda #$77
bmi branch
stop
branch:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

