.macro stop
.byte 0xff
.endm

; Test za LDA instrukciju u slucaju kada se ucitava
; broj koji je manji od 0
; Ocekuje se:
; PSWN = 1, PSWZ = 0;

.global _start
_start:
lda #$00
lda #$ff
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

