.macro stop
.byte 0xff
.endm

; Test za LDA instrukciju u slucaju kada se ucitava
; broj koji je veci od 0
; Ocekuje se:
; PSWN = 0, PSWZ = 0;
; Testira N bit

.global _start
_start:
lda #$ff
lda #$01
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

