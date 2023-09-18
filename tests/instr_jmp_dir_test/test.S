.macro stop
.byte 0xff
.endm

; Test za instrukciju JMP u slucaju kada 
; se izvrsava direktan skok. Ocekuje se
; da skoci na jmp_here

.global _start
_start:
jmp $8003
stop
jmp_here:
stop

.global nmi
nmi:
stop

.global irq
irq:
stop

