/*
 *
 * Copyright (c) 2015 Samsung Electronics Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <linux/linkage.h>
#include <linux/rkp_cfp.h>
#include <asm/assembler.h>
#include <asm/memory.h>

.section .hyperdrive, "ax"
.global _start_hyperdrive
_start_hyperdrive:
# Need a nop otherwise GCC keeps _start_hyperdrive label but NOT
# jopp_springboard_bl label.
nop

#ifdef CONFIG_RKP_CFP_JOPP

/*
 * Load the word just before the function instructions.
 * Halt execution if the word doesn't match the magic number placed at function
 * entries.
 */
	.macro	springboard_blr, reg
	jopp_springboard_blr_\reg:
	push	RRX, xzr
	ldr	RRX_32, [\reg, #-4]
	subs	RRX_32, RRX_32, #0xbe7, lsl #12
	cmp	RRX_32, #0xbad
	b.eq	1f

	/* 
	 * Allow the MODULE region
	 */
	mov_q	RRX, MODULES_VADDR
	cmp	\reg, RRX
	b.lt	2f 
	mov_q	RRX, MODULES_END
	cmp	\reg, RRX
	b.hs	2f 

1: // Pass
	pop	RRX, xzr
	br 	\reg

2: // Fail
#if 0
	//Test code
	push	x0, x1
	push	x2, x3
	push	x4, x5
	push	x6, x7
	push	x8, x9
	push	x10, x11
	push	x12, x13
	push	x14, x15
	push	RRX, x17
	push	x29, x30
	mov	x0, \reg
	mov	x1, x30
	bl	cfp_record_jopp
	pop	x29, x30
	pop	RRX, x17
	pop	x14, x15
	pop	x12, x13
	pop	x10, x11
	pop	x8, x9
	pop	x6, x7
	pop	x4, x5
	pop	x2, x3
	pop	x0, x1
#else
	.inst	0xdeadc0de //crash for sure
#endif
	.endm

	// Only add springboards for a register rX if there exists a "BLR rX" instruction in vmlinux to instrument
	springboard_blr x0
	springboard_blr	x1
	springboard_blr	x2
	springboard_blr	x3
	springboard_blr	x4
	springboard_blr	x5
	springboard_blr	x6
	springboard_blr	x7
	springboard_blr	x8
	springboard_blr	x9
	springboard_blr	x10
	springboard_blr	x11
	springboard_blr	x12
	springboard_blr	x13
	springboard_blr	x14
	springboard_blr	x15
	/*
	 * x16, x17 are reserved.
	 * Undefine ROPP will free x16 and x17
	 * JOPP only needs no registers
	 */
#ifndef CONFIG_RKP_CFP_ROPP
	springboard_blr	x16
	springboard_blr	x17
#endif
	springboard_blr	x18
	springboard_blr	x19
	springboard_blr	x20
	springboard_blr	x21
	springboard_blr	x22
	springboard_blr	x23
	springboard_blr	x24
	springboard_blr	x25
	springboard_blr	x26
	springboard_blr	x27
	springboard_blr	x28
	springboard_blr	x29
	springboard_blr	x30
	// Don't need springboards for x31 (not allowed in RET by assembler)

#endif

#ifdef CONFIG_RKP_CFP_ROPP
/*
 * ROPP allows backtrace debugging
 *   x0 = encrypted return address
 *   x1 = task struct
 */
ENTRY(ropp_enable_backtrace)
#ifdef CONFIG_RKP_CFP_ROPP_SYSREGKEY
	push	x2, x3
	ldr	x2, [x1, #TSK_TI_RRK]
	eor	x0, x0, x2		// x0=ra^x17^mk
	mrs	x3, DAIF
	msr	DAIFset, #0x3
	mrs	x2, RRMK
	eor	x0, x0, x2		//x0=ra^x17^mk^mk=ra^x17
	msr	DAIF, x3
	pop	x2, x3
	ret
#else
	ldr	x1, [x1, #TSK_TI_RRK]
	eor	x0, x0, x1
	ret
#endif
ENDPROC(ropp_enable_backtrace)
#endif

.global _end_hyperdrive
_end_hyperdrive:

.section .text
