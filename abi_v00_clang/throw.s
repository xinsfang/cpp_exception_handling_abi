	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_seppuku
	.p2align	4, 0x90
_seppuku:                               ## @seppuku
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$1, %eax
	movl	%eax, %edi
	callq	___cxa_allocate_exception
	movq	__ZTI9Exception@GOTPCREL(%rip), %rdi
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movq	%rdi, -8(%rbp)          ## 8-byte Spill
	movq	%rax, %rdi
	movq	-8(%rbp), %rsi          ## 8-byte Reload
	callq	___cxa_throw
	.cfi_endproc

	.section	__TEXT,__const
	.globl	__ZTS9Exception         ## @_ZTS9Exception
	.weak_definition	__ZTS9Exception
__ZTS9Exception: ## typeinfo name for Exception
	.asciz	"9Exception"

	.section	__DATA,__data
	.globl	__ZTI9Exception         ## @_ZTI9Exception
	.weak_definition	__ZTI9Exception
	.p2align	3
__ZTI9Exception: ## typeinfo for Exception
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTS9Exception


.subsections_via_symbols
