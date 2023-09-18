.macro stop
.byte 0xff
.endm

; 
.global _start
_start:
lda #$ba
php
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

