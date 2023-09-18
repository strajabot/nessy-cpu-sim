.macro stop
.byte 0xff
.endm

; Test BCC (Branch Carry Clear) instrukcije
; Treba da skoci ako je PSWC = 0
; Testira kad je PSWC = 1

.global _start
_start:
sec
bcc branch
stop
branch:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

