
libcrt0.a.elf:	file format elf32-mos

Disassembly of section .text:

00008000 <_start>:
    8000: 78           	sei
    8001: a2 ff        	ldx	#$ff
    8003: 9a           	txs
    8004: 20 0b 80     	jsr	$800b
    8007: 20 11 80     	jsr	$8011

0000800a <irq>:
    800a: 40           	rti

0000800b <__early_init>:
    800b: a2 00        	ldx	#$0
    800d: 8e 00 20     	stx	$2000
    8010: 60           	rts

00008011 <__late_init>:
    8011: 60           	rts

00008012 <nmi>:
    8012: 48           	pha
    8013: 8a           	txa
    8014: 48           	pha
    8015: 98           	tya
    8016: 48           	pha
    8017: 68           	pla
    8018: a8           	tay
    8019: 68           	pla
    801a: aa           	tax
    801b: 68           	pla
    801c: 40           	rti
