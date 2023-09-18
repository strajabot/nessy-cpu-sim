.macro stop
.byte 0xff
.endm

; Test BVS (Branch oVerflow Set) instrukcije
; Treba da skoci ako je PSWV = 1
; Testira kad je PSWV = 0

.global _start
_start:
lda #$00
adc #$00
bvs branch
stop
branch:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

