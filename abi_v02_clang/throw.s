	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	__Z5raisev
	.p2align	4, 0x90
__Z5raisev:                             ## @_Z5raisev
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

	.globl	__Z18try_but_dont_catchv
	.p2align	4, 0x90
__Z18try_but_dont_catchv:               ## @_Z18try_but_dont_catchv
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## BB#0:
	pushq	%rbp
Lcfi3:
	.cfi_def_cfa_offset 16
Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi5:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
Ltmp0:
	callq	__Z5raisev
Ltmp1:
	jmp	LBB1_1
LBB1_1:
	jmp	LBB1_6
LBB1_2:
Ltmp2:
	movl	%edx, %ecx
	movq	%rax, -8(%rbp)
	movl	%ecx, -12(%rbp)
## BB#3:
	movl	-12(%rbp), %eax
	movl	$1, %ecx
	cmpl	%ecx, %eax
	jne	LBB1_9
## BB#4:
	movq	-8(%rbp), %rdi
	callq	___cxa_begin_catch
	movq	%rax, -24(%rbp)
Ltmp3:
	leaq	L_.str(%rip), %rdi
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movb	%dl, %al
	callq	_printf
Ltmp4:
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	jmp	LBB1_5
LBB1_5:
	callq	___cxa_end_catch
LBB1_6:
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	addq	$48, %rsp
	popq	%rbp
	retq
LBB1_7:
Ltmp5:
	movl	%edx, %ecx
	movq	%rax, -8(%rbp)
	movl	%ecx, -12(%rbp)
Ltmp6:
	callq	___cxa_end_catch
Ltmp7:
	jmp	LBB1_8
LBB1_8:
	jmp	LBB1_9
LBB1_9:
	movq	-8(%rbp), %rdi
	callq	__Unwind_Resume
LBB1_10:
Ltmp8:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -36(%rbp)         ## 4-byte Spill
	callq	___clang_call_terminate
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table1:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\334"                  ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	78                      ## Call site table length
Lset0 = Ltmp0-Lfunc_begin0              ## >> Call Site 1 <<
	.long	Lset0
Lset1 = Ltmp1-Ltmp0                     ##   Call between Ltmp0 and Ltmp1
	.long	Lset1
Lset2 = Ltmp2-Lfunc_begin0              ##     jumps to Ltmp2
	.long	Lset2
	.byte	1                       ##   On action: 1
Lset3 = Ltmp1-Lfunc_begin0              ## >> Call Site 2 <<
	.long	Lset3
Lset4 = Ltmp3-Ltmp1                     ##   Call between Ltmp1 and Ltmp3
	.long	Lset4
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset5 = Ltmp3-Lfunc_begin0              ## >> Call Site 3 <<
	.long	Lset5
Lset6 = Ltmp4-Ltmp3                     ##   Call between Ltmp3 and Ltmp4
	.long	Lset6
Lset7 = Ltmp5-Lfunc_begin0              ##     jumps to Ltmp5
	.long	Lset7
	.byte	0                       ##   On action: cleanup
Lset8 = Ltmp4-Lfunc_begin0              ## >> Call Site 4 <<
	.long	Lset8
Lset9 = Ltmp6-Ltmp4                     ##   Call between Ltmp4 and Ltmp6
	.long	Lset9
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset10 = Ltmp6-Lfunc_begin0             ## >> Call Site 5 <<
	.long	Lset10
Lset11 = Ltmp7-Ltmp6                    ##   Call between Ltmp6 and Ltmp7
	.long	Lset11
Lset12 = Ltmp8-Lfunc_begin0             ##     jumps to Ltmp8
	.long	Lset12
	.byte	3                       ##   On action: 2
Lset13 = Ltmp7-Lfunc_begin0             ## >> Call Site 6 <<
	.long	Lset13
Lset14 = Lfunc_end0-Ltmp7               ##   Call between Ltmp7 and Lfunc_end0
	.long	Lset14
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.byte	2                       ## >> Action Record 2 <<
                                        ##   Catch TypeInfo 2
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 2
	.long	__ZTI14Fake_Exception@GOTPCREL+4 ## TypeInfo 1
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	___clang_call_terminate
	.globl	___clang_call_terminate
	.weak_definition	___clang_call_terminate
	.p2align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## BB#0:
	pushq	%rax
	callq	___cxa_begin_catch
	movq	%rax, (%rsp)            ## 8-byte Spill
	callq	__ZSt9terminatev

	.globl	__Z7catchitv
	.p2align	4, 0x90
__Z7catchitv:                           ## @_Z7catchitv
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## BB#0:
	pushq	%rbp
Lcfi6:
	.cfi_def_cfa_offset 16
Lcfi7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi8:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
Ltmp9:
	callq	__Z18try_but_dont_catchv
Ltmp10:
	jmp	LBB3_1
LBB3_1:
	jmp	LBB3_6
LBB3_2:
Ltmp11:
	movl	%edx, %ecx
	movq	%rax, -8(%rbp)
	movl	%ecx, -12(%rbp)
## BB#3:
	movl	-12(%rbp), %eax
	movl	$2, %ecx
	cmpl	%ecx, %eax
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	jne	LBB3_7
## BB#4:
	movq	-8(%rbp), %rdi
	callq	___cxa_begin_catch
	movq	%rax, -32(%rbp)
Ltmp17:
	leaq	L_.str.2(%rip), %rdi
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movb	%dl, %al
	callq	_printf
Ltmp18:
	movl	%eax, -40(%rbp)         ## 4-byte Spill
	jmp	LBB3_5
LBB3_5:
	callq	___cxa_end_catch
LBB3_6:
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	addq	$64, %rsp
	popq	%rbp
	retq
LBB3_7:
	movl	$1, %eax
	movl	-36(%rbp), %ecx         ## 4-byte Reload
	cmpl	%eax, %ecx
	jne	LBB3_14
## BB#8:
	movq	-8(%rbp), %rdi
	callq	___cxa_begin_catch
	movq	%rax, -24(%rbp)
Ltmp12:
	leaq	L_.str(%rip), %rdi
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movb	%dl, %al
	callq	_printf
Ltmp13:
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	jmp	LBB3_9
LBB3_9:
	callq	___cxa_end_catch
	jmp	LBB3_6
LBB3_10:
Ltmp14:
	movl	%edx, %ecx
	movq	%rax, -8(%rbp)
	movl	%ecx, -12(%rbp)
Ltmp15:
	callq	___cxa_end_catch
Ltmp16:
	jmp	LBB3_11
LBB3_11:
	jmp	LBB3_14
LBB3_12:
Ltmp19:
	movl	%edx, %ecx
	movq	%rax, -8(%rbp)
	movl	%ecx, -12(%rbp)
Ltmp20:
	callq	___cxa_end_catch
Ltmp21:
	jmp	LBB3_13
LBB3_13:
	jmp	LBB3_14
LBB3_14:
	movq	-8(%rbp), %rdi
	callq	__Unwind_Resume
LBB3_15:
Ltmp22:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -52(%rbp)         ## 4-byte Spill
	callq	___clang_call_terminate
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table3:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\374"                  ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	104                     ## Call site table length
Lset15 = Ltmp9-Lfunc_begin1             ## >> Call Site 1 <<
	.long	Lset15
Lset16 = Ltmp10-Ltmp9                   ##   Call between Ltmp9 and Ltmp10
	.long	Lset16
Lset17 = Ltmp11-Lfunc_begin1            ##     jumps to Ltmp11
	.long	Lset17
	.byte	3                       ##   On action: 2
Lset18 = Ltmp10-Lfunc_begin1            ## >> Call Site 2 <<
	.long	Lset18
Lset19 = Ltmp17-Ltmp10                  ##   Call between Ltmp10 and Ltmp17
	.long	Lset19
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset20 = Ltmp17-Lfunc_begin1            ## >> Call Site 3 <<
	.long	Lset20
Lset21 = Ltmp18-Ltmp17                  ##   Call between Ltmp17 and Ltmp18
	.long	Lset21
Lset22 = Ltmp19-Lfunc_begin1            ##     jumps to Ltmp19
	.long	Lset22
	.byte	0                       ##   On action: cleanup
Lset23 = Ltmp18-Lfunc_begin1            ## >> Call Site 4 <<
	.long	Lset23
Lset24 = Ltmp12-Ltmp18                  ##   Call between Ltmp18 and Ltmp12
	.long	Lset24
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset25 = Ltmp12-Lfunc_begin1            ## >> Call Site 5 <<
	.long	Lset25
Lset26 = Ltmp13-Ltmp12                  ##   Call between Ltmp12 and Ltmp13
	.long	Lset26
Lset27 = Ltmp14-Lfunc_begin1            ##     jumps to Ltmp14
	.long	Lset27
	.byte	0                       ##   On action: cleanup
Lset28 = Ltmp13-Lfunc_begin1            ## >> Call Site 6 <<
	.long	Lset28
Lset29 = Ltmp15-Ltmp13                  ##   Call between Ltmp13 and Ltmp15
	.long	Lset29
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset30 = Ltmp15-Lfunc_begin1            ## >> Call Site 7 <<
	.long	Lset30
Lset31 = Ltmp21-Ltmp15                  ##   Call between Ltmp15 and Ltmp21
	.long	Lset31
Lset32 = Ltmp22-Lfunc_begin1            ##     jumps to Ltmp22
	.long	Lset32
	.byte	5                       ##   On action: 3
Lset33 = Ltmp21-Lfunc_begin1            ## >> Call Site 8 <<
	.long	Lset33
Lset34 = Lfunc_end1-Ltmp21              ##   Call between Ltmp21 and Lfunc_end1
	.long	Lset34
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.byte	2                       ## >> Action Record 2 <<
                                        ##   Catch TypeInfo 2
	.byte	125                     ##   Continue to action 1
	.byte	3                       ## >> Action Record 3 <<
                                        ##   Catch TypeInfo 3
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 3
	.long	__ZTI9Exception@GOTPCREL+4 ## TypeInfo 2
	.long	__ZTI14Fake_Exception@GOTPCREL+4 ## TypeInfo 1
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	_seppuku
	.p2align	4, 0x90
_seppuku:                               ## @seppuku
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi9:
	.cfi_def_cfa_offset 16
Lcfi10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi11:
	.cfi_def_cfa_register %rbp
	callq	__Z7catchitv
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__const
	.globl	__ZTS9Exception         ## @_ZTS9Exception
	.weak_definition	__ZTS9Exception
__ZTS9Exception:
	.asciz	"9Exception"

	.section	__DATA,__data
	.globl	__ZTI9Exception         ## @_ZTI9Exception
	.weak_definition	__ZTI9Exception
	.p2align	3
__ZTI9Exception:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTS9Exception

	.section	__TEXT,__const
	.globl	__ZTS14Fake_Exception   ## @_ZTS14Fake_Exception
	.weak_definition	__ZTS14Fake_Exception
	.p2align	4
__ZTS14Fake_Exception:
	.asciz	"14Fake_Exception"

	.section	__DATA,__data
	.globl	__ZTI14Fake_Exception   ## @_ZTI14Fake_Exception
	.weak_definition	__ZTI14Fake_Exception
	.p2align	3
__ZTI14Fake_Exception:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTS14Fake_Exception

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Running try_but_dont_catch::catch(Fake_Exception)\n"

L_.str.1:                               ## @.str.1
	.asciz	"try_but_dont_catch handled an exception and resumed execution"

L_.str.2:                               ## @.str.2
	.asciz	"Running try_but_dont_catch::catch(Exception)\n"

L_.str.3:                               ## @.str.3
	.asciz	"catchit handled an exception and resumed execution"


.subsections_via_symbols
