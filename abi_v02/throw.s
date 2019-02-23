	.file	"throw.cpp"
	.text
	.globl	_Z5raisev
	.type	_Z5raisev, @function
_Z5raisev:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$1, %edi
	call	__cxa_allocate_exception
	movl	$0, %edx
	movl	$_ZTI9Exception, %esi
	movq	%rax, %rdi
	call	__cxa_throw
	.cfi_endproc
.LFE0:
	.size	_Z5raisev, .-_Z5raisev
	.section	.rodata
	.align 8
.LC0:
	.string	"try_but_dont_catch handled an exception and resumed execution"
	.align 8
.LC1:
	.string	"Running try_but_dont_catch::catch(Fake_Exception)"
	.text
	.globl	_Z18try_but_dont_catchv
	.type	_Z18try_but_dont_catchv, @function
_Z18try_but_dont_catchv:
.LFB1:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
.LEHB0:
	call	_Z5raisev
.LEHE0:
.L6:
	movl	$.LC0, %edi
	movl	$0, %eax
.LEHB1:
	call	printf
	jmp	.L10
.L8:
	cmpq	$1, %rdx
	je	.L5
	movq	%rax, %rdi
	call	_Unwind_Resume
.LEHE1:
.L5:
	movq	%rax, %rdi
	call	__cxa_begin_catch
	movq	%rax, -24(%rbp)
	movl	$.LC1, %edi
.LEHB2:
	call	puts
.LEHE2:
	call	__cxa_end_catch
	jmp	.L6
.L9:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB3:
	call	_Unwind_Resume
.LEHE3:
.L10:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
# local frame entry
.LFE1:
        # a header to declare we're going to use __gxx_personality_v0 as a global
	.globl	__gxx_personality_v0
        # let the linker know we're going to declaring stuff for the .gcc_except_table section.
	.section	.gcc_except_table,"a",@progbits
	.align 4
# local (to the translation unit, the .o file) LSDA
.LLSDA1:
	#this declares the encoding type.
	.byte	0xff
	#this specifies the landing pads start; if zero, the func's ptr is assuumed (_Unwid_GetRegionStart)
	.byte	0x3
	#length of the LSDA: LLSDATT1 and LLSDATD1 point to the end and beginning of the LSDA, respectively.
	.uleb128 .LLSDATT1-.LLSDATTD1
# local LSDA table header
.LLSDATTD1:
	# encoding of items in the landing pad table.
	.byte	0x1
	# The length of the call site table (i.e. the landing pads)
	.uleb128 .LLSDACSE1-.LLSDACSB1
# local LSDA call site table
.LLSDACSB1:
#struct lsda_call_site_entry {
#  size_t cs_start; //start of the IP range
#  size_t cs_len; //length of the IP range
#  size_t cs_lp; //landing pad address
#  size_t cs_action; //offset into action table
#};
	.uleb128 .LEHB0-.LFB1
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L8-.LFB1
	.uleb128 0x1
	.uleb128 .LEHB1-.LFB1
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB2-.LFB1
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L9-.LFB1
	.uleb128 0
	.uleb128 .LEHB3-.LFB1
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE1:
	.byte	0x1
	.byte	0
	.align 4
	.long	_ZTI14Fake_Exception
.LLSDATT1:
	.text
	.size	_Z18try_but_dont_catchv, .-_Z18try_but_dont_catchv
	.section	.rodata
	.align 8
.LC2:
	.string	"catchit handled an exception and resumed execution"
	.align 8
.LC3:
	.string	"Running try_but_dont_catch::catch(Exception)"
	.text
	.globl	_Z7catchitv
	.type	_Z7catchitv, @function
_Z7catchitv:
.LFB2:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA2
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
.LEHB4:
	call	_Z18try_but_dont_catchv
.LEHE4:
.L16:
	movl	$.LC2, %edi
	movl	$0, %eax
.LEHB5:
	call	printf
	jmp	.L22
.L19:
	cmpq	$1, %rdx
	je	.L14
	cmpq	$2, %rdx
	je	.L15
	movq	%rax, %rdi
	call	_Unwind_Resume
.LEHE5:
.L14:
	movq	%rax, %rdi
	call	__cxa_begin_catch
	movq	%rax, -32(%rbp)
	movl	$.LC3, %edi
.LEHB6:
	call	puts
.LEHE6:
	call	__cxa_end_catch
	jmp	.L16
.L15:
	movq	%rax, %rdi
	call	__cxa_begin_catch
	movq	%rax, -24(%rbp)
	movl	$.LC1, %edi
.LEHB7:
	call	puts
.LEHE7:
	call	__cxa_end_catch
	jmp	.L16
.L20:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB8:
	call	_Unwind_Resume
.L21:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume
.LEHE8:
.L22:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.section	.gcc_except_table
	.align 4
.LLSDA2:
	.byte	0xff
	.byte	0x3
	.uleb128 .LLSDATT2-.LLSDATTD2
.LLSDATTD2:
	.byte	0x1
	.uleb128 .LLSDACSE2-.LLSDACSB2
.LLSDACSB2:
	.uleb128 .LEHB4-.LFB2
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L19-.LFB2
	.uleb128 0x3
	.uleb128 .LEHB5-.LFB2
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB6-.LFB2
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L20-.LFB2
	.uleb128 0
	.uleb128 .LEHB7-.LFB2
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L21-.LFB2
	.uleb128 0
	.uleb128 .LEHB8-.LFB2
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
.LLSDACSE2:
	.byte	0x2
	.byte	0
	.byte	0x1
	.byte	0x7d
	.align 4
	.long	_ZTI14Fake_Exception
	.long	_ZTI9Exception
.LLSDATT2:
	.text
	.size	_Z7catchitv, .-_Z7catchitv
	.globl	seppuku
	.type	seppuku, @function
seppuku:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_Z7catchitv
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	seppuku, .-seppuku
	.weak	_ZTI14Fake_Exception
	.section	.rodata._ZTI14Fake_Exception,"aG",@progbits,_ZTI14Fake_Exception,comdat
	.align 8
	.type	_ZTI14Fake_Exception, @object
	.size	_ZTI14Fake_Exception, 16
_ZTI14Fake_Exception:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTS14Fake_Exception
	.weak	_ZTS14Fake_Exception
	.section	.rodata._ZTS14Fake_Exception,"aG",@progbits,_ZTS14Fake_Exception,comdat
	.align 16
	.type	_ZTS14Fake_Exception, @object
	.size	_ZTS14Fake_Exception, 17
_ZTS14Fake_Exception:
	.string	"14Fake_Exception"
	.weak	_ZTI9Exception
	.section	.rodata._ZTI9Exception,"aG",@progbits,_ZTI9Exception,comdat
	.align 8
	.type	_ZTI9Exception, @object
	.size	_ZTI9Exception, 16
_ZTI9Exception:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTS9Exception
	.weak	_ZTS9Exception
	.section	.rodata._ZTS9Exception,"aG",@progbits,_ZTS9Exception,comdat
	.align 8
	.type	_ZTS9Exception, @object
	.size	_ZTS9Exception, 11
_ZTS9Exception:
	.string	"9Exception"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
