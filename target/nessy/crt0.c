#define __NESSY__

// Set up the hardware stack and launch early initialization.
asm(".section .init.50,\"axR\",@progbits\n"
    "  sei\n"
    "  ldx #$ff\n"
    "  txs\n"
    "  jsr __early_init\n");

void __early_init(void) {
	*(char*)0x2000 = 0;

}

asm(".section .init.250,\"axR\",@progbits\n"
    "  jsr __late_init\n");

void __late_init(void) {
}

// Establish trivial irq handler.
asm(".text\n"
    ".weak irq\n"
    "irq:\n"
    "  rti\n");

// Establish default nmi handler prologue and epilogue.
asm(".section .nmi_begin,\"axG\",@progbits,nmi\n"
    ".weak nmi\n"
    ".globl __default_nmi\n"
    "nmi:\n"
    "__default_nmi:\n"
    "  pha\n"
    "  txa\n"
    "  pha\n"
    "  tya\n"
    "  pha\n"

    ".section .nmi_end,\"axG\",@progbits,nmi\n"
    "  pla\n"
    "  tay\n"
    "  pla\n"
    "  tax\n"
    "  pla\n"
    "  rti\n");
