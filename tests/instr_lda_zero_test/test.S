.macro stop
.byte 0xff
.endm

; Test za LDA instrukciju u slucaju kada se ucitava
; broj 0
; Ocekuje se:
; PSWN = 0, PSWZ = 1;

.global _start
_start:
lda #$ff
lda #$00
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

