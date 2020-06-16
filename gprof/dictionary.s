	.file	"dictionary.c"
	.text
.Ltext0:
	.globl	h_mod
	.type	h_mod, @function
h_mod:
.LFB39:
	.file 1 "dictionary.c"
	.loc 1 119 0
	.cfi_startproc
.LVL0:
	.loc 1 122 0
	leaq	1(%rdi), %rsi
.LVL1:
	movzbl	(%rdi), %ecx
.LVL2:
	testb	%cl, %cl
	je	.L4
	.loc 1 123 0
	movl	tsize(%rip), %edi
	.loc 1 120 0
	movl	$0, %edx
.LVL3:
.L3:
	.loc 1 123 0
	movl	%edx, %eax
	sall	$7, %eax
	movsbl	%cl, %ecx
.LVL4:
	addl	%ecx, %eax
	movl	$0, %edx
.LVL5:
	divl	%edi
.LVL6:
	.loc 1 122 0
	addq	$1, %rsi
.LVL7:
	movzbl	-1(%rsi), %ecx
.LVL8:
	testb	%cl, %cl
	jne	.L3
.LVL9:
.L1:
	.loc 1 125 0
	movl	%edx, %eax
	ret
.LVL10:
.L4:
	.loc 1 120 0
	movl	$0, %edx
	.loc 1 124 0
	jmp	.L1
	.cfi_endproc
.LFE39:
	.size	h_mod, .-h_mod
	.globl	h_add
	.type	h_add, @function
h_add:
.LFB40:
	.loc 1 129 0
	.cfi_startproc
.LVL11:
	.loc 1 132 0
	leaq	1(%rdi), %rsi
.LVL12:
	movzbl	(%rdi), %ecx
.LVL13:
	testb	%cl, %cl
	je	.L9
	.loc 1 130 0
	movl	$0, %eax
.LVL14:
.L8:
	.loc 1 133 0
	movsbl	%cl, %ecx
.LVL15:
	addl	%ecx, %eax
.LVL16:
	.loc 1 132 0
	addq	$1, %rsi
.LVL17:
	movzbl	-1(%rsi), %ecx
.LVL18:
	testb	%cl, %cl
	jne	.L8
.LVL19:
.L7:
	.loc 1 134 0
	movl	$0, %edx
	divl	tsize(%rip)
	.loc 1 135 0
	movl	%edx, %eax
	ret
.LVL20:
.L9:
	.loc 1 130 0
	movl	$0, %eax
	jmp	.L7
	.cfi_endproc
.LFE40:
	.size	h_add, .-h_add
	.globl	h_xor
	.type	h_xor, @function
h_xor:
.LFB41:
	.loc 1 139 0
	.cfi_startproc
.LVL21:
	.loc 1 142 0
	leaq	1(%rdi), %rdx
.LVL22:
	movzbl	(%rdi), %ecx
.LVL23:
	testb	%cl, %cl
	je	.L14
	.loc 1 140 0
	movl	$0, %eax
.LVL24:
.L13:
	.loc 1 143 0
	movsbl	%cl, %ecx
.LVL25:
	xorl	%eax, %ecx
.LVL26:
	sall	$4, %ecx
	shrl	$28, %eax
.LVL27:
	orl	%ecx, %eax
.LVL28:
	.loc 1 142 0
	addq	$1, %rdx
.LVL29:
	movzbl	-1(%rdx), %ecx
.LVL30:
	testb	%cl, %cl
	jne	.L13
.LVL31:
.L12:
	.loc 1 144 0
	movl	$0, %edx
.LVL32:
	divl	tsize(%rip)
	.loc 1 145 0
	movl	%edx, %eax
	ret
.LVL33:
.L14:
	.loc 1 140 0
	movl	$0, %eax
	jmp	.L12
	.cfi_endproc
.LFE41:
	.size	h_xor, .-h_xor
	.globl	compare_ele
	.type	compare_ele, @function
compare_ele:
.LFB46:
	.loc 1 240 0
	.cfi_startproc
.LVL34:
	.loc 1 243 0
	movq	(%rsi), %rax
	movq	(%rdi), %rdx
	movl	8(%rax), %eax
	subl	8(%rdx), %eax
	.loc 1 244 0
	ret
	.cfi_endproc
.LFE46:
	.size	compare_ele, .-compare_ele
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Couldn't allocate hash array, exiting\n"
	.text
	.type	new_table, @function
new_table:
.LFB37:
	.loc 1 83 0
	.cfi_startproc
.LVL35:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 84 0
	movl	%edi, tsize(%rip)
	.loc 1 85 0
	movslq	%edi, %rdi
.LVL36:
	movl	$8, %esi
	call	calloc@PLT
.LVL37:
	movq	%rax, htable(%rip)
	.loc 1 86 0
	testq	%rax, %rax
	je	.L20
	.loc 1 90 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L20:
	.cfi_restore_state
.LVL38:
.LBB41:
.LBB42:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 97 0
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
.LVL39:
.LBE42:
.LBE41:
	.loc 1 88 0
	movl	$1, %edi
	call	exit@PLT
.LVL40:
	.cfi_endproc
.LFE37:
	.size	new_table, .-new_table
	.globl	Strlen
	.type	Strlen, @function
Strlen:
.LFB36:
	.loc 1 57 0
	.cfi_startproc
.LVL41:
	.loc 1 59 0
	movq	$-1, %rcx
	movl	$0, %eax
	repnz scasb
.LVL42:
	movq	%rcx, %rax
	notq	%rax
	subq	$1, %rax
	.loc 1 68 0
	ret
	.cfi_endproc
.LFE36:
	.size	Strlen, .-Strlen
	.globl	lower1
	.type	lower1, @function
lower1:
.LFB34:
	.loc 1 30 0
	.cfi_startproc
.LVL43:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %r12
.LVL44:
	.loc 1 33 0
	movl	$0, %ebp
	jmp	.L23
.LVL45:
.L24:
	.loc 1 33 0 is_stmt 0 discriminator 2
	addl	$1, %ebp
.LVL46:
.L23:
	.loc 1 33 0 discriminator 1
	movslq	%ebp, %rbx
	movq	%r12, %rdi
	call	Strlen
.LVL47:
	cmpq	%rax, %rbx
	jnb	.L27
	.loc 1 34 0 is_stmt 1
	addq	%r12, %rbx
	movzbl	(%rbx), %eax
	leal	-65(%rax), %edx
	cmpb	$25, %dl
	ja	.L24
	.loc 1 35 0
	addl	$32, %eax
	movb	%al, (%rbx)
	jmp	.L24
.L27:
	.loc 1 36 0
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL48:
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL49:
	ret
	.cfi_endproc
.LFE34:
	.size	lower1, .-lower1
	.globl	lower2
	.type	lower2, @function
lower2:
.LFB35:
	.loc 1 40 0
	.cfi_startproc
.LVL50:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	.loc 1 42 0
	call	Strlen
.LVL51:
	.loc 1 44 0
	testl	%eax, %eax
	jle	.L28
	movq	%rbx, %rdx
	leal	-1(%rax), %eax
.LVL52:
	leaq	1(%rbx,%rax), %rsi
	jmp	.L31
.LVL53:
.L30:
	addq	$1, %rdx
.LVL54:
	.loc 1 44 0 is_stmt 0 discriminator 2
	cmpq	%rsi, %rdx
	je	.L28
.L31:
.LVL55:
	.loc 1 45 0 is_stmt 1
	movzbl	(%rdx), %eax
	leal	-65(%rax), %ecx
	cmpb	$25, %cl
	ja	.L30
	.loc 1 46 0
	addl	$32, %eax
	movb	%al, (%rdx)
	jmp	.L30
.LVL56:
.L28:
	.loc 1 47 0
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL57:
	ret
	.cfi_endproc
.LFE35:
	.size	lower2, .-lower2
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"Couldn't allocate hash element, exiting\n"
	.text
	.type	new_ele, @function
new_ele:
.LFB38:
	.loc 1 93 0
	.cfi_startproc
.LVL58:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbp
	.loc 1 94 0
	movl	$24, %edi
.LVL59:
	call	malloc@PLT
.LVL60:
	movq	%rax, %rbx
.LVL61:
	.loc 1 95 0
	movq	%rbp, %rdi
	call	Strlen
.LVL62:
	.loc 1 96 0
	movl	llen(%rip), %edx
	cmpl	%eax, %edx
	jge	.L35
	.loc 1 97 0
	movq	%rbp, lstring(%rip)
	.loc 1 98 0
	movl	%eax, llen(%rip)
	.loc 1 99 0
	movl	$1, lcnt(%rip)
.L36:
	.loc 1 102 0
	testq	%rbx, %rbx
	je	.L39
	.loc 1 107 0
	movq	%rbp, (%rbx)
	.loc 1 108 0
	movl	$1, 8(%rbx)
	.loc 1 110 0
	movq	%rbx, %rax
.LVL63:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL64:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL65:
	ret
.LVL66:
.L35:
	.cfi_restore_state
	.loc 1 100 0
	cmpl	%eax, %edx
	jne	.L36
	.loc 1 101 0
	addl	$1, lcnt(%rip)
	jmp	.L36
.L39:
.LVL67:
.LBB43:
.LBB44:
	.loc 2 97 0
	movq	stderr(%rip), %rcx
	movl	$40, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	fwrite@PLT
.LVL68:
.LBE44:
.LBE43:
	.loc 1 104 0
	movl	$1, %edi
	call	exit@PLT
.LVL69:
	.cfi_endproc
.LFE38:
	.size	new_ele, .-new_ele
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Couldn't allocate space for string, exiting\n"
	.text
	.globl	save_string
	.type	save_string, @function
save_string:
.LFB42:
	.loc 1 152 0
	.cfi_startproc
.LVL70:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbp
	.loc 1 153 0
	call	Strlen
.LVL71:
	leaq	1(%rax), %rdi
	call	malloc@PLT
.LVL72:
	.loc 1 154 0
	testq	%rax, %rax
	je	.L43
.LVL73:
.LBB45:
.LBB46:
	.file 3 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h"
	.loc 3 90 0
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
.LVL74:
.LBE46:
.LBE45:
	.loc 1 160 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL75:
	ret
.LVL76:
.L43:
	.cfi_restore_state
.LBB47:
.LBB48:
	.loc 2 97 0
	movq	stderr(%rip), %rcx
	movl	$44, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	fwrite@PLT
.LVL77:
.LBE48:
.LBE47:
	.loc 1 156 0
	movl	$1, %edi
	call	exit@PLT
.LVL78:
	.cfi_endproc
.LFE42:
	.size	save_string, .-save_string
	.globl	find_ele_rec
	.type	find_ele_rec, @function
find_ele_rec:
.LFB43:
	.loc 1 164 0
	.cfi_startproc
.LVL79:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rsi, %rbp
	.loc 1 165 0
	testq	%rdi, %rdi
	je	.L49
	movq	%rdi, %rbx
	.loc 1 170 0
	movq	(%rdi), %rsi
.LVL80:
	movq	%rbp, %rdi
.LVL81:
	call	strcmp@PLT
.LVL82:
	testl	%eax, %eax
	jne	.L47
	.loc 1 171 0
	movl	8(%rbx), %eax
	addl	$1, %eax
	movl	%eax, 8(%rbx)
	.loc 1 172 0
	cmpl	mcnt(%rip), %eax
	jle	.L46
	.loc 1 173 0
	movl	%eax, mcnt(%rip)
	.loc 1 174 0
	movq	(%rbx), %rax
	movq	%rax, mstring(%rip)
.LVL83:
.L46:
	.loc 1 180 0
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL84:
	ret
.LVL85:
.L49:
	.cfi_restore_state
	.loc 1 167 0
	addl	$1, ucnt(%rip)
	.loc 1 168 0
	movq	%rsi, %rdi
.LVL86:
	call	save_string
.LVL87:
	movq	%rax, %rdi
	call	new_ele
.LVL88:
	movq	%rax, %rbx
	jmp	.L46
.LVL89:
.L47:
	.loc 1 178 0
	movq	16(%rbx), %rdi
	movq	%rbp, %rsi
	call	find_ele_rec
.LVL90:
	movq	%rax, 16(%rbx)
	.loc 1 179 0
	jmp	.L46
	.cfi_endproc
.LFE43:
	.size	find_ele_rec, .-find_ele_rec
	.globl	find_ele_iter_f
	.type	find_ele_iter_f, @function
find_ele_iter_f:
.LFB44:
	.loc 1 184 0
	.cfi_startproc
.LVL91:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, %r13
	movq	%rsi, %r12
.LVL92:
	.loc 1 186 0
	testq	%rdi, %rdi
	je	.L51
	movq	%rdi, %rbx
.LVL93:
.L54:
.LBB49:
	.loc 1 187 0
	movq	(%rbx), %rbp
.LVL94:
	.loc 1 188 0
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
.LVL95:
	testl	%eax, %eax
	je	.L58
.LBE49:
	.loc 1 186 0 discriminator 2
	movq	16(%rbx), %rbx
.LVL96:
	testq	%rbx, %rbx
	jne	.L54
.LVL97:
.L51:
	.loc 1 197 0
	movq	%r12, %rdi
	call	save_string
.LVL98:
	movq	%rax, %rdi
	call	new_ele
.LVL99:
	.loc 1 198 0
	addl	$1, ucnt(%rip)
	.loc 1 199 0
	movq	%r13, 16(%rax)
.LVL100:
.L50:
	.loc 1 201 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL101:
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL102:
	ret
.LVL103:
.L58:
	.cfi_restore_state
.LBB51:
.LBB50:
	.loc 1 189 0
	movl	8(%rbx), %eax
	leal	1(%rax), %edx
	movl	%edx, 8(%rbx)
.LVL104:
	.loc 1 194 0
	movq	%r13, %rax
	.loc 1 190 0
	cmpl	mcnt(%rip), %edx
	jle	.L50
.LVL105:
	.loc 1 191 0
	movl	%edx, mcnt(%rip)
	.loc 1 192 0
	movq	%rbp, mstring(%rip)
	jmp	.L50
.LBE50:
.LBE51:
	.cfi_endproc
.LFE44:
	.size	find_ele_iter_f, .-find_ele_iter_f
	.globl	find_ele_iter_r
	.type	find_ele_iter_r, @function
find_ele_iter_r:
.LFB45:
	.loc 1 205 0
	.cfi_startproc
.LVL106:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%rsi, %r12
.LVL107:
	.loc 1 208 0
	testq	%rdi, %rdi
	je	.L60
	movq	%rdi, %r13
	movq	%rdi, %rbx
	jmp	.L63
.LVL108:
.L64:
	movq	%rax, %rbx
.LVL109:
.L63:
.LBB52:
	.loc 1 209 0
	movq	(%rbx), %rbp
.LVL110:
	.loc 1 210 0
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
.LVL111:
	testl	%eax, %eax
	je	.L68
.LVL112:
.LBE52:
	.loc 1 208 0 discriminator 2
	movq	16(%rbx), %rax
.LVL113:
	testq	%rax, %rax
	jne	.L64
	.loc 1 220 0
	movq	%r12, %rdi
	call	save_string
.LVL114:
	movq	%rax, %rdi
	call	new_ele
.LVL115:
	.loc 1 221 0
	addl	$1, ucnt(%rip)
	.loc 1 222 0
	movq	$0, 16(%rax)
	.loc 1 223 0
	testq	%rbx, %rbx
	je	.L65
	.loc 1 224 0
	movq	%rax, 16(%rbx)
.LVL116:
.L66:
	.loc 1 228 0
	movq	%r13, %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL117:
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL118:
.L68:
	.cfi_restore_state
.LBB54:
.LBB53:
	.loc 1 211 0
	movl	8(%rbx), %eax
	addl	$1, %eax
	movl	%eax, 8(%rbx)
.LVL119:
	.loc 1 212 0
	cmpl	mcnt(%rip), %eax
	jle	.L66
	.loc 1 213 0
	movl	%eax, mcnt(%rip)
	.loc 1 214 0
	movq	%rbp, mstring(%rip)
	jmp	.L66
.LVL120:
.L65:
.LBE53:
.LBE54:
	.loc 1 220 0
	movq	%rax, %r13
.LVL121:
	jmp	.L66
.LVL122:
.L60:
	movq	%rsi, %rdi
.LVL123:
	call	save_string
.LVL124:
	movq	%rax, %rdi
	call	new_ele
.LVL125:
	movq	%rax, %r13
.LVL126:
	.loc 1 221 0
	addl	$1, ucnt(%rip)
	.loc 1 222 0
	movq	$0, 16(%rax)
	jmp	.L66
	.cfi_endproc
.LFE45:
	.size	find_ele_iter_r, .-find_ele_iter_r
	.globl	sort_words
	.type	sort_words, @function
sort_words:
.LFB47:
	.loc 1 249 0
	.cfi_startproc
.LVL127:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	%edi, %r12d
.LVL128:
	.loc 1 252 0
	movslq	ucnt(%rip), %rdi
.LVL129:
	movl	$8, %esi
	call	calloc@PLT
.LVL130:
	movq	%rax, %rbx
.LVL131:
	.loc 1 255 0
	movl	$0, scnt(%rip)
.LVL132:
	.loc 1 256 0
	movl	tsize(%rip), %r14d
	testl	%r14d, %r14d
	jle	.L70
	.loc 1 257 0
	movq	htable(%rip), %r15
	movl	$0, %r10d
	.loc 1 254 0
	movl	$0, %ebp
	.loc 1 259 0
	movl	$1, %r13d
	jmp	.L80
.LVL133:
.L96:
	addl	$1, %r9d
	movl	%r13d, %r11d
	jmp	.L72
.L73:
	.loc 1 261 0
	movslq	%ebp, %rax
	movq	%rcx, (%rbx,%rax,8)
.L76:
	.loc 1 267 0 discriminator 2
	addl	$1, %ebp
.LVL134:
	.loc 1 257 0 discriminator 2
	movq	16(%rcx), %rcx
.LVL135:
	testq	%rcx, %rcx
	je	.L95
.L78:
	.loc 1 258 0
	movl	8(%rcx), %eax
	cmpl	$1, %eax
	je	.L96
.L72:
	.loc 1 260 0
	testl	%r12d, %r12d
	jne	.L73
.LVL136:
	.loc 1 263 0
	testl	%ebp, %ebp
	jle	.L86
	movslq	%ebp, %rdi
	salq	$3, %rdi
	movq	-8(%rbx,%rdi), %rsi
	movl	%ebp, %edx
	cmpl	8(%rsi), %eax
	jle	.L74
.LVL137:
	leal	-1(%rbp), %eax
	cltq
	salq	$3, %rax
	jmp	.L77
.LVL138:
.L87:
	movq	%r8, %rax
.L77:
	.loc 1 264 0 discriminator 4
	movq	%rsi, (%rbx,%rdi)
.LVL139:
	.loc 1 263 0 discriminator 4
	subl	$1, %edx
.LVL140:
	je	.L74
	.loc 1 263 0 is_stmt 0 discriminator 3
	movq	-8(%rbx,%rax), %rsi
	leaq	-8(%rax), %r8
	movq	%rax, %rdi
	movl	8(%rsi), %eax
	cmpl	%eax, 8(%rcx)
	jg	.L87
.L74:
	.loc 1 265 0 is_stmt 1
	movslq	%edx, %rdx
	movq	%rcx, (%rbx,%rdx,8)
	jmp	.L76
.LVL141:
.L86:
	.loc 1 263 0
	movl	%ebp, %edx
	jmp	.L74
.LVL142:
.L95:
	testb	%r11b, %r11b
	jne	.L97
.L71:
.LVL143:
	addq	$1, %r10
.LVL144:
	.loc 1 256 0 discriminator 2
	cmpl	%r10d, %r14d
	jle	.L98
.LVL145:
.L80:
	.loc 1 257 0
	movq	(%r15,%r10,8), %rcx
.LVL146:
	testq	%rcx, %rcx
	je	.L71
	movl	scnt(%rip), %r9d
	movl	$0, %r11d
	jmp	.L78
.L97:
	movl	%r9d, scnt(%rip)
	jmp	.L71
.LVL147:
.L98:
	.loc 1 269 0
	testl	%r12d, %r12d
	jne	.L84
.LVL148:
.L81:
	.loc 1 272 0
	movq	(%rbx), %r13
.LVL149:
	.loc 1 273 0
	leal	-1(%rbp), %eax
	testl	%eax, %eax
	jle	.L82
	movq	%rbx, %rax
	leal	-2(%rbp), %edx
	leaq	8(%rbx,%rdx,8), %rsi
.LVL150:
.L83:
	.loc 1 274 0 discriminator 3
	movq	(%rax), %rdx
	movq	8(%rax), %rcx
	movq	%rcx, 16(%rdx)
	addq	$8, %rax
	.loc 1 273 0 discriminator 3
	cmpq	%rsi, %rax
	jne	.L83
.L82:
	.loc 1 275 0
	movslq	%ebp, %rbp
	movq	-8(%rbx,%rbp,8), %rax
	movq	$0, 16(%rax)
	.loc 1 276 0
	movq	%rbx, %rdi
	call	free@PLT
.LVL151:
	.loc 1 278 0
	movq	%r13, %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL152:
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL153:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL154:
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL155:
.L99:
	.cfi_restore_state
	.loc 1 254 0
	movl	$0, %ebp
.LVL156:
.L84:
	.loc 1 270 0
	movslq	%ebp, %rsi
	leaq	compare_ele(%rip), %rcx
	movl	$8, %edx
	movq	%rbx, %rdi
	call	qsort@PLT
.LVL157:
	jmp	.L81
.LVL158:
.L70:
	.loc 1 269 0
	testl	%r12d, %r12d
	jne	.L99
	.loc 1 272 0
	movq	(%rbx), %r13
.LVL159:
	.loc 1 254 0
	movl	%r12d, %ebp
	jmp	.L82
	.cfi_endproc
.LFE47:
	.size	sort_words, .-sort_words
	.globl	insert_string
	.type	insert_string, @function
insert_string:
.LFB48:
	.loc 1 284 0
	.cfi_startproc
.LVL160:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rcx, %r12
	.loc 1 286 0
	call	*%rdx
.LVL161:
	.loc 1 287 0
	movq	%rbx, %rdi
	call	*%rbp
.LVL162:
	.loc 1 288 0
	cltq
	movq	htable(%rip), %rdx
	leaq	(%rdx,%rax,8), %rbp
.LVL163:
	movq	%rbx, %rsi
	movq	0(%rbp), %rdi
	call	*%r12
.LVL164:
	movq	%rax, 0(%rbp)
	.loc 1 289 0
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL165:
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL166:
	ret
	.cfi_endproc
.LFE48:
	.size	insert_string, .-insert_string
	.globl	init_token
	.type	init_token, @function
init_token:
.LFB49:
	.loc 1 297 0
	.cfi_startproc
.LVL167:
	.loc 1 298 0
	movl	$0, bufvalid(%rip)
	.loc 1 299 0
	movq	%rdi, infile(%rip)
	.loc 1 300 0
	ret
	.cfi_endproc
.LFE49:
	.size	init_token, .-init_token
	.section	.rodata
	.align 8
.LC3:
	.string	" \t\n\r.,:;/<>()[]{}?!\"-'"
	.string	"xc2"
	.string	"xa0"
	.text
	.globl	get_word
	.type	get_word, @function
get_word:
.LFB50:
	.loc 1 307 0
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LVL168:
	.loc 1 311 0
	leaq	.LC3(%rip), %rbx
	jmp	.L107
.LVL169:
.L104:
.LBB55:
.LBB56:
	.loc 2 262 0
	movq	infile(%rip), %rdx
	movl	$1024, %esi
	leaq	buf(%rip), %rdi
	call	fgets@PLT
.LVL170:
.LBE56:
.LBE55:
	.loc 1 315 0
	testq	%rax, %rax
	je	.L103
	.loc 1 317 0
	movl	$1, bufvalid(%rip)
	.loc 1 318 0
	movq	%rbx, %rsi
	leaq	buf(%rip), %rdi
	call	strtok@PLT
.LVL171:
	.loc 1 319 0
	testq	%rax, %rax
	jne	.L105
.LVL172:
.L107:
	.loc 1 310 0
	cmpl	$0, bufvalid(%rip)
	je	.L104
	.loc 1 311 0
	movq	%rbx, %rsi
	movl	$0, %edi
	call	strtok@PLT
.LVL173:
	.loc 1 312 0
	testq	%rax, %rax
	je	.L104
.L105:
	.loc 1 322 0
	addl	$1, wcnt(%rip)
.LVL174:
.L103:
	.loc 1 324 0
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	get_word, .-get_word
	.globl	get_token
	.type	get_token, @function
get_token:
.LFB51:
	.loc 1 330 0
	.cfi_startproc
.LVL175:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.LVL176:
	.loc 1 339 0
	cmpl	$1, %edi
	je	.L127
	movl	%edi, %ebp
	.loc 1 341 0
	cmpl	$0, first.3667(%rip)
	je	.L113
	.loc 1 343 0
	leal	-1(%rdi), %r12d
	cmpl	bindex.3668(%rip), %r12d
	jle	.L114
.LBB57:
	.loc 1 348 0
	leaq	token_buf.3666(%rip), %r13
.LVL177:
.L115:
	.loc 1 344 0
	movl	$0, %eax
	call	get_word
.LVL178:
	.loc 1 345 0
	testq	%rax, %rax
	je	.L110
	.loc 1 348 0
	movl	bindex.3668(%rip), %edi
	leal	1(%rdi), %ebx
	movl	%ebx, bindex.3668(%rip)
.LVL179:
	movslq	%edi, %rdi
	salq	$10, %rdi
.LVL180:
	addq	%r13, %rdi
.LBB58:
.LBB59:
	.loc 3 90 0
	movq	%rax, %rsi
	call	strcpy@PLT
.LVL181:
.LBE59:
.LBE58:
.LBE57:
	.loc 1 343 0
	cmpl	%r12d, %ebx
	jl	.L115
.LVL182:
.L114:
	.loc 1 350 0
	movl	$0, first.3667(%rip)
.L113:
	.loc 1 353 0
	movl	$0, %eax
	call	get_word
.LVL183:
	.loc 1 354 0
	testq	%rax, %rax
	je	.L110
	.loc 1 357 0
	movl	bindex.3668(%rip), %edx
	leal	1(%rdx), %ebx
	movl	%ebx, bindex.3668(%rip)
.LVL184:
	movslq	%edx, %rdi
	movq	%rdi, %rdx
	salq	$10, %rdx
.LVL185:
	leaq	token_buf.3666(%rip), %rdi
.LVL186:
	addq	%rdx, %rdi
.LVL187:
.LBB60:
.LBB61:
	.loc 3 90 0
	movq	%rax, %rsi
	call	strcpy@PLT
.LVL188:
.LBE61:
.LBE60:
	.loc 1 358 0
	cmpl	$9, %ebx
	jle	.L116
	.loc 1 359 0
	movl	$0, bindex.3668(%rip)
.L116:
.LVL189:
	.loc 1 362 0
	movl	bindex.3668(%rip), %ebx
	subl	%ebp, %ebx
.LVL190:
	.loc 1 363 0
	leal	10(%rbx), %eax
	testl	%ebx, %ebx
	cmovs	%eax, %ebx
.LVL191:
	.loc 1 364 0
	movl	$0, %r13d
	leaq	sbuf.3669(%rip), %r14
	.loc 1 367 0
	leaq	token_buf.3666(%rip), %r15
	.loc 1 377 0
	movq	%r14, %rax
	.loc 1 364 0
	testl	%ebp, %ebp
	jg	.L118
	jmp	.L110
.LVL192:
.L127:
	.loc 1 340 0
	movl	$0, %eax
	call	get_word
.LVL193:
	jmp	.L110
.LVL194:
.L121:
	.loc 1 365 0
	testl	%r13d, %r13d
	je	.L123
	.loc 1 366 0
	leaq	1(%rax), %r14
.LVL195:
	movb	$32, (%rax)
.LVL196:
.L118:
	.loc 1 367 0
	movslq	%ebx, %r12
	salq	$10, %r12
	addq	%r15, %r12
.LVL197:
.LBB62:
.LBB63:
	.loc 3 90 0
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	strcpy@PLT
.LVL198:
.LBE63:
.LBE62:
	.loc 1 369 0
	movq	%r12, %rdi
	call	Strlen
.LVL199:
	addq	%r14, %rax
.LVL200:
	.loc 1 370 0
	addl	$1, %ebx
.LVL201:
	.loc 1 372 0
	cmpl	$10, %ebx
	movl	$0, %edx
	cmovge	%edx, %ebx
.LVL202:
	.loc 1 364 0
	addl	$1, %r13d
.LVL203:
	cmpl	%r13d, %ebp
	jne	.L121
	.loc 1 377 0
	leaq	sbuf.3669(%rip), %rax
.LVL204:
.L110:
	.loc 1 378 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL205:
.L123:
	.cfi_restore_state
	.loc 1 369 0
	movq	%rax, %r14
	jmp	.L118
	.cfi_endproc
.LFE51:
	.size	get_token, .-get_token
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"%d\t'%s'\n"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"%d n-grams, %d unique, %d singletons.  Most common (%d) = '%s'.  Longest (%d have length %d) = '%s'\n"
	.text
	.globl	word_freq
	.type	word_freq, @function
word_freq:
.LFB52:
	.loc 1 386 0
	.cfi_startproc
.LVL206:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%esi, %ebx
	movl	%edx, %ebp
	movl	%ecx, %r15d
	movl	%r8d, 12(%rsp)
	movq	%r9, %r14
	movq	80(%rsp), %r13
	movq	88(%rsp), %r12
	.loc 1 390 0
	call	init_token
.LVL207:
	.loc 1 391 0
	movl	%r15d, %edi
	call	new_table
.LVL208:
	.loc 1 393 0
	jmp	.L129
.LVL209:
.L130:
	.loc 1 394 0
	movq	%r12, %rcx
	movq	%r13, %rdx
	movq	%r14, %rsi
	movq	%rax, %rdi
	call	insert_string
.LVL210:
.L129:
	.loc 1 393 0
	movl	%ebp, %edi
	call	get_token
.LVL211:
	testq	%rax, %rax
	jne	.L130
	.loc 1 396 0
	testl	%ebx, %ebx
	jle	.L131
	.loc 1 397 0
	movl	12(%rsp), %edi
	call	sort_words
.LVL212:
	movq	%rax, %rbp
.LVL213:
	.loc 1 398 0
	testq	%rax, %rax
	je	.L131
	subl	$1, %ebx
.LVL214:
.LBB64:
.LBB65:
	.loc 2 104 0
	leaq	.LC4(%rip), %r12
.LVL215:
.L132:
	movl	8(%rbp), %edx
	movq	0(%rbp), %rcx
	movq	%r12, %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.LVL216:
.LBE65:
.LBE64:
	.loc 1 400 0
	movq	16(%rbp), %rbp
.LVL217:
	.loc 1 398 0
	testq	%rbp, %rbp
	je	.L131
	.loc 1 398 0 is_stmt 0 discriminator 1
	subl	$1, %ebx
.LVL218:
	cmpl	$-1, %ebx
	jne	.L132
.LVL219:
.L131:
.LBB66:
.LBB67:
	.loc 2 104 0 is_stmt 1
	pushq	lstring(%rip)
	.cfi_def_cfa_offset 88
	movl	llen(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 96
	movl	lcnt(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 104
	pushq	mstring(%rip)
	.cfi_def_cfa_offset 112
	movl	mcnt(%rip), %r9d
	movl	scnt(%rip), %r8d
	movl	ucnt(%rip), %ecx
	movl	wcnt(%rip), %edx
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.LVL220:
.LBE67:
.LBE66:
	.loc 1 405 0
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL221:
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL222:
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL223:
	ret
	.cfi_endproc
.LFE52:
	.size	word_freq, .-word_freq
	.section	.rodata.str1.1
.LC6:
	.string	"verbose"
.LC7:
	.string	"size"
.LC8:
	.string	"hash"
.LC9:
	.string	"lower"
.LC10:
	.string	"find"
.LC11:
	.string	"ngram"
.LC12:
	.string	"quicksort"
.LC13:
	.string	"file"
.LC14:
	.string	"N-gram size %d\n"
.LC15:
	.string	"Lower case function %s\n"
.LC16:
	.string	"Hash function %s\n"
.LC17:
	.string	"Find element function %s\n"
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"Invalid hash function index %d\n"
	.align 8
.LC19:
	.string	"Invalid lower function index %d\n"
	.align 8
.LC20:
	.string	"Invalid find function index %d\n"
	.section	.rodata.str1.1
.LC21:
	.string	"r"
.LC22:
	.string	"Couldn't open file '%s'\n"
.LC24:
	.string	"Total time = %f seconds\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB53:
	.loc 1 408 0
	.cfi_startproc
.LVL224:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movl	%edi, %ebp
	movq	%rsi, %r12
	.loc 1 408 0
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	.loc 1 409 0
	movl	$1, 4(%rsp)
	.loc 1 410 0
	movl	$1024, 8(%rsp)
	.loc 1 411 0
	movl	$0, 12(%rsp)
	.loc 1 412 0
	movl	$0, 16(%rsp)
	.loc 1 413 0
	movl	$0, 20(%rsp)
	.loc 1 414 0
	movl	$1, 24(%rsp)
	.loc 1 415 0
	movl	$0, 28(%rsp)
	.loc 1 416 0
	movq	$0, 32(%rsp)
	.loc 1 417 0
	movq	stdin(%rip), %rbx
.LVL225:
	.loc 1 418 0
	leaq	4(%rsp), %rsi
.LVL226:
	leaq	.LC6(%rip), %rdi
.LVL227:
	call	add_int_option@PLT
.LVL228:
	.loc 1 419 0
	leaq	8(%rsp), %rsi
	leaq	.LC7(%rip), %rdi
	call	add_int_option@PLT
.LVL229:
	.loc 1 420 0
	leaq	12(%rsp), %rsi
	leaq	.LC8(%rip), %rdi
	call	add_int_option@PLT
.LVL230:
	.loc 1 421 0
	leaq	16(%rsp), %rsi
	leaq	.LC9(%rip), %rdi
	call	add_int_option@PLT
.LVL231:
	.loc 1 422 0
	leaq	20(%rsp), %rsi
	leaq	.LC10(%rip), %rdi
	call	add_int_option@PLT
.LVL232:
	.loc 1 423 0
	leaq	24(%rsp), %rsi
	leaq	.LC11(%rip), %rdi
	call	add_int_option@PLT
.LVL233:
	.loc 1 424 0
	leaq	28(%rsp), %rsi
	leaq	.LC12(%rip), %rdi
	call	add_int_option@PLT
.LVL234:
	.loc 1 425 0
	leaq	32(%rsp), %rsi
	leaq	.LC13(%rip), %rdi
	call	add_string_option@PLT
.LVL235:
	.loc 1 426 0
	movl	$0, %edx
	movq	%r12, %rsi
	movl	%ebp, %edi
	call	parse_options@PLT
.LVL236:
	.loc 1 427 0
	movq	stdout(%rip), %rdi
	call	show_options@PLT
.LVL237:
.LBB68:
.LBB69:
	.loc 2 104 0
	movl	24(%rsp), %edx
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.LVL238:
.LBE69:
.LBE68:
	.loc 1 429 0
	movslq	16(%rsp), %rdx
.LBB70:
.LBB71:
	.loc 2 104 0
	leaq	lower_fun_names(%rip), %rax
	movq	(%rax,%rdx,8), %rdx
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.LVL239:
.LBE71:
.LBE70:
	.loc 1 430 0
	movslq	12(%rsp), %rdx
.LBB72:
.LBB73:
	.loc 2 104 0
	leaq	hash_fun_names(%rip), %rax
	movq	(%rax,%rdx,8), %rdx
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.LVL240:
.LBE73:
.LBE72:
	.loc 1 431 0
	movslq	20(%rsp), %rdx
.LBB74:
.LBB75:
	.loc 2 104 0
	leaq	find_ele_fun_names(%rip), %rax
	movq	(%rax,%rdx,8), %rdx
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.LVL241:
.LBE75:
.LBE74:
	.loc 1 432 0
	movl	12(%rsp), %ecx
	cmpl	$2, %ecx
	ja	.L142
	.loc 1 436 0
	movl	16(%rsp), %ecx
	cmpl	$1, %ecx
	ja	.L143
	.loc 1 440 0
	movl	20(%rsp), %ecx
	cmpl	$2, %ecx
	ja	.L144
	.loc 1 444 0
	movq	32(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L139
	.loc 1 445 0
	leaq	.LC21(%rip), %rsi
	call	fopen@PLT
.LVL242:
	movq	%rax, %rbx
.LVL243:
	.loc 1 446 0
	testq	%rax, %rax
	je	.L145
.LVL244:
.L139:
	.loc 1 451 0
	movslq	12(%rsp), %rdx
	movslq	20(%rsp), %rcx
	leaq	find_ele_fun_set(%rip), %rax
	pushq	(%rax,%rcx,8)
	.cfi_def_cfa_offset 88
	movslq	24(%rsp), %rcx
	leaq	lower_fun_set(%rip), %rax
	pushq	(%rax,%rcx,8)
	.cfi_def_cfa_offset 96
	leaq	hash_fun_set(%rip), %rax
	movq	(%rax,%rdx,8), %r9
	movl	44(%rsp), %r8d
	movl	24(%rsp), %ecx
	movl	40(%rsp), %edx
	movl	20(%rsp), %esi
	movq	%rbx, %rdi
	call	word_freq
.LVL245:
	.loc 1 455 0
	call	clock@PLT
.LVL246:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC23(%rip), %xmm0
.LBB76:
.LBB77:
	.loc 2 104 0
	leaq	.LC24(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
.LVL247:
.LBE77:
.LBE76:
	.loc 1 456 0
	movq	%rbx, %rdi
	call	fclose@PLT
.LVL248:
	addq	$16, %rsp
	.cfi_def_cfa_offset 80
	.loc 1 458 0
	movl	$0, %eax
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
.LVL249:
	jne	.L146
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL250:
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL251:
	ret
.LVL252:
.L142:
	.cfi_restore_state
.LBB78:
.LBB79:
	.loc 2 97 0
	leaq	.LC18(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL253:
.LBE79:
.LBE78:
	.loc 1 434 0
	movl	$1, %edi
	call	exit@PLT
.LVL254:
.L143:
.LBB80:
.LBB81:
	.loc 2 97 0
	leaq	.LC19(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL255:
.LBE81:
.LBE80:
	.loc 1 438 0
	movl	$1, %edi
	call	exit@PLT
.LVL256:
.L144:
.LBB82:
.LBB83:
	.loc 2 97 0
	leaq	.LC20(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL257:
.LBE83:
.LBE82:
	.loc 1 442 0
	movl	$1, %edi
	call	exit@PLT
.LVL258:
.L145:
.LBB84:
.LBB85:
	.loc 2 97 0
	movq	32(%rsp), %rcx
	leaq	.LC22(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL259:
	call	__fprintf_chk@PLT
.LVL260:
.LBE85:
.LBE84:
	.loc 1 448 0
	movl	$1, %edi
	call	exit@PLT
.LVL261:
.L146:
	.loc 1 458 0
	call	__stack_chk_fail@PLT
.LVL262:
	.cfi_endproc
.LFE53:
	.size	main, .-main
	.local	token_buf.3666
	.comm	token_buf.3666,10240,32
	.local	bindex.3668
	.comm	bindex.3668,4,4
	.data
	.align 4
	.type	first.3667, @object
	.size	first.3667, 4
first.3667:
	.long	1
	.local	sbuf.3669
	.comm	sbuf.3669,1024,32
	.comm	infile,8,8
	.globl	bufvalid
	.bss
	.align 4
	.type	bufvalid, @object
	.size	bufvalid, 4
bufvalid:
	.zero	4
	.comm	buf,1024,32
	.globl	find_ele_fun_names
	.section	.rodata.str1.1
.LC25:
	.string	"find_ele_rec"
.LC26:
	.string	"find_ele_iter_f"
.LC27:
	.string	"find_ele_iter_r"
	.section	.data.rel.local,"aw",@progbits
	.align 16
	.type	find_ele_fun_names, @object
	.size	find_ele_fun_names, 24
find_ele_fun_names:
	.quad	.LC25
	.quad	.LC26
	.quad	.LC27
	.globl	find_ele_fun_set
	.align 16
	.type	find_ele_fun_set, @object
	.size	find_ele_fun_set, 24
find_ele_fun_set:
	.quad	find_ele_rec
	.quad	find_ele_iter_f
	.quad	find_ele_iter_r
	.globl	hash_fun_names
	.section	.rodata.str1.1
.LC28:
	.string	"h_mod"
.LC29:
	.string	"h_add"
.LC30:
	.string	"h_xor"
	.section	.data.rel.local
	.align 16
	.type	hash_fun_names, @object
	.size	hash_fun_names, 24
hash_fun_names:
	.quad	.LC28
	.quad	.LC29
	.quad	.LC30
	.globl	hash_fun_set
	.align 16
	.type	hash_fun_set, @object
	.size	hash_fun_set, 24
hash_fun_set:
	.quad	h_mod
	.quad	h_add
	.quad	h_xor
	.comm	tsize,4,4
	.comm	htable,8,8
	.globl	lower_fun_names
	.section	.rodata.str1.1
.LC31:
	.string	"lower1"
.LC32:
	.string	"lower2"
	.section	.data.rel.local
	.align 16
	.type	lower_fun_names, @object
	.size	lower_fun_names, 16
lower_fun_names:
	.quad	.LC31
	.quad	.LC32
	.globl	lower_fun_set
	.align 16
	.type	lower_fun_set, @object
	.size	lower_fun_set, 16
lower_fun_set:
	.quad	lower1
	.quad	lower2
	.globl	lcnt
	.bss
	.align 4
	.type	lcnt, @object
	.size	lcnt, 4
lcnt:
	.zero	4
	.globl	lstring
	.section	.rodata.str1.1
.LC33:
	.string	""
	.section	.data.rel.local
	.align 8
	.type	lstring, @object
	.size	lstring, 8
lstring:
	.quad	.LC33
	.globl	llen
	.bss
	.align 4
	.type	llen, @object
	.size	llen, 4
llen:
	.zero	4
	.globl	mstring
	.section	.data.rel.local
	.align 8
	.type	mstring, @object
	.size	mstring, 8
mstring:
	.quad	.LC33
	.globl	scnt
	.bss
	.align 4
	.type	scnt, @object
	.size	scnt, 4
scnt:
	.zero	4
	.globl	mcnt
	.align 4
	.type	mcnt, @object
	.size	mcnt, 4
mcnt:
	.zero	4
	.globl	ucnt
	.align 4
	.type	ucnt, @object
	.size	ucnt, 4
ucnt:
	.zero	4
	.globl	wcnt
	.align 4
	.type	wcnt, @object
	.size	wcnt, 4
wcnt:
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC23:
	.long	0
	.long	1093567616
	.text
.Letext0:
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/libio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 8 "/usr/include/stdio.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 10 "/usr/include/time.h"
	.file 11 "options.h"
	.file 12 "/usr/include/stdlib.h"
	.file 13 "<built-in>"
	.file 14 "/usr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1aa5
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF162
	.byte	0xc
	.long	.LASF163
	.long	.LASF164
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x4
	.byte	0xd8
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x5
	.byte	0x8c
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x5
	.byte	0x8d
	.long	0x69
	.uleb128 0x2
	.long	.LASF10
	.byte	0x5
	.byte	0x90
	.long	0x69
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x9e
	.uleb128 0x7
	.long	0x93
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x8
	.long	0x9e
	.uleb128 0x9
	.long	.LASF42
	.byte	0xd8
	.byte	0x6
	.byte	0xf5
	.long	0x22a
	.uleb128 0xa
	.long	.LASF12
	.byte	0x6
	.byte	0xf6
	.long	0x62
	.byte	0
	.uleb128 0xa
	.long	.LASF13
	.byte	0x6
	.byte	0xfb
	.long	0x93
	.byte	0x8
	.uleb128 0xa
	.long	.LASF14
	.byte	0x6
	.byte	0xfc
	.long	0x93
	.byte	0x10
	.uleb128 0xa
	.long	.LASF15
	.byte	0x6
	.byte	0xfd
	.long	0x93
	.byte	0x18
	.uleb128 0xa
	.long	.LASF16
	.byte	0x6
	.byte	0xfe
	.long	0x93
	.byte	0x20
	.uleb128 0xa
	.long	.LASF17
	.byte	0x6
	.byte	0xff
	.long	0x93
	.byte	0x28
	.uleb128 0xb
	.long	.LASF18
	.byte	0x6
	.value	0x100
	.long	0x93
	.byte	0x30
	.uleb128 0xb
	.long	.LASF19
	.byte	0x6
	.value	0x101
	.long	0x93
	.byte	0x38
	.uleb128 0xb
	.long	.LASF20
	.byte	0x6
	.value	0x102
	.long	0x93
	.byte	0x40
	.uleb128 0xb
	.long	.LASF21
	.byte	0x6
	.value	0x104
	.long	0x93
	.byte	0x48
	.uleb128 0xb
	.long	.LASF22
	.byte	0x6
	.value	0x105
	.long	0x93
	.byte	0x50
	.uleb128 0xb
	.long	.LASF23
	.byte	0x6
	.value	0x106
	.long	0x93
	.byte	0x58
	.uleb128 0xb
	.long	.LASF24
	.byte	0x6
	.value	0x108
	.long	0x26d
	.byte	0x60
	.uleb128 0xb
	.long	.LASF25
	.byte	0x6
	.value	0x10a
	.long	0x273
	.byte	0x68
	.uleb128 0xb
	.long	.LASF26
	.byte	0x6
	.value	0x10c
	.long	0x62
	.byte	0x70
	.uleb128 0xb
	.long	.LASF27
	.byte	0x6
	.value	0x110
	.long	0x62
	.byte	0x74
	.uleb128 0xb
	.long	.LASF28
	.byte	0x6
	.value	0x112
	.long	0x70
	.byte	0x78
	.uleb128 0xb
	.long	.LASF29
	.byte	0x6
	.value	0x116
	.long	0x46
	.byte	0x80
	.uleb128 0xb
	.long	.LASF30
	.byte	0x6
	.value	0x117
	.long	0x54
	.byte	0x82
	.uleb128 0xb
	.long	.LASF31
	.byte	0x6
	.value	0x118
	.long	0x279
	.byte	0x83
	.uleb128 0xb
	.long	.LASF32
	.byte	0x6
	.value	0x11c
	.long	0x289
	.byte	0x88
	.uleb128 0xb
	.long	.LASF33
	.byte	0x6
	.value	0x125
	.long	0x7b
	.byte	0x90
	.uleb128 0xb
	.long	.LASF34
	.byte	0x6
	.value	0x12d
	.long	0x91
	.byte	0x98
	.uleb128 0xb
	.long	.LASF35
	.byte	0x6
	.value	0x12e
	.long	0x91
	.byte	0xa0
	.uleb128 0xb
	.long	.LASF36
	.byte	0x6
	.value	0x12f
	.long	0x91
	.byte	0xa8
	.uleb128 0xb
	.long	.LASF37
	.byte	0x6
	.value	0x130
	.long	0x91
	.byte	0xb0
	.uleb128 0xb
	.long	.LASF38
	.byte	0x6
	.value	0x132
	.long	0x2d
	.byte	0xb8
	.uleb128 0xb
	.long	.LASF39
	.byte	0x6
	.value	0x133
	.long	0x62
	.byte	0xc0
	.uleb128 0xb
	.long	.LASF40
	.byte	0x6
	.value	0x135
	.long	0x28f
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF41
	.byte	0x7
	.byte	0x7
	.long	0xaa
	.uleb128 0xc
	.long	.LASF165
	.byte	0x6
	.byte	0x9a
	.uleb128 0x9
	.long	.LASF43
	.byte	0x18
	.byte	0x6
	.byte	0xa0
	.long	0x26d
	.uleb128 0xa
	.long	.LASF44
	.byte	0x6
	.byte	0xa1
	.long	0x26d
	.byte	0
	.uleb128 0xa
	.long	.LASF45
	.byte	0x6
	.byte	0xa2
	.long	0x273
	.byte	0x8
	.uleb128 0xa
	.long	.LASF46
	.byte	0x6
	.byte	0xa6
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x23c
	.uleb128 0x6
	.byte	0x8
	.long	0xaa
	.uleb128 0xd
	.long	0x9e
	.long	0x289
	.uleb128 0xe
	.long	0x38
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x235
	.uleb128 0xd
	.long	0x9e
	.long	0x29f
	.uleb128 0xe
	.long	0x38
	.byte	0x13
	.byte	0
	.uleb128 0xf
	.long	.LASF166
	.uleb128 0x10
	.long	.LASF47
	.byte	0x6
	.value	0x13f
	.long	0x29f
	.uleb128 0x10
	.long	.LASF48
	.byte	0x6
	.value	0x140
	.long	0x29f
	.uleb128 0x10
	.long	.LASF49
	.byte	0x6
	.value	0x141
	.long	0x29f
	.uleb128 0x6
	.byte	0x8
	.long	0xa5
	.uleb128 0x8
	.long	0x2c8
	.uleb128 0x7
	.long	0x2c8
	.uleb128 0x11
	.long	.LASF50
	.byte	0x8
	.byte	0x87
	.long	0x273
	.uleb128 0x11
	.long	.LASF51
	.byte	0x8
	.byte	0x88
	.long	0x273
	.uleb128 0x11
	.long	.LASF52
	.byte	0x8
	.byte	0x89
	.long	0x273
	.uleb128 0x11
	.long	.LASF53
	.byte	0x9
	.byte	0x1a
	.long	0x62
	.uleb128 0xd
	.long	0x2ce
	.long	0x30f
	.uleb128 0x12
	.byte	0
	.uleb128 0x8
	.long	0x304
	.uleb128 0x11
	.long	.LASF54
	.byte	0x9
	.byte	0x1b
	.long	0x30f
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF55
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF56
	.uleb128 0x6
	.byte	0x8
	.long	0x333
	.uleb128 0x13
	.uleb128 0xd
	.long	0x93
	.long	0x344
	.uleb128 0xe
	.long	0x38
	.byte	0x1
	.byte	0
	.uleb128 0x11
	.long	.LASF57
	.byte	0xa
	.byte	0x9f
	.long	0x334
	.uleb128 0x11
	.long	.LASF58
	.byte	0xa
	.byte	0xa0
	.long	0x62
	.uleb128 0x11
	.long	.LASF59
	.byte	0xa
	.byte	0xa1
	.long	0x69
	.uleb128 0x11
	.long	.LASF60
	.byte	0xa
	.byte	0xa6
	.long	0x334
	.uleb128 0x11
	.long	.LASF61
	.byte	0xa
	.byte	0xae
	.long	0x62
	.uleb128 0x11
	.long	.LASF62
	.byte	0xa
	.byte	0xaf
	.long	0x69
	.uleb128 0x14
	.long	.LASF63
	.byte	0x1
	.byte	0xe
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	wcnt
	.uleb128 0x14
	.long	.LASF64
	.byte	0x1
	.byte	0xf
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	ucnt
	.uleb128 0x14
	.long	.LASF65
	.byte	0x1
	.byte	0x10
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	mcnt
	.uleb128 0x14
	.long	.LASF66
	.byte	0x1
	.byte	0x11
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	scnt
	.uleb128 0x14
	.long	.LASF67
	.byte	0x1
	.byte	0x12
	.long	0x93
	.uleb128 0x9
	.byte	0x3
	.quad	mstring
	.uleb128 0x14
	.long	.LASF68
	.byte	0x1
	.byte	0x13
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	llen
	.uleb128 0x14
	.long	.LASF69
	.byte	0x1
	.byte	0x14
	.long	0x93
	.uleb128 0x9
	.byte	0x3
	.quad	lstring
	.uleb128 0x14
	.long	.LASF70
	.byte	0x1
	.byte	0x15
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	lcnt
	.uleb128 0x2
	.long	.LASF71
	.byte	0x1
	.byte	0x18
	.long	0x439
	.uleb128 0x6
	.byte	0x8
	.long	0x43f
	.uleb128 0x15
	.long	0x44a
	.uleb128 0x16
	.long	0x93
	.byte	0
	.uleb128 0xd
	.long	0x42e
	.long	0x45a
	.uleb128 0xe
	.long	0x38
	.byte	0x1
	.byte	0
	.uleb128 0x14
	.long	.LASF72
	.byte	0x1
	.byte	0x33
	.long	0x44a
	.uleb128 0x9
	.byte	0x3
	.quad	lower_fun_set
	.uleb128 0x14
	.long	.LASF73
	.byte	0x1
	.byte	0x34
	.long	0x334
	.uleb128 0x9
	.byte	0x3
	.quad	lower_fun_names
	.uleb128 0x9
	.long	.LASF74
	.byte	0x18
	.byte	0x1
	.byte	0x48
	.long	0x4b5
	.uleb128 0xa
	.long	.LASF75
	.byte	0x1
	.byte	0x49
	.long	0x93
	.byte	0
	.uleb128 0xa
	.long	.LASF76
	.byte	0x1
	.byte	0x4a
	.long	0x62
	.byte	0x8
	.uleb128 0xa
	.long	.LASF77
	.byte	0x1
	.byte	0x4b
	.long	0x4b5
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x484
	.uleb128 0x2
	.long	.LASF78
	.byte	0x1
	.byte	0x4c
	.long	0x4b5
	.uleb128 0x14
	.long	.LASF79
	.byte	0x1
	.byte	0x4f
	.long	0x4db
	.uleb128 0x9
	.byte	0x3
	.quad	htable
	.uleb128 0x6
	.byte	0x8
	.long	0x4bb
	.uleb128 0x14
	.long	.LASF80
	.byte	0x1
	.byte	0x50
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	tsize
	.uleb128 0x2
	.long	.LASF81
	.byte	0x1
	.byte	0x74
	.long	0x501
	.uleb128 0x6
	.byte	0x8
	.long	0x507
	.uleb128 0x17
	.long	0x4d
	.long	0x516
	.uleb128 0x16
	.long	0x93
	.byte	0
	.uleb128 0xd
	.long	0x4f6
	.long	0x526
	.uleb128 0xe
	.long	0x38
	.byte	0x2
	.byte	0
	.uleb128 0x14
	.long	.LASF82
	.byte	0x1
	.byte	0x94
	.long	0x516
	.uleb128 0x9
	.byte	0x3
	.quad	hash_fun_set
	.uleb128 0xd
	.long	0x93
	.long	0x54b
	.uleb128 0xe
	.long	0x38
	.byte	0x2
	.byte	0
	.uleb128 0x14
	.long	.LASF83
	.byte	0x1
	.byte	0x95
	.long	0x53b
	.uleb128 0x9
	.byte	0x3
	.quad	hash_fun_names
	.uleb128 0x2
	.long	.LASF84
	.byte	0x1
	.byte	0xe7
	.long	0x56b
	.uleb128 0x6
	.byte	0x8
	.long	0x571
	.uleb128 0x17
	.long	0x4bb
	.long	0x585
	.uleb128 0x16
	.long	0x4bb
	.uleb128 0x16
	.long	0x93
	.byte	0
	.uleb128 0xd
	.long	0x560
	.long	0x595
	.uleb128 0xe
	.long	0x38
	.byte	0x2
	.byte	0
	.uleb128 0x14
	.long	.LASF85
	.byte	0x1
	.byte	0xea
	.long	0x585
	.uleb128 0x9
	.byte	0x3
	.quad	find_ele_fun_set
	.uleb128 0x14
	.long	.LASF86
	.byte	0x1
	.byte	0xec
	.long	0x53b
	.uleb128 0x9
	.byte	0x3
	.quad	find_ele_fun_names
	.uleb128 0xd
	.long	0x9e
	.long	0x5d0
	.uleb128 0x18
	.long	0x38
	.value	0x3ff
	.byte	0
	.uleb128 0x19
	.string	"buf"
	.byte	0x1
	.value	0x125
	.long	0x5bf
	.uleb128 0x9
	.byte	0x3
	.quad	buf
	.uleb128 0x1a
	.long	.LASF87
	.byte	0x1
	.value	0x126
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	bufvalid
	.uleb128 0x1a
	.long	.LASF88
	.byte	0x1
	.value	0x127
	.long	0x612
	.uleb128 0x9
	.byte	0x3
	.quad	infile
	.uleb128 0x6
	.byte	0x8
	.long	0x22a
	.uleb128 0x7
	.long	0x612
	.uleb128 0x1b
	.long	.LASF167
	.byte	0x1
	.value	0x12f
	.long	0x93
	.uleb128 0x1c
	.long	.LASF102
	.byte	0x1
	.value	0x197
	.long	0x62
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0xba1
	.uleb128 0x1d
	.long	.LASF89
	.byte	0x1
	.value	0x197
	.long	0x62
	.long	.LLST76
	.uleb128 0x1d
	.long	.LASF90
	.byte	0x1
	.value	0x197
	.long	0xba1
	.long	.LLST77
	.uleb128 0x1e
	.long	.LASF91
	.byte	0x1
	.value	0x199
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1e
	.long	.LASF92
	.byte	0x1
	.value	0x19a
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1e
	.long	.LASF93
	.byte	0x1
	.value	0x19b
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1e
	.long	.LASF94
	.byte	0x1
	.value	0x19c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1e
	.long	.LASF95
	.byte	0x1
	.value	0x19d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1e
	.long	.LASF96
	.byte	0x1
	.value	0x19e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1e
	.long	.LASF97
	.byte	0x1
	.value	0x19f
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1e
	.long	.LASF98
	.byte	0x1
	.value	0x1a0
	.long	0x93
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.long	.LASF88
	.byte	0x1
	.value	0x1a1
	.long	0x612
	.long	.LLST78
	.uleb128 0x20
	.long	0x1977
	.quad	.LBB68
	.quad	.LBE68-.LBB68
	.byte	0x1
	.value	0x1ac
	.long	0x73c
	.uleb128 0x21
	.long	0x1987
	.long	.LLST79
	.uleb128 0x22
	.quad	.LVL238
	.long	0x19bc
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC14
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x1977
	.quad	.LBB70
	.quad	.LBE70-.LBB70
	.byte	0x1
	.value	0x1ad
	.long	0x782
	.uleb128 0x21
	.long	0x1987
	.long	.LLST80
	.uleb128 0x22
	.quad	.LVL239
	.long	0x19bc
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC15
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x1977
	.quad	.LBB72
	.quad	.LBE72-.LBB72
	.byte	0x1
	.value	0x1ae
	.long	0x7c8
	.uleb128 0x21
	.long	0x1987
	.long	.LLST81
	.uleb128 0x22
	.quad	.LVL240
	.long	0x19bc
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC16
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x1977
	.quad	.LBB74
	.quad	.LBE74-.LBB74
	.byte	0x1
	.value	0x1af
	.long	0x80e
	.uleb128 0x21
	.long	0x1987
	.long	.LLST82
	.uleb128 0x22
	.quad	.LVL241
	.long	0x19bc
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC17
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x1977
	.quad	.LBB76
	.quad	.LBE76-.LBB76
	.byte	0x1
	.value	0x1c7
	.long	0x854
	.uleb128 0x21
	.long	0x1987
	.long	.LLST83
	.uleb128 0x22
	.quad	.LVL247
	.long	0x19bc
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC24
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x1994
	.quad	.LBB78
	.quad	.LBE78-.LBB78
	.byte	0x1
	.value	0x1b1
	.long	0x89f
	.uleb128 0x21
	.long	0x19af
	.long	.LLST84
	.uleb128 0x24
	.long	0x19a4
	.uleb128 0x22
	.quad	.LVL253
	.long	0x19c7
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC18
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x1994
	.quad	.LBB80
	.quad	.LBE80-.LBB80
	.byte	0x1
	.value	0x1b5
	.long	0x8ea
	.uleb128 0x21
	.long	0x19af
	.long	.LLST85
	.uleb128 0x24
	.long	0x19a4
	.uleb128 0x22
	.quad	.LVL255
	.long	0x19c7
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC19
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x1994
	.quad	.LBB82
	.quad	.LBE82-.LBB82
	.byte	0x1
	.value	0x1b9
	.long	0x935
	.uleb128 0x21
	.long	0x19af
	.long	.LLST86
	.uleb128 0x24
	.long	0x19a4
	.uleb128 0x22
	.quad	.LVL257
	.long	0x19c7
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC20
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x1994
	.quad	.LBB84
	.quad	.LBE84-.LBB84
	.byte	0x1
	.value	0x1bf
	.long	0x980
	.uleb128 0x21
	.long	0x19af
	.long	.LLST87
	.uleb128 0x24
	.long	0x19a4
	.uleb128 0x22
	.quad	.LVL260
	.long	0x19c7
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC22
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL228
	.long	0x19d2
	.long	0x9a6
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.uleb128 0x25
	.quad	.LVL229
	.long	0x19d2
	.long	0x9cc
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x25
	.quad	.LVL230
	.long	0x19d2
	.long	0x9f2
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x25
	.quad	.LVL231
	.long	0x19d2
	.long	0xa17
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x25
	.quad	.LVL232
	.long	0x19d2
	.long	0xa3c
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0x25
	.quad	.LVL233
	.long	0x19d2
	.long	0xa61
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x25
	.quad	.LVL234
	.long	0x19d2
	.long	0xa86
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC12
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x25
	.quad	.LVL235
	.long	0x19dd
	.long	0xaab
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC13
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x25
	.quad	.LVL236
	.long	0x19e8
	.long	0xace
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x26
	.quad	.LVL237
	.long	0x19f3
	.uleb128 0x25
	.quad	.LVL242
	.long	0x19fe
	.long	0xafa
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC21
	.byte	0
	.uleb128 0x25
	.quad	.LVL245
	.long	0xba7
	.long	0xb12
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x26
	.quad	.LVL246
	.long	0x1a09
	.uleb128 0x25
	.quad	.LVL248
	.long	0x1a14
	.long	0xb37
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x25
	.quad	.LVL254
	.long	0x1a1f
	.long	0xb4e
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x25
	.quad	.LVL256
	.long	0x1a1f
	.long	0xb65
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x25
	.quad	.LVL258
	.long	0x1a1f
	.long	0xb7c
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x25
	.quad	.LVL261
	.long	0x1a1f
	.long	0xb93
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x26
	.quad	.LVL262
	.long	0x1a2b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x93
	.uleb128 0x27
	.long	.LASF110
	.byte	0x1
	.value	0x17f
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0xd6a
	.uleb128 0x28
	.string	"src"
	.byte	0x1
	.value	0x17f
	.long	0x612
	.long	.LLST66
	.uleb128 0x1d
	.long	.LASF91
	.byte	0x1
	.value	0x17f
	.long	0x62
	.long	.LLST67
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x1
	.value	0x17f
	.long	0x62
	.long	.LLST68
	.uleb128 0x1d
	.long	.LASF92
	.byte	0x1
	.value	0x17f
	.long	0x62
	.long	.LLST69
	.uleb128 0x1d
	.long	.LASF97
	.byte	0x1
	.value	0x17f
	.long	0x62
	.long	.LLST70
	.uleb128 0x1d
	.long	.LASF99
	.byte	0x1
	.value	0x180
	.long	0x4f6
	.long	.LLST71
	.uleb128 0x29
	.long	.LASF100
	.byte	0x1
	.value	0x180
	.long	0x42e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x29
	.long	.LASF101
	.byte	0x1
	.value	0x181
	.long	0x560
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2a
	.string	"s"
	.byte	0x1
	.value	0x183
	.long	0x93
	.long	.LLST72
	.uleb128 0x2a
	.string	"ls"
	.byte	0x1
	.value	0x184
	.long	0x4bb
	.long	.LLST73
	.uleb128 0x20
	.long	0x1977
	.quad	.LBB64
	.quad	.LBE64-.LBB64
	.byte	0x1
	.value	0x18f
	.long	0xc9f
	.uleb128 0x21
	.long	0x1987
	.long	.LLST74
	.uleb128 0x22
	.quad	.LVL216
	.long	0x19bc
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x1977
	.quad	.LBB66
	.quad	.LBE66-.LBB66
	.byte	0x1
	.value	0x193
	.long	0xce5
	.uleb128 0x21
	.long	0x1987
	.long	.LLST75
	.uleb128 0x22
	.quad	.LVL220
	.long	0x19bc
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL207
	.long	0x1060
	.long	0xcfe
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x25
	.quad	.LVL208
	.long	0x1794
	.long	0xd16
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x25
	.quad	.LVL210
	.long	0x108c
	.long	0xd3a
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x25
	.quad	.LVL211
	.long	0xd6a
	.long	0xd52
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x22
	.quad	.LVL212
	.long	0x113b
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x91
	.sleb128 -68
	.byte	0x94
	.byte	0x4
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF103
	.byte	0x1
	.value	0x149
	.long	0x93
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.long	0xf80
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x1
	.value	0x149
	.long	0x62
	.long	.LLST54
	.uleb128 0x1e
	.long	.LASF104
	.byte	0x1
	.value	0x14c
	.long	0xf80
	.uleb128 0x9
	.byte	0x3
	.quad	token_buf.3666
	.uleb128 0x1e
	.long	.LASF105
	.byte	0x1
	.value	0x14d
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	first.3667
	.uleb128 0x1e
	.long	.LASF106
	.byte	0x1
	.value	0x14e
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	bindex.3668
	.uleb128 0x1e
	.long	.LASF107
	.byte	0x1
	.value	0x14f
	.long	0x5bf
	.uleb128 0x9
	.byte	0x3
	.quad	sbuf.3669
	.uleb128 0x1f
	.long	.LASF108
	.byte	0x1
	.value	0x150
	.long	0x93
	.long	.LLST55
	.uleb128 0x2a
	.string	"i"
	.byte	0x1
	.value	0x151
	.long	0x62
	.long	.LLST56
	.uleb128 0x1f
	.long	.LASF109
	.byte	0x1
	.value	0x151
	.long	0x62
	.long	.LLST57
	.uleb128 0x1f
	.long	.LASF75
	.byte	0x1
	.value	0x161
	.long	0x93
	.long	.LLST58
	.uleb128 0x2b
	.quad	.LBB57
	.quad	.LBE57-.LBB57
	.long	0xeb3
	.uleb128 0x1f
	.long	.LASF75
	.byte	0x1
	.value	0x158
	.long	0x93
	.long	.LLST59
	.uleb128 0x20
	.long	0x191e
	.quad	.LBB58
	.quad	.LBE58-.LBB58
	.byte	0x1
	.value	0x15c
	.long	0xea5
	.uleb128 0x21
	.long	0x1939
	.long	.LLST60
	.uleb128 0x21
	.long	0x192e
	.long	.LLST61
	.uleb128 0x22
	.quad	.LVL181
	.long	0x1a34
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.byte	0x73
	.sleb128 -1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x26
	.quad	.LVL178
	.long	0xf97
	.byte	0
	.uleb128 0x20
	.long	0x191e
	.quad	.LBB60
	.quad	.LBE60-.LBB60
	.byte	0x1
	.value	0x165
	.long	0xf08
	.uleb128 0x21
	.long	0x1939
	.long	.LLST62
	.uleb128 0x21
	.long	0x192e
	.long	.LLST63
	.uleb128 0x22
	.quad	.LVL188
	.long	0x1a34
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x14
	.byte	0x73
	.sleb128 -1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3666
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x191e
	.quad	.LBB62
	.quad	.LBE62-.LBB62
	.byte	0x1
	.value	0x170
	.long	0xf51
	.uleb128 0x21
	.long	0x1939
	.long	.LLST64
	.uleb128 0x21
	.long	0x192e
	.long	.LLST65
	.uleb128 0x22
	.quad	.LVL198
	.long	0x1a34
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x26
	.quad	.LVL183
	.long	0xf97
	.uleb128 0x26
	.quad	.LVL193
	.long	0xf97
	.uleb128 0x22
	.quad	.LVL199
	.long	0x1848
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x9e
	.long	0xf97
	.uleb128 0xe
	.long	0x38
	.byte	0x9
	.uleb128 0x18
	.long	0x38
	.value	0x3ff
	.byte	0
	.uleb128 0x2c
	.long	.LASF111
	.byte	0x1
	.value	0x132
	.long	0x93
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.long	0x1060
	.uleb128 0x2a
	.string	"s"
	.byte	0x1
	.value	0x134
	.long	0x93
	.long	.LLST50
	.uleb128 0x20
	.long	0x1945
	.quad	.LBB55
	.quad	.LBE55-.LBB55
	.byte	0x1
	.value	0x13b
	.long	0x1021
	.uleb128 0x21
	.long	0x196b
	.long	.LLST51
	.uleb128 0x21
	.long	0x1960
	.long	.LLST52
	.uleb128 0x21
	.long	0x1955
	.long	.LLST53
	.uleb128 0x22
	.quad	.LVL170
	.long	0x1a43
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	buf
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x400
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL171
	.long	0x1a52
	.long	0x1046
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	buf
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x22
	.quad	.LVL173
	.long	0x1a52
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF112
	.byte	0x1
	.value	0x129
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.long	0x108c
	.uleb128 0x2d
	.string	"in"
	.byte	0x1
	.value	0x129
	.long	0x612
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x27
	.long	.LASF113
	.byte	0x1
	.value	0x119
	.quad	.LFB48
	.quad	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.long	0x113b
	.uleb128 0x28
	.string	"s"
	.byte	0x1
	.value	0x119
	.long	0x93
	.long	.LLST45
	.uleb128 0x1d
	.long	.LASF99
	.byte	0x1
	.value	0x11a
	.long	0x4f6
	.long	.LLST46
	.uleb128 0x1d
	.long	.LASF100
	.byte	0x1
	.value	0x11a
	.long	0x42e
	.long	.LLST47
	.uleb128 0x1d
	.long	.LASF101
	.byte	0x1
	.value	0x11b
	.long	0x560
	.long	.LLST48
	.uleb128 0x1f
	.long	.LASF109
	.byte	0x1
	.value	0x11d
	.long	0x62
	.long	.LLST49
	.uleb128 0x2e
	.quad	.LVL161
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.long	0x1110
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2e
	.quad	.LVL162
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.long	0x1127
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL164
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LASF114
	.byte	0x1
	.byte	0xf8
	.long	0x4bb
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.long	0x1222
	.uleb128 0x31
	.long	.LASF97
	.byte	0x1
	.byte	0xf8
	.long	0x62
	.long	.LLST38
	.uleb128 0x32
	.string	"ls"
	.byte	0x1
	.byte	0xfa
	.long	0x4bb
	.long	.LLST39
	.uleb128 0x32
	.string	"ele"
	.byte	0x1
	.byte	0xfb
	.long	0x4bb
	.long	.LLST40
	.uleb128 0x33
	.long	.LASF115
	.byte	0x1
	.byte	0xfc
	.long	0x4db
	.long	.LLST41
	.uleb128 0x32
	.string	"i"
	.byte	0x1
	.byte	0xfd
	.long	0x62
	.long	.LLST42
	.uleb128 0x32
	.string	"j"
	.byte	0x1
	.byte	0xfd
	.long	0x62
	.long	.LLST43
	.uleb128 0x32
	.string	"cnt"
	.byte	0x1
	.byte	0xfe
	.long	0x62
	.long	.LLST44
	.uleb128 0x25
	.quad	.LVL130
	.long	0x1a5e
	.long	0x11d7
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x25
	.quad	.LVL151
	.long	0x1a6a
	.long	0x11ef
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x22
	.quad	.LVL157
	.long	0x1a76
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x8
	.byte	0x76
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x38
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	compare_ele
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LASF116
	.byte	0x1
	.byte	0xf0
	.long	0x62
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.long	0x127a
	.uleb128 0x34
	.long	.LASF117
	.byte	0x1
	.byte	0xf0
	.long	0x32d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x34
	.long	.LASF118
	.byte	0x1
	.byte	0xf0
	.long	0x32d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x35
	.long	.LASF119
	.byte	0x1
	.byte	0xf1
	.long	0x4bb
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x35
	.long	.LASF120
	.byte	0x1
	.byte	0xf2
	.long	0x4bb
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.long	.LASF121
	.byte	0x1
	.byte	0xcc
	.long	0x4bb
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.long	0x1377
	.uleb128 0x36
	.string	"ls"
	.byte	0x1
	.byte	0xcc
	.long	0x4bb
	.long	.LLST32
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0xcc
	.long	0x93
	.long	.LLST33
	.uleb128 0x32
	.string	"ele"
	.byte	0x1
	.byte	0xce
	.long	0x4bb
	.long	.LLST34
	.uleb128 0x33
	.long	.LASF122
	.byte	0x1
	.byte	0xcf
	.long	0x4bb
	.long	.LLST35
	.uleb128 0x37
	.long	.Ldebug_ranges0+0x30
	.long	0x132c
	.uleb128 0x33
	.long	.LASF75
	.byte	0x1
	.byte	0xd1
	.long	0x93
	.long	.LLST36
	.uleb128 0x2b
	.quad	.LBB53
	.quad	.LBE53-.LBB53
	.long	0x1311
	.uleb128 0x33
	.long	.LASF76
	.byte	0x1
	.byte	0xd3
	.long	0x62
	.long	.LLST37
	.byte	0
	.uleb128 0x22
	.quad	.LVL111
	.long	0x1a82
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL114
	.long	0x14cc
	.long	0x1344
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x26
	.quad	.LVL115
	.long	0x16b5
	.uleb128 0x25
	.quad	.LVL124
	.long	0x14cc
	.long	0x1369
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x26
	.quad	.LVL125
	.long	0x16b5
	.byte	0
	.uleb128 0x30
	.long	.LASF123
	.byte	0x1
	.byte	0xb7
	.long	0x4bb
	.quad	.LFB44
	.quad	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.long	0x143e
	.uleb128 0x36
	.string	"ls"
	.byte	0x1
	.byte	0xb7
	.long	0x4bb
	.long	.LLST28
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0xb7
	.long	0x93
	.long	.LLST29
	.uleb128 0x32
	.string	"ele"
	.byte	0x1
	.byte	0xb9
	.long	0x4bb
	.long	.LLST30
	.uleb128 0x37
	.long	.Ldebug_ranges0+0
	.long	0x1418
	.uleb128 0x33
	.long	.LASF75
	.byte	0x1
	.byte	0xbb
	.long	0x93
	.long	.LLST31
	.uleb128 0x2b
	.quad	.LBB50
	.quad	.LBE50-.LBB50
	.long	0x13fd
	.uleb128 0x35
	.long	.LASF76
	.byte	0x1
	.byte	0xbd
	.long	0x62
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x22
	.quad	.LVL95
	.long	0x1a82
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL98
	.long	0x14cc
	.long	0x1430
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x26
	.quad	.LVL99
	.long	0x16b5
	.byte	0
	.uleb128 0x30
	.long	.LASF124
	.byte	0x1
	.byte	0xa3
	.long	0x4bb
	.quad	.LFB43
	.quad	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.long	0x14cc
	.uleb128 0x36
	.string	"ls"
	.byte	0x1
	.byte	0xa3
	.long	0x4bb
	.long	.LLST26
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0xa3
	.long	0x93
	.long	.LLST27
	.uleb128 0x25
	.quad	.LVL82
	.long	0x1a82
	.long	0x1492
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x25
	.quad	.LVL87
	.long	0x14cc
	.long	0x14aa
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x26
	.quad	.LVL88
	.long	0x16b5
	.uleb128 0x22
	.quad	.LVL90
	.long	0x143e
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LASF125
	.byte	0x1
	.byte	0x97
	.long	0x93
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.long	0x15d4
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0x97
	.long	0x93
	.long	.LLST21
	.uleb128 0x33
	.long	.LASF126
	.byte	0x1
	.byte	0x99
	.long	0x93
	.long	.LLST22
	.uleb128 0x38
	.long	0x191e
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.byte	0x1
	.byte	0x9e
	.long	0x154b
	.uleb128 0x21
	.long	0x1939
	.long	.LLST23
	.uleb128 0x21
	.long	0x192e
	.long	.LLST24
	.uleb128 0x22
	.quad	.LVL74
	.long	0x1a34
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x38
	.long	0x1994
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.byte	0x1
	.byte	0x9b
	.long	0x159b
	.uleb128 0x21
	.long	0x19af
	.long	.LLST25
	.uleb128 0x24
	.long	0x19a4
	.uleb128 0x22
	.quad	.LVL77
	.long	0x1a8d
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL71
	.long	0x1848
	.long	0x15b3
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x26
	.quad	.LVL72
	.long	0x1a9c
	.uleb128 0x22
	.quad	.LVL78
	.long	0x1a1f
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LASF127
	.byte	0x1
	.byte	0x8a
	.long	0x4d
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.long	0x161f
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0x8a
	.long	0x93
	.long	.LLST6
	.uleb128 0x32
	.string	"val"
	.byte	0x1
	.byte	0x8c
	.long	0x4d
	.long	.LLST7
	.uleb128 0x32
	.string	"c"
	.byte	0x1
	.byte	0x8d
	.long	0x62
	.long	.LLST8
	.byte	0
	.uleb128 0x30
	.long	.LASF128
	.byte	0x1
	.byte	0x80
	.long	0x4d
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.long	0x166a
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0x80
	.long	0x93
	.long	.LLST3
	.uleb128 0x32
	.string	"val"
	.byte	0x1
	.byte	0x82
	.long	0x4d
	.long	.LLST4
	.uleb128 0x32
	.string	"c"
	.byte	0x1
	.byte	0x83
	.long	0x62
	.long	.LLST5
	.byte	0
	.uleb128 0x30
	.long	.LASF129
	.byte	0x1
	.byte	0x76
	.long	0x4d
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x16b5
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0x76
	.long	0x93
	.long	.LLST0
	.uleb128 0x32
	.string	"val"
	.byte	0x1
	.byte	0x78
	.long	0x4d
	.long	.LLST1
	.uleb128 0x32
	.string	"c"
	.byte	0x1
	.byte	0x79
	.long	0x62
	.long	.LLST2
	.byte	0
	.uleb128 0x39
	.long	.LASF168
	.byte	0x1
	.byte	0x5c
	.long	0x4bb
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x1794
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0x5c
	.long	0x93
	.long	.LLST17
	.uleb128 0x33
	.long	.LASF126
	.byte	0x1
	.byte	0x5e
	.long	0x4bb
	.long	.LLST18
	.uleb128 0x33
	.long	.LASF130
	.byte	0x1
	.byte	0x5f
	.long	0x62
	.long	.LLST19
	.uleb128 0x38
	.long	0x1994
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.byte	0x1
	.byte	0x67
	.long	0x1751
	.uleb128 0x21
	.long	0x19af
	.long	.LLST20
	.uleb128 0x24
	.long	0x19a4
	.uleb128 0x22
	.quad	.LVL68
	.long	0x1a8d
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x28
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL60
	.long	0x1a9c
	.long	0x1768
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x48
	.byte	0
	.uleb128 0x25
	.quad	.LVL62
	.long	0x1848
	.long	0x1780
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x22
	.quad	.LVL69
	.long	0x1a1f
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x3a
	.long	.LASF169
	.byte	0x1
	.byte	0x52
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x1848
	.uleb128 0x31
	.long	.LASF92
	.byte	0x1
	.byte	0x52
	.long	0x62
	.long	.LLST9
	.uleb128 0x38
	.long	0x1994
	.quad	.LBB41
	.quad	.LBE41-.LBB41
	.byte	0x1
	.byte	0x57
	.long	0x1810
	.uleb128 0x21
	.long	0x19af
	.long	.LLST10
	.uleb128 0x24
	.long	0x19a4
	.uleb128 0x22
	.quad	.LVL39
	.long	0x1a8d
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x26
	.byte	0
	.byte	0
	.uleb128 0x25
	.quad	.LVL37
	.long	0x1a5e
	.long	0x1834
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x22
	.quad	.LVL40
	.long	0x1a1f
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LASF131
	.byte	0x1
	.byte	0x38
	.long	0x2d
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x1877
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0x38
	.long	0x2c8
	.long	.LLST11
	.byte	0
	.uleb128 0x3b
	.long	.LASF132
	.byte	0x1
	.byte	0x27
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x18d2
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0x27
	.long	0x93
	.long	.LLST14
	.uleb128 0x32
	.string	"i"
	.byte	0x1
	.byte	0x29
	.long	0x62
	.long	.LLST15
	.uleb128 0x32
	.string	"len"
	.byte	0x1
	.byte	0x2a
	.long	0x62
	.long	.LLST16
	.uleb128 0x22
	.quad	.LVL51
	.long	0x1848
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	.LASF133
	.byte	0x1
	.byte	0x1d
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0x191e
	.uleb128 0x36
	.string	"s"
	.byte	0x1
	.byte	0x1d
	.long	0x93
	.long	.LLST12
	.uleb128 0x32
	.string	"i"
	.byte	0x1
	.byte	0x1f
	.long	0x62
	.long	.LLST13
	.uleb128 0x22
	.quad	.LVL47
	.long	0x1848
	.uleb128 0x23
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x3c
	.long	.LASF136
	.byte	0x3
	.byte	0x58
	.long	0x93
	.byte	0x3
	.long	0x1945
	.uleb128 0x3d
	.long	.LASF134
	.byte	0x3
	.byte	0x58
	.long	0x99
	.uleb128 0x3d
	.long	.LASF135
	.byte	0x3
	.byte	0x58
	.long	0x2d3
	.byte	0
	.uleb128 0x3c
	.long	.LASF137
	.byte	0x2
	.byte	0xfc
	.long	0x93
	.byte	0x3
	.long	0x1977
	.uleb128 0x3e
	.string	"__s"
	.byte	0x2
	.byte	0xfc
	.long	0x99
	.uleb128 0x3e
	.string	"__n"
	.byte	0x2
	.byte	0xfc
	.long	0x62
	.uleb128 0x3d
	.long	.LASF138
	.byte	0x2
	.byte	0xfc
	.long	0x618
	.byte	0
	.uleb128 0x3c
	.long	.LASF139
	.byte	0x2
	.byte	0x66
	.long	0x62
	.byte	0x3
	.long	0x1994
	.uleb128 0x3d
	.long	.LASF140
	.byte	0x2
	.byte	0x66
	.long	0x2d3
	.uleb128 0x3f
	.byte	0
	.uleb128 0x3c
	.long	.LASF141
	.byte	0x2
	.byte	0x5f
	.long	0x62
	.byte	0x3
	.long	0x19bc
	.uleb128 0x3d
	.long	.LASF138
	.byte	0x2
	.byte	0x5f
	.long	0x618
	.uleb128 0x3d
	.long	.LASF140
	.byte	0x2
	.byte	0x5f
	.long	0x2d3
	.uleb128 0x3f
	.byte	0
	.uleb128 0x40
	.long	.LASF142
	.long	.LASF142
	.byte	0x2
	.byte	0x57
	.uleb128 0x40
	.long	.LASF143
	.long	.LASF143
	.byte	0x2
	.byte	0x55
	.uleb128 0x40
	.long	.LASF144
	.long	.LASF144
	.byte	0xb
	.byte	0x9
	.uleb128 0x40
	.long	.LASF145
	.long	.LASF145
	.byte	0xb
	.byte	0xb
	.uleb128 0x40
	.long	.LASF146
	.long	.LASF146
	.byte	0xb
	.byte	0x15
	.uleb128 0x40
	.long	.LASF147
	.long	.LASF147
	.byte	0xb
	.byte	0x1b
	.uleb128 0x40
	.long	.LASF148
	.long	.LASF148
	.byte	0x8
	.byte	0xe8
	.uleb128 0x40
	.long	.LASF149
	.long	.LASF149
	.byte	0xa
	.byte	0x48
	.uleb128 0x40
	.long	.LASF150
	.long	.LASF150
	.byte	0x8
	.byte	0xc7
	.uleb128 0x41
	.long	.LASF151
	.long	.LASF151
	.byte	0xc
	.value	0x266
	.uleb128 0x42
	.long	.LASF170
	.long	.LASF170
	.uleb128 0x43
	.long	.LASF136
	.long	.LASF152
	.byte	0xd
	.byte	0
	.long	.LASF136
	.uleb128 0x43
	.long	.LASF137
	.long	.LASF153
	.byte	0x2
	.byte	0xf2
	.long	.LASF137
	.uleb128 0x41
	.long	.LASF154
	.long	.LASF154
	.byte	0xe
	.value	0x14f
	.uleb128 0x41
	.long	.LASF155
	.long	.LASF155
	.byte	0xc
	.value	0x21d
	.uleb128 0x41
	.long	.LASF156
	.long	.LASF156
	.byte	0xc
	.value	0x233
	.uleb128 0x41
	.long	.LASF157
	.long	.LASF157
	.byte	0xc
	.value	0x33b
	.uleb128 0x40
	.long	.LASF158
	.long	.LASF158
	.byte	0xe
	.byte	0x88
	.uleb128 0x43
	.long	.LASF159
	.long	.LASF160
	.byte	0xd
	.byte	0
	.long	.LASF159
	.uleb128 0x41
	.long	.LASF161
	.long	.LASF161
	.byte	0xc
	.value	0x21b
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2113
	.uleb128 0x18
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2113
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST76:
	.quad	.LVL224-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL227-.Ltext0
	.quad	.LVL250-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL250-.Ltext0
	.quad	.LVL252-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL252-.Ltext0
	.quad	.LFE53-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST77:
	.quad	.LVL224-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL226-.Ltext0
	.quad	.LVL251-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL251-.Ltext0
	.quad	.LVL252-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL252-.Ltext0
	.quad	.LFE53-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST78:
	.quad	.LVL225-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL243-.Ltext0
	.quad	.LVL244-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL244-.Ltext0
	.quad	.LVL249-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL252-.Ltext0
	.quad	.LVL258-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL258-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL259-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST79:
	.quad	.LVL237-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC14
	.byte	0x9f
	.quad	0
	.quad	0
.LLST80:
	.quad	.LVL238-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC15
	.byte	0x9f
	.quad	0
	.quad	0
.LLST81:
	.quad	.LVL239-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC16
	.byte	0x9f
	.quad	0
	.quad	0
.LLST82:
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC17
	.byte	0x9f
	.quad	0
	.quad	0
.LLST83:
	.quad	.LVL246-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC24
	.byte	0x9f
	.quad	0
	.quad	0
.LLST84:
	.quad	.LVL252-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC18
	.byte	0x9f
	.quad	0
	.quad	0
.LLST85:
	.quad	.LVL254-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC19
	.byte	0x9f
	.quad	0
	.quad	0
.LLST86:
	.quad	.LVL256-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC20
	.byte	0x9f
	.quad	0
	.quad	0
.LLST87:
	.quad	.LVL258-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC22
	.byte	0x9f
	.quad	0
	.quad	0
.LLST66:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL207-1-.Ltext0
	.quad	.LFE52-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST67:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL207-1-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST68:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL207-1-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL213-.Ltext0
	.quad	.LFE52-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST69:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL207-1-.Ltext0
	.quad	.LVL223-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL223-.Ltext0
	.quad	.LFE52-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST70:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL207-1-.Ltext0
	.quad	.LFE52-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -68
	.quad	0
	.quad	0
.LLST71:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL207-1-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL222-.Ltext0
	.quad	.LFE52-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.quad	0
	.quad	0
.LLST72:
	.quad	.LVL209-.Ltext0
	.quad	.LVL210-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL211-.Ltext0
	.quad	.LVL212-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST73:
	.quad	.LVL213-.Ltext0
	.quad	.LVL215-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL215-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST74:
	.quad	.LVL215-.Ltext0
	.quad	.LVL216-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC4
	.byte	0x9f
	.quad	0
	.quad	0
.LLST75:
	.quad	.LVL219-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC5
	.byte	0x9f
	.quad	0
	.quad	0
.LLST54:
	.quad	.LVL175-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL177-.Ltext0
	.quad	.LVL192-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL192-.Ltext0
	.quad	.LVL193-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL193-1-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL194-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL204-.Ltext0
	.quad	.LVL205-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL205-.Ltext0
	.quad	.LFE51-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST55:
	.quad	.LVL176-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	sbuf.3669
	.byte	0x9f
	.quad	.LVL194-.Ltext0
	.quad	.LVL195-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL195-.Ltext0
	.quad	.LVL200-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL200-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL205-.Ltext0
	.quad	.LFE51-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST56:
	.quad	.LVL191-.Ltext0
	.quad	.LVL192-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL194-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL203-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL205-.Ltext0
	.quad	.LFE51-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST57:
	.quad	.LVL189-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0xf
	.byte	0x3
	.quad	bindex.3668
	.byte	0x94
	.byte	0x4
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL190-.Ltext0
	.quad	.LVL192-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL194-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL205-.Ltext0
	.quad	.LFE51-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST58:
	.quad	.LVL183-.Ltext0
	.quad	.LVL188-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL194-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL197-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL205-.Ltext0
	.quad	.LFE51-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST59:
	.quad	.LVL178-.Ltext0
	.quad	.LVL181-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST60:
	.quad	.LVL179-.Ltext0
	.quad	.LVL181-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST61:
	.quad	.LVL179-.Ltext0
	.quad	.LVL180-.Ltext0
	.value	0x15
	.byte	0x75
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3666
	.byte	0x22
	.byte	0x9f
	.quad	.LVL180-.Ltext0
	.quad	.LVL182-.Ltext0
	.value	0x15
	.byte	0x73
	.sleb128 -1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3666
	.byte	0x22
	.byte	0x9f
	.quad	0
	.quad	0
.LLST62:
	.quad	.LVL184-.Ltext0
	.quad	.LVL188-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST63:
	.quad	.LVL184-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0x15
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3666
	.byte	0x22
	.byte	0x9f
	.quad	.LVL185-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x15
	.byte	0x75
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3666
	.byte	0x22
	.byte	0x9f
	.quad	.LVL186-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x15
	.byte	0x73
	.sleb128 -1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3666
	.byte	0x22
	.byte	0x9f
	.quad	.LVL187-.Ltext0
	.quad	.LVL188-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL188-1-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x15
	.byte	0x73
	.sleb128 -1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3666
	.byte	0x22
	.byte	0x9f
	.quad	0
	.quad	0
.LLST64:
	.quad	.LVL197-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST65:
	.quad	.LVL197-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST50:
	.quad	.LVL168-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL171-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL173-.Ltext0
	.quad	.LVL174-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST51:
	.quad	.LVL169-.Ltext0
	.quad	.LVL170-1-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	infile
	.quad	0
	.quad	0
.LLST52:
	.quad	.LVL169-.Ltext0
	.quad	.LVL170-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x400
	.byte	0x9f
	.quad	0
	.quad	0
.LLST53:
	.quad	.LVL169-.Ltext0
	.quad	.LVL170-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	buf
	.byte	0x9f
	.quad	0
	.quad	0
.LLST45:
	.quad	.LVL160-.Ltext0
	.quad	.LVL161-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL161-1-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL165-.Ltext0
	.quad	.LFE48-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST46:
	.quad	.LVL160-.Ltext0
	.quad	.LVL161-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL161-1-.Ltext0
	.quad	.LVL163-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL163-.Ltext0
	.quad	.LFE48-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST47:
	.quad	.LVL160-.Ltext0
	.quad	.LVL161-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL161-1-.Ltext0
	.quad	.LFE48-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST48:
	.quad	.LVL160-.Ltext0
	.quad	.LVL161-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL161-1-.Ltext0
	.quad	.LVL166-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL166-.Ltext0
	.quad	.LFE48-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST49:
	.quad	.LVL162-.Ltext0
	.quad	.LVL164-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL127-.Ltext0
	.quad	.LVL129-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL129-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL153-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL155-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL128-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL149-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL154-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL155-.Ltext0
	.quad	.LVL159-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL159-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL133-.Ltext0
	.quad	.LVL145-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL146-.Ltext0
	.quad	.LVL148-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST41:
	.quad	.LVL131-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL133-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL155-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL156-.Ltext0
	.quad	.LVL158-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL158-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST42:
	.quad	.LVL132-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL133-.Ltext0
	.quad	.LVL143-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL143-.Ltext0
	.quad	.LVL144-.Ltext0
	.value	0x3
	.byte	0x7a
	.sleb128 1
	.byte	0x9f
	.quad	.LVL145-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL155-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL158-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST43:
	.quad	.LVL136-.Ltext0
	.quad	.LVL137-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL137-.Ltext0
	.quad	.LVL139-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL139-.Ltext0
	.quad	.LVL140-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL140-.Ltext0
	.quad	.LVL141-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL141-.Ltext0
	.quad	.LVL142-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL149-.Ltext0
	.quad	.LVL150-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL159-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST44:
	.quad	.LVL131-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL133-.Ltext0
	.quad	.LVL137-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL137-.Ltext0
	.quad	.LVL138-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL138-.Ltext0
	.quad	.LVL148-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL155-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL158-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL106-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL108-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL116-.Ltext0
	.quad	.LVL118-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL118-.Ltext0
	.quad	.LVL121-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL121-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL122-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL123-.Ltext0
	.quad	.LFE45-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL106-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL108-.Ltext0
	.quad	.LVL117-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL117-.Ltext0
	.quad	.LVL118-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL118-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL122-.Ltext0
	.quad	.LVL124-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL124-1-.Ltext0
	.quad	.LFE45-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL107-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL108-.Ltext0
	.quad	.LVL109-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL109-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL113-.Ltext0
	.quad	.LVL114-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL115-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL118-.Ltext0
	.quad	.LVL120-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL120-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL122-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL123-.Ltext0
	.quad	.LVL126-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL126-.Ltext0
	.quad	.LFE45-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST35:
	.quad	.LVL107-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL108-.Ltext0
	.quad	.LVL109-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL109-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL112-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL118-.Ltext0
	.quad	.LVL120-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL120-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL122-.Ltext0
	.quad	.LFE45-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL108-.Ltext0
	.quad	.LVL109-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL110-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL118-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL119-.Ltext0
	.quad	.LVL120-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL91-.Ltext0
	.quad	.LVL93-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL93-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL102-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL103-.Ltext0
	.quad	.LVL105-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL105-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL91-.Ltext0
	.quad	.LVL93-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL93-.Ltext0
	.quad	.LVL101-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL101-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL103-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL92-.Ltext0
	.quad	.LVL93-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL93-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL99-.Ltext0
	.quad	.LVL100-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL103-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL94-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL103-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL79-.Ltext0
	.quad	.LVL81-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL81-.Ltext0
	.quad	.LVL83-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL83-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL85-.Ltext0
	.quad	.LVL86-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL86-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL89-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL79-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL80-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL84-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL85-.Ltext0
	.quad	.LVL87-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL87-1-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL70-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL71-1-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL75-.Ltext0
	.quad	.LVL76-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL76-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL72-.Ltext0
	.quad	.LVL74-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL76-.Ltext0
	.quad	.LVL77-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL73-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL73-.Ltext0
	.quad	.LVL74-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL76-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL21-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL22-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL33-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL21-.Ltext0
	.quad	.LVL24-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL24-.Ltext0
	.quad	.LVL27-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL28-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL33-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL23-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	.LVL25-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL30-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	.LVL33-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL12-.Ltext0
	.quad	.LFE40-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL11-.Ltext0
	.quad	.LVL14-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL14-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL20-.Ltext0
	.quad	.LFE40-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL13-.Ltext0
	.quad	.LVL15-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	.LVL15-.Ltext0
	.quad	.LVL18-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL18-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	.LVL20-.Ltext0
	.quad	.LFE40-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	0
	.quad	0
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL1-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL3-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL6-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL10-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL2-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	.LVL4-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL8-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	.LVL10-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL58-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL59-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL65-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.quad	.LVL66-.Ltext0
	.quad	.LFE38-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL61-.Ltext0
	.quad	.LVL62-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL62-1-.Ltext0
	.quad	.LVL64-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL64-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL66-.Ltext0
	.quad	.LFE38-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL62-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL66-.Ltext0
	.quad	.LVL68-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL67-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL35-.Ltext0
	.quad	.LVL36-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL36-.Ltext0
	.quad	.LVL37-1-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	tsize
	.quad	.LVL37-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL38-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL41-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL50-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL51-1-.Ltext0
	.quad	.LVL57-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL57-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL51-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL53-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.quad	.LVL55-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL51-.Ltext0
	.quad	.LVL52-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL43-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL45-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL49-.Ltext0
	.quad	.LFE34-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL44-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL45-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB49-.Ltext0
	.quad	.LBE49-.Ltext0
	.quad	.LBB51-.Ltext0
	.quad	.LBE51-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB52-.Ltext0
	.quad	.LBE52-.Ltext0
	.quad	.LBB54-.Ltext0
	.quad	.LBE54-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF79:
	.string	"htable"
.LASF122:
	.string	"last"
.LASF31:
	.string	"_shortbuf"
.LASF165:
	.string	"_IO_lock_t"
.LASF52:
	.string	"stderr"
.LASF162:
	.string	"GNU C11 7.4.0 -msse4 -mfpmath=sse -m64 -mtune=generic -march=x86-64 -g -O1 -fno-inline -fno-optimize-sibling-calls -fstack-protector-strong"
.LASF20:
	.string	"_IO_buf_end"
.LASF152:
	.string	"__builtin_strcpy"
.LASF65:
	.string	"mcnt"
.LASF85:
	.string	"find_ele_fun_set"
.LASF106:
	.string	"bindex"
.LASF18:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF77:
	.string	"next"
.LASF12:
	.string	"_flags"
.LASF109:
	.string	"index"
.LASF24:
	.string	"_markers"
.LASF160:
	.string	"__builtin_fwrite"
.LASF100:
	.string	"lower_fun"
.LASF129:
	.string	"h_mod"
.LASF93:
	.string	"hash_fun_index"
.LASF95:
	.string	"find_fun_index"
.LASF155:
	.string	"calloc"
.LASF67:
	.string	"mstring"
.LASF84:
	.string	"find_ele_fun_t"
.LASF59:
	.string	"__timezone"
.LASF46:
	.string	"_pos"
.LASF103:
	.string	"get_token"
.LASF51:
	.string	"stdout"
.LASF72:
	.string	"lower_fun_set"
.LASF23:
	.string	"_IO_save_end"
.LASF97:
	.string	"quick"
.LASF164:
	.string	"/nfs/student/a/alhill/cs341/gprof"
.LASF161:
	.string	"malloc"
.LASF167:
	.string	"skipchar"
.LASF126:
	.string	"result"
.LASF56:
	.string	"long long unsigned int"
.LASF71:
	.string	"lower_fun_t"
.LASF54:
	.string	"sys_errlist"
.LASF22:
	.string	"_IO_backup_base"
.LASF33:
	.string	"_offset"
.LASF53:
	.string	"sys_nerr"
.LASF125:
	.string	"save_string"
.LASF134:
	.string	"__dest"
.LASF141:
	.string	"fprintf"
.LASF26:
	.string	"_fileno"
.LASF110:
	.string	"word_freq"
.LASF124:
	.string	"find_ele_rec"
.LASF7:
	.string	"size_t"
.LASF147:
	.string	"show_options"
.LASF15:
	.string	"_IO_read_base"
.LASF89:
	.string	"argc"
.LASF50:
	.string	"stdin"
.LASF119:
	.string	"ele1"
.LASF120:
	.string	"ele2"
.LASF44:
	.string	"_next"
.LASF156:
	.string	"free"
.LASF76:
	.string	"freq"
.LASF140:
	.string	"__fmt"
.LASF149:
	.string	"clock"
.LASF114:
	.string	"sort_words"
.LASF144:
	.string	"add_int_option"
.LASF88:
	.string	"infile"
.LASF138:
	.string	"__stream"
.LASF66:
	.string	"scnt"
.LASF11:
	.string	"char"
.LASF143:
	.string	"__fprintf_chk"
.LASF39:
	.string	"_mode"
.LASF58:
	.string	"__daylight"
.LASF133:
	.string	"lower1"
.LASF132:
	.string	"lower2"
.LASF60:
	.string	"tzname"
.LASF43:
	.string	"_IO_marker"
.LASF157:
	.string	"qsort"
.LASF13:
	.string	"_IO_read_ptr"
.LASF151:
	.string	"exit"
.LASF68:
	.string	"llen"
.LASF158:
	.string	"strcmp"
.LASF107:
	.string	"sbuf"
.LASF83:
	.string	"hash_fun_names"
.LASF70:
	.string	"lcnt"
.LASF16:
	.string	"_IO_write_base"
.LASF168:
	.string	"new_ele"
.LASF47:
	.string	"_IO_2_1_stdin_"
.LASF55:
	.string	"long long int"
.LASF139:
	.string	"printf"
.LASF48:
	.string	"_IO_2_1_stdout_"
.LASF118:
	.string	"vele2"
.LASF21:
	.string	"_IO_save_base"
.LASF127:
	.string	"h_xor"
.LASF163:
	.string	"dictionary.c"
.LASF80:
	.string	"tsize"
.LASF142:
	.string	"__printf_chk"
.LASF94:
	.string	"lower_fun_index"
.LASF74:
	.string	"HELE"
.LASF135:
	.string	"__src"
.LASF104:
	.string	"token_buf"
.LASF113:
	.string	"insert_string"
.LASF92:
	.string	"size"
.LASF64:
	.string	"ucnt"
.LASF34:
	.string	"__pad1"
.LASF35:
	.string	"__pad2"
.LASF36:
	.string	"__pad3"
.LASF37:
	.string	"__pad4"
.LASF38:
	.string	"__pad5"
.LASF123:
	.string	"find_ele_iter_f"
.LASF10:
	.string	"__clock_t"
.LASF98:
	.string	"fname"
.LASF121:
	.string	"find_ele_iter_r"
.LASF148:
	.string	"fopen"
.LASF30:
	.string	"_vtable_offset"
.LASF111:
	.string	"get_word"
.LASF101:
	.string	"find_ele_fun"
.LASF69:
	.string	"lstring"
.LASF137:
	.string	"fgets"
.LASF115:
	.string	"array"
.LASF90:
	.string	"argv"
.LASF87:
	.string	"bufvalid"
.LASF62:
	.string	"timezone"
.LASF128:
	.string	"h_add"
.LASF131:
	.string	"Strlen"
.LASF78:
	.string	"h_ptr"
.LASF14:
	.string	"_IO_read_end"
.LASF5:
	.string	"short int"
.LASF6:
	.string	"long int"
.LASF130:
	.string	"wlen"
.LASF170:
	.string	"__stack_chk_fail"
.LASF169:
	.string	"new_table"
.LASF117:
	.string	"vele1"
.LASF63:
	.string	"wcnt"
.LASF75:
	.string	"word"
.LASF150:
	.string	"fclose"
.LASF96:
	.string	"ngram"
.LASF145:
	.string	"add_string_option"
.LASF166:
	.string	"_IO_FILE_plus"
.LASF99:
	.string	"hash_fun"
.LASF153:
	.string	"__fgets_alias"
.LASF32:
	.string	"_lock"
.LASF112:
	.string	"init_token"
.LASF0:
	.string	"long unsigned int"
.LASF28:
	.string	"_old_offset"
.LASF42:
	.string	"_IO_FILE"
.LASF86:
	.string	"find_ele_fun_names"
.LASF1:
	.string	"unsigned char"
.LASF108:
	.string	"nextpos"
.LASF57:
	.string	"__tzname"
.LASF45:
	.string	"_sbuf"
.LASF73:
	.string	"lower_fun_names"
.LASF17:
	.string	"_IO_write_ptr"
.LASF105:
	.string	"first"
.LASF136:
	.string	"strcpy"
.LASF154:
	.string	"strtok"
.LASF61:
	.string	"daylight"
.LASF159:
	.string	"fwrite"
.LASF8:
	.string	"__off_t"
.LASF91:
	.string	"verbose"
.LASF146:
	.string	"parse_options"
.LASF116:
	.string	"compare_ele"
.LASF4:
	.string	"signed char"
.LASF2:
	.string	"short unsigned int"
.LASF102:
	.string	"main"
.LASF81:
	.string	"hash_fun_t"
.LASF25:
	.string	"_chain"
.LASF41:
	.string	"FILE"
.LASF82:
	.string	"hash_fun_set"
.LASF27:
	.string	"_flags2"
.LASF29:
	.string	"_cur_column"
.LASF49:
	.string	"_IO_2_1_stderr_"
.LASF9:
	.string	"__off64_t"
.LASF40:
	.string	"_unused2"
.LASF19:
	.string	"_IO_buf_base"
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
