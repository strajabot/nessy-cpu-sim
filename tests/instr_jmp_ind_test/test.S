.macro stop
.byte 0xff
.endm

; Test za instrukciju JMP u slucaju kada 
; se izvrsava indirektan skok. Ocekuje se
; da skoci na jmp_here

.global _start
_start:
jmp ($1000)
stop
jmp_here:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

