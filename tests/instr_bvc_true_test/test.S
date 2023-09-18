.macro stop
.byte 0xff
.endm

; Test BVC (Branch oVerflow Clear) instrukcije
; Treba da skoci ako je PSWV = 0
; Testira kad je PSWV = 0

.global _start
_start:
lda #$00
adc #$00
bvc branch
stop
branch:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

