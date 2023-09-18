.macro stop
.byte 0xff
.endm

; Test BCS (Branch Carry Set) instrukcije
; Treba da skoci ako je PSWC = 1
; Testira kad je PSWC = 1

.global _start
_start:
sec
bcs branch
stop
branch:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

