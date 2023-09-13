.global _start
_start:
lda #$71
ror
brk

nmi:
brk

irq:
brk

