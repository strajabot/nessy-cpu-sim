.segment "TEXT"
reset:
ldx #$ff
brk;

nmi:
brk;	
irq:
brk;

.segment "VECTORS"
.word "nmi"
.word "reset"
.word "irq"

