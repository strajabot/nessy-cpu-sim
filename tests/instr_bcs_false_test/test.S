.macro stop
.byte 0xff
.endm

; Test BCS (Branch Carry Set) instrukcije
; Treba da skoci ako je PSWC = 1
; Testira kad je PSWC = 0

.global _start
_start:
clc
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

