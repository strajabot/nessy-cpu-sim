.macro stop
.byte 0xff
.endm

; Test BPL (Branch PLus) instrukcije
; Treba da skoci ako je PSWN = 0
; Testira kad je PSWN = 1

.global _start
_start:
lda #$ff
bpl branch
stop
branch:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

