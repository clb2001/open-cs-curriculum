
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400b88 <_init>:
  400b88:	48 83 ec 08          	sub    $0x8,%rsp
  400b8c:	48 8b 05 65 44 20 00 	mov    0x204465(%rip),%rax        # 604ff8 <__gmon_start__>
  400b93:	48 85 c0             	test   %rax,%rax
  400b96:	74 05                	je     400b9d <_init+0x15>
  400b98:	e8 13 02 00 00       	callq  400db0 <__gmon_start__@plt>
  400b9d:	48 83 c4 08          	add    $0x8,%rsp
  400ba1:	c3                   	retq   

Disassembly of section .plt:

0000000000400bb0 <.plt>:
  400bb0:	ff 35 52 44 20 00    	pushq  0x204452(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400bb6:	ff 25 54 44 20 00    	jmpq   *0x204454(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400bbc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400bc0 <__errno_location@plt>:
  400bc0:	ff 25 52 44 20 00    	jmpq   *0x204452(%rip)        # 605018 <__errno_location@GLIBC_2.2.5>
  400bc6:	68 00 00 00 00       	pushq  $0x0
  400bcb:	e9 e0 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400bd0 <srandom@plt>:
  400bd0:	ff 25 4a 44 20 00    	jmpq   *0x20444a(%rip)        # 605020 <srandom@GLIBC_2.2.5>
  400bd6:	68 01 00 00 00       	pushq  $0x1
  400bdb:	e9 d0 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400be0 <strncmp@plt>:
  400be0:	ff 25 42 44 20 00    	jmpq   *0x204442(%rip)        # 605028 <strncmp@GLIBC_2.2.5>
  400be6:	68 02 00 00 00       	pushq  $0x2
  400beb:	e9 c0 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400bf0 <strcpy@plt>:
  400bf0:	ff 25 3a 44 20 00    	jmpq   *0x20443a(%rip)        # 605030 <strcpy@GLIBC_2.2.5>
  400bf6:	68 03 00 00 00       	pushq  $0x3
  400bfb:	e9 b0 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c00 <puts@plt>:
  400c00:	ff 25 32 44 20 00    	jmpq   *0x204432(%rip)        # 605038 <puts@GLIBC_2.2.5>
  400c06:	68 04 00 00 00       	pushq  $0x4
  400c0b:	e9 a0 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c10 <write@plt>:
  400c10:	ff 25 2a 44 20 00    	jmpq   *0x20442a(%rip)        # 605040 <write@GLIBC_2.2.5>
  400c16:	68 05 00 00 00       	pushq  $0x5
  400c1b:	e9 90 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c20 <__stack_chk_fail@plt>:
  400c20:	ff 25 22 44 20 00    	jmpq   *0x204422(%rip)        # 605048 <__stack_chk_fail@GLIBC_2.4>
  400c26:	68 06 00 00 00       	pushq  $0x6
  400c2b:	e9 80 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c30 <mmap@plt>:
  400c30:	ff 25 1a 44 20 00    	jmpq   *0x20441a(%rip)        # 605050 <mmap@GLIBC_2.2.5>
  400c36:	68 07 00 00 00       	pushq  $0x7
  400c3b:	e9 70 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c40 <memset@plt>:
  400c40:	ff 25 12 44 20 00    	jmpq   *0x204412(%rip)        # 605058 <memset@GLIBC_2.2.5>
  400c46:	68 08 00 00 00       	pushq  $0x8
  400c4b:	e9 60 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c50 <alarm@plt>:
  400c50:	ff 25 0a 44 20 00    	jmpq   *0x20440a(%rip)        # 605060 <alarm@GLIBC_2.2.5>
  400c56:	68 09 00 00 00       	pushq  $0x9
  400c5b:	e9 50 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c60 <close@plt>:
  400c60:	ff 25 02 44 20 00    	jmpq   *0x204402(%rip)        # 605068 <close@GLIBC_2.2.5>
  400c66:	68 0a 00 00 00       	pushq  $0xa
  400c6b:	e9 40 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c70 <read@plt>:
  400c70:	ff 25 fa 43 20 00    	jmpq   *0x2043fa(%rip)        # 605070 <read@GLIBC_2.2.5>
  400c76:	68 0b 00 00 00       	pushq  $0xb
  400c7b:	e9 30 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c80 <__libc_start_main@plt>:
  400c80:	ff 25 f2 43 20 00    	jmpq   *0x2043f2(%rip)        # 605078 <__libc_start_main@GLIBC_2.2.5>
  400c86:	68 0c 00 00 00       	pushq  $0xc
  400c8b:	e9 20 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c90 <inet_addr@plt>:
  400c90:	ff 25 ea 43 20 00    	jmpq   *0x2043ea(%rip)        # 605080 <inet_addr@GLIBC_2.2.5>
  400c96:	68 0d 00 00 00       	pushq  $0xd
  400c9b:	e9 10 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400ca0 <signal@plt>:
  400ca0:	ff 25 e2 43 20 00    	jmpq   *0x2043e2(%rip)        # 605088 <signal@GLIBC_2.2.5>
  400ca6:	68 0e 00 00 00       	pushq  $0xe
  400cab:	e9 00 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400cb0 <strtol@plt>:
  400cb0:	ff 25 da 43 20 00    	jmpq   *0x2043da(%rip)        # 605090 <strtol@GLIBC_2.2.5>
  400cb6:	68 0f 00 00 00       	pushq  $0xf
  400cbb:	e9 f0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400cc0 <memcpy@plt>:
  400cc0:	ff 25 d2 43 20 00    	jmpq   *0x2043d2(%rip)        # 605098 <memcpy@GLIBC_2.14>
  400cc6:	68 10 00 00 00       	pushq  $0x10
  400ccb:	e9 e0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400cd0 <time@plt>:
  400cd0:	ff 25 ca 43 20 00    	jmpq   *0x2043ca(%rip)        # 6050a0 <time@GLIBC_2.2.5>
  400cd6:	68 11 00 00 00       	pushq  $0x11
  400cdb:	e9 d0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400ce0 <random@plt>:
  400ce0:	ff 25 c2 43 20 00    	jmpq   *0x2043c2(%rip)        # 6050a8 <random@GLIBC_2.2.5>
  400ce6:	68 12 00 00 00       	pushq  $0x12
  400ceb:	e9 c0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400cf0 <_IO_getc@plt>:
  400cf0:	ff 25 ba 43 20 00    	jmpq   *0x2043ba(%rip)        # 6050b0 <_IO_getc@GLIBC_2.2.5>
  400cf6:	68 13 00 00 00       	pushq  $0x13
  400cfb:	e9 b0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d00 <__isoc99_sscanf@plt>:
  400d00:	ff 25 b2 43 20 00    	jmpq   *0x2043b2(%rip)        # 6050b8 <__isoc99_sscanf@GLIBC_2.7>
  400d06:	68 14 00 00 00       	pushq  $0x14
  400d0b:	e9 a0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d10 <munmap@plt>:
  400d10:	ff 25 aa 43 20 00    	jmpq   *0x2043aa(%rip)        # 6050c0 <munmap@GLIBC_2.2.5>
  400d16:	68 15 00 00 00       	pushq  $0x15
  400d1b:	e9 90 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d20 <__printf_chk@plt>:
  400d20:	ff 25 a2 43 20 00    	jmpq   *0x2043a2(%rip)        # 6050c8 <__printf_chk@GLIBC_2.3.4>
  400d26:	68 16 00 00 00       	pushq  $0x16
  400d2b:	e9 80 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d30 <fopen@plt>:
  400d30:	ff 25 9a 43 20 00    	jmpq   *0x20439a(%rip)        # 6050d0 <fopen@GLIBC_2.2.5>
  400d36:	68 17 00 00 00       	pushq  $0x17
  400d3b:	e9 70 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d40 <getopt@plt>:
  400d40:	ff 25 92 43 20 00    	jmpq   *0x204392(%rip)        # 6050d8 <getopt@GLIBC_2.2.5>
  400d46:	68 18 00 00 00       	pushq  $0x18
  400d4b:	e9 60 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d50 <strtoul@plt>:
  400d50:	ff 25 8a 43 20 00    	jmpq   *0x20438a(%rip)        # 6050e0 <strtoul@GLIBC_2.2.5>
  400d56:	68 19 00 00 00       	pushq  $0x19
  400d5b:	e9 50 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d60 <exit@plt>:
  400d60:	ff 25 82 43 20 00    	jmpq   *0x204382(%rip)        # 6050e8 <exit@GLIBC_2.2.5>
  400d66:	68 1a 00 00 00       	pushq  $0x1a
  400d6b:	e9 40 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d70 <connect@plt>:
  400d70:	ff 25 7a 43 20 00    	jmpq   *0x20437a(%rip)        # 6050f0 <connect@GLIBC_2.2.5>
  400d76:	68 1b 00 00 00       	pushq  $0x1b
  400d7b:	e9 30 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d80 <__fprintf_chk@plt>:
  400d80:	ff 25 72 43 20 00    	jmpq   *0x204372(%rip)        # 6050f8 <__fprintf_chk@GLIBC_2.3.4>
  400d86:	68 1c 00 00 00       	pushq  $0x1c
  400d8b:	e9 20 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d90 <__sprintf_chk@plt>:
  400d90:	ff 25 6a 43 20 00    	jmpq   *0x20436a(%rip)        # 605100 <__sprintf_chk@GLIBC_2.3.4>
  400d96:	68 1d 00 00 00       	pushq  $0x1d
  400d9b:	e9 10 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400da0 <socket@plt>:
  400da0:	ff 25 62 43 20 00    	jmpq   *0x204362(%rip)        # 605108 <socket@GLIBC_2.2.5>
  400da6:	68 1e 00 00 00       	pushq  $0x1e
  400dab:	e9 00 fe ff ff       	jmpq   400bb0 <.plt>

Disassembly of section .plt.got:

0000000000400db0 <__gmon_start__@plt>:
  400db0:	ff 25 42 42 20 00    	jmpq   *0x204242(%rip)        # 604ff8 <__gmon_start__>
  400db6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400dc0 <_start>:
  400dc0:	31 ed                	xor    %ebp,%ebp
  400dc2:	49 89 d1             	mov    %rdx,%r9
  400dc5:	5e                   	pop    %rsi
  400dc6:	48 89 e2             	mov    %rsp,%rdx
  400dc9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400dcd:	50                   	push   %rax
  400dce:	54                   	push   %rsp
  400dcf:	49 c7 c0 50 2c 40 00 	mov    $0x402c50,%r8
  400dd6:	48 c7 c1 e0 2b 40 00 	mov    $0x402be0,%rcx
  400ddd:	48 c7 c7 3c 10 40 00 	mov    $0x40103c,%rdi
  400de4:	e8 97 fe ff ff       	callq  400c80 <__libc_start_main@plt>
  400de9:	f4                   	hlt    
  400dea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400df0 <deregister_tm_clones>:
  400df0:	b8 97 54 60 00       	mov    $0x605497,%eax
  400df5:	55                   	push   %rbp
  400df6:	48 2d 90 54 60 00    	sub    $0x605490,%rax
  400dfc:	48 83 f8 0e          	cmp    $0xe,%rax
  400e00:	48 89 e5             	mov    %rsp,%rbp
  400e03:	76 1b                	jbe    400e20 <deregister_tm_clones+0x30>
  400e05:	b8 00 00 00 00       	mov    $0x0,%eax
  400e0a:	48 85 c0             	test   %rax,%rax
  400e0d:	74 11                	je     400e20 <deregister_tm_clones+0x30>
  400e0f:	5d                   	pop    %rbp
  400e10:	bf 90 54 60 00       	mov    $0x605490,%edi
  400e15:	ff e0                	jmpq   *%rax
  400e17:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400e1e:	00 00 
  400e20:	5d                   	pop    %rbp
  400e21:	c3                   	retq   
  400e22:	0f 1f 40 00          	nopl   0x0(%rax)
  400e26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e2d:	00 00 00 

0000000000400e30 <register_tm_clones>:
  400e30:	be 90 54 60 00       	mov    $0x605490,%esi
  400e35:	55                   	push   %rbp
  400e36:	48 81 ee 90 54 60 00 	sub    $0x605490,%rsi
  400e3d:	48 c1 fe 03          	sar    $0x3,%rsi
  400e41:	48 89 e5             	mov    %rsp,%rbp
  400e44:	48 89 f0             	mov    %rsi,%rax
  400e47:	48 c1 e8 3f          	shr    $0x3f,%rax
  400e4b:	48 01 c6             	add    %rax,%rsi
  400e4e:	48 d1 fe             	sar    %rsi
  400e51:	74 15                	je     400e68 <register_tm_clones+0x38>
  400e53:	b8 00 00 00 00       	mov    $0x0,%eax
  400e58:	48 85 c0             	test   %rax,%rax
  400e5b:	74 0b                	je     400e68 <register_tm_clones+0x38>
  400e5d:	5d                   	pop    %rbp
  400e5e:	bf 90 54 60 00       	mov    $0x605490,%edi
  400e63:	ff e0                	jmpq   *%rax
  400e65:	0f 1f 00             	nopl   (%rax)
  400e68:	5d                   	pop    %rbp
  400e69:	c3                   	retq   
  400e6a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e70 <__do_global_dtors_aux>:
  400e70:	80 3d 51 46 20 00 00 	cmpb   $0x0,0x204651(%rip)        # 6054c8 <completed.7594>
  400e77:	75 11                	jne    400e8a <__do_global_dtors_aux+0x1a>
  400e79:	55                   	push   %rbp
  400e7a:	48 89 e5             	mov    %rsp,%rbp
  400e7d:	e8 6e ff ff ff       	callq  400df0 <deregister_tm_clones>
  400e82:	5d                   	pop    %rbp
  400e83:	c6 05 3e 46 20 00 01 	movb   $0x1,0x20463e(%rip)        # 6054c8 <completed.7594>
  400e8a:	f3 c3                	repz retq 
  400e8c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400e90 <frame_dummy>:
  400e90:	bf 20 4e 60 00       	mov    $0x604e20,%edi
  400e95:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400e99:	75 05                	jne    400ea0 <frame_dummy+0x10>
  400e9b:	eb 93                	jmp    400e30 <register_tm_clones>
  400e9d:	0f 1f 00             	nopl   (%rax)
  400ea0:	b8 00 00 00 00       	mov    $0x0,%eax
  400ea5:	48 85 c0             	test   %rax,%rax
  400ea8:	74 f1                	je     400e9b <frame_dummy+0xb>
  400eaa:	55                   	push   %rbp
  400eab:	48 89 e5             	mov    %rsp,%rbp
  400eae:	ff d0                	callq  *%rax
  400eb0:	5d                   	pop    %rbp
  400eb1:	e9 7a ff ff ff       	jmpq   400e30 <register_tm_clones>

0000000000400eb6 <usage>:
  400eb6:	48 83 ec 08          	sub    $0x8,%rsp
  400eba:	48 89 fa             	mov    %rdi,%rdx
  400ebd:	83 3d 44 46 20 00 00 	cmpl   $0x0,0x204644(%rip)        # 605508 <is_checker>
  400ec4:	74 3e                	je     400f04 <usage+0x4e>
  400ec6:	be 68 2c 40 00       	mov    $0x402c68,%esi
  400ecb:	bf 01 00 00 00       	mov    $0x1,%edi
  400ed0:	b8 00 00 00 00       	mov    $0x0,%eax
  400ed5:	e8 46 fe ff ff       	callq  400d20 <__printf_chk@plt>
  400eda:	bf a0 2c 40 00       	mov    $0x402ca0,%edi
  400edf:	e8 1c fd ff ff       	callq  400c00 <puts@plt>
  400ee4:	bf a0 2d 40 00       	mov    $0x402da0,%edi
  400ee9:	e8 12 fd ff ff       	callq  400c00 <puts@plt>
  400eee:	bf c8 2c 40 00       	mov    $0x402cc8,%edi
  400ef3:	e8 08 fd ff ff       	callq  400c00 <puts@plt>
  400ef8:	bf ba 2d 40 00       	mov    $0x402dba,%edi
  400efd:	e8 fe fc ff ff       	callq  400c00 <puts@plt>
  400f02:	eb 32                	jmp    400f36 <usage+0x80>
  400f04:	be d6 2d 40 00       	mov    $0x402dd6,%esi
  400f09:	bf 01 00 00 00       	mov    $0x1,%edi
  400f0e:	b8 00 00 00 00       	mov    $0x0,%eax
  400f13:	e8 08 fe ff ff       	callq  400d20 <__printf_chk@plt>
  400f18:	bf f0 2c 40 00       	mov    $0x402cf0,%edi
  400f1d:	e8 de fc ff ff       	callq  400c00 <puts@plt>
  400f22:	bf 18 2d 40 00       	mov    $0x402d18,%edi
  400f27:	e8 d4 fc ff ff       	callq  400c00 <puts@plt>
  400f2c:	bf f4 2d 40 00       	mov    $0x402df4,%edi
  400f31:	e8 ca fc ff ff       	callq  400c00 <puts@plt>
  400f36:	bf 00 00 00 00       	mov    $0x0,%edi
  400f3b:	e8 20 fe ff ff       	callq  400d60 <exit@plt>

0000000000400f40 <initialize_target>:
  400f40:	55                   	push   %rbp
  400f41:	53                   	push   %rbx
  400f42:	48 81 ec 18 20 00 00 	sub    $0x2018,%rsp
  400f49:	89 f5                	mov    %esi,%ebp
  400f4b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400f52:	00 00 
  400f54:	48 89 84 24 08 20 00 	mov    %rax,0x2008(%rsp)
  400f5b:	00 
  400f5c:	31 c0                	xor    %eax,%eax
  400f5e:	89 3d 94 45 20 00    	mov    %edi,0x204594(%rip)        # 6054f8 <check_level>
  400f64:	8b 3d de 41 20 00    	mov    0x2041de(%rip),%edi        # 605148 <target_id>
  400f6a:	e8 4e 1c 00 00       	callq  402bbd <gencookie>
  400f6f:	89 05 8f 45 20 00    	mov    %eax,0x20458f(%rip)        # 605504 <cookie>
  400f75:	89 c7                	mov    %eax,%edi
  400f77:	e8 41 1c 00 00       	callq  402bbd <gencookie>
  400f7c:	89 05 7e 45 20 00    	mov    %eax,0x20457e(%rip)        # 605500 <authkey>
  400f82:	8b 05 c0 41 20 00    	mov    0x2041c0(%rip),%eax        # 605148 <target_id>
  400f88:	8d 78 01             	lea    0x1(%rax),%edi
  400f8b:	e8 40 fc ff ff       	callq  400bd0 <srandom@plt>
  400f90:	e8 4b fd ff ff       	callq  400ce0 <random@plt>
  400f95:	89 c7                	mov    %eax,%edi
  400f97:	e8 7a 02 00 00       	callq  401216 <scramble>
  400f9c:	89 c3                	mov    %eax,%ebx
  400f9e:	85 ed                	test   %ebp,%ebp
  400fa0:	74 18                	je     400fba <initialize_target+0x7a>
  400fa2:	bf 00 00 00 00       	mov    $0x0,%edi
  400fa7:	e8 24 fd ff ff       	callq  400cd0 <time@plt>
  400fac:	89 c7                	mov    %eax,%edi
  400fae:	e8 1d fc ff ff       	callq  400bd0 <srandom@plt>
  400fb3:	e8 28 fd ff ff       	callq  400ce0 <random@plt>
  400fb8:	eb 05                	jmp    400fbf <initialize_target+0x7f>
  400fba:	b8 00 00 00 00       	mov    $0x0,%eax
  400fbf:	01 c3                	add    %eax,%ebx
  400fc1:	0f b7 db             	movzwl %bx,%ebx
  400fc4:	8d 04 dd 00 01 00 00 	lea    0x100(,%rbx,8),%eax
  400fcb:	89 c0                	mov    %eax,%eax
  400fcd:	48 89 05 ac 44 20 00 	mov    %rax,0x2044ac(%rip)        # 605480 <buf_offset>
  400fd4:	c6 05 4d 51 20 00 72 	movb   $0x72,0x20514d(%rip)        # 606128 <target_prefix>
  400fdb:	83 3d a6 44 20 00 00 	cmpl   $0x0,0x2044a6(%rip)        # 605488 <notify>
  400fe2:	74 36                	je     40101a <initialize_target+0xda>
  400fe4:	83 3d 1d 45 20 00 00 	cmpl   $0x0,0x20451d(%rip)        # 605508 <is_checker>
  400feb:	75 2d                	jne    40101a <initialize_target+0xda>
  400fed:	48 89 e7             	mov    %rsp,%rdi
  400ff0:	e8 c1 19 00 00       	callq  4029b6 <init_driver>
  400ff5:	85 c0                	test   %eax,%eax
  400ff7:	79 21                	jns    40101a <initialize_target+0xda>
  400ff9:	48 89 e2             	mov    %rsp,%rdx
  400ffc:	be 48 2d 40 00       	mov    $0x402d48,%esi
  401001:	bf 01 00 00 00       	mov    $0x1,%edi
  401006:	b8 00 00 00 00       	mov    $0x0,%eax
  40100b:	e8 10 fd ff ff       	callq  400d20 <__printf_chk@plt>
  401010:	bf 08 00 00 00       	mov    $0x8,%edi
  401015:	e8 46 fd ff ff       	callq  400d60 <exit@plt>
  40101a:	48 8b 84 24 08 20 00 	mov    0x2008(%rsp),%rax
  401021:	00 
  401022:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401029:	00 00 
  40102b:	74 05                	je     401032 <initialize_target+0xf2>
  40102d:	e8 ee fb ff ff       	callq  400c20 <__stack_chk_fail@plt>
  401032:	48 81 c4 18 20 00 00 	add    $0x2018,%rsp
  401039:	5b                   	pop    %rbx
  40103a:	5d                   	pop    %rbp
  40103b:	c3                   	retq   

000000000040103c <main>:
  40103c:	41 56                	push   %r14
  40103e:	41 55                	push   %r13
  401040:	41 54                	push   %r12
  401042:	55                   	push   %rbp
  401043:	53                   	push   %rbx
  401044:	41 89 fc             	mov    %edi,%r12d
  401047:	48 89 f3             	mov    %rsi,%rbx
  40104a:	be 7e 1d 40 00       	mov    $0x401d7e,%esi
  40104f:	bf 0b 00 00 00       	mov    $0xb,%edi
  401054:	e8 47 fc ff ff       	callq  400ca0 <signal@plt>
  401059:	be 30 1d 40 00       	mov    $0x401d30,%esi
  40105e:	bf 07 00 00 00       	mov    $0x7,%edi
  401063:	e8 38 fc ff ff       	callq  400ca0 <signal@plt>
  401068:	be cc 1d 40 00       	mov    $0x401dcc,%esi
  40106d:	bf 04 00 00 00       	mov    $0x4,%edi
  401072:	e8 29 fc ff ff       	callq  400ca0 <signal@plt>
  401077:	83 3d 8a 44 20 00 00 	cmpl   $0x0,0x20448a(%rip)        # 605508 <is_checker>
  40107e:	74 20                	je     4010a0 <main+0x64>
  401080:	be 1a 1e 40 00       	mov    $0x401e1a,%esi
  401085:	bf 0e 00 00 00       	mov    $0xe,%edi
  40108a:	e8 11 fc ff ff       	callq  400ca0 <signal@plt>
  40108f:	bf 05 00 00 00       	mov    $0x5,%edi
  401094:	e8 b7 fb ff ff       	callq  400c50 <alarm@plt>
  401099:	bd 12 2e 40 00       	mov    $0x402e12,%ebp
  40109e:	eb 05                	jmp    4010a5 <main+0x69>
  4010a0:	bd 0d 2e 40 00       	mov    $0x402e0d,%ebp
  4010a5:	48 8b 05 f4 43 20 00 	mov    0x2043f4(%rip),%rax        # 6054a0 <stdin@@GLIBC_2.2.5>
  4010ac:	48 89 05 3d 44 20 00 	mov    %rax,0x20443d(%rip)        # 6054f0 <infile>
  4010b3:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  4010b9:	41 be 00 00 00 00    	mov    $0x0,%r14d
  4010bf:	e9 c6 00 00 00       	jmpq   40118a <main+0x14e>
  4010c4:	83 e8 61             	sub    $0x61,%eax
  4010c7:	3c 10                	cmp    $0x10,%al
  4010c9:	0f 87 9c 00 00 00    	ja     40116b <main+0x12f>
  4010cf:	0f b6 c0             	movzbl %al,%eax
  4010d2:	ff 24 c5 58 2e 40 00 	jmpq   *0x402e58(,%rax,8)
  4010d9:	48 8b 3b             	mov    (%rbx),%rdi
  4010dc:	e8 d5 fd ff ff       	callq  400eb6 <usage>
  4010e1:	be dd 30 40 00       	mov    $0x4030dd,%esi
  4010e6:	48 8b 3d bb 43 20 00 	mov    0x2043bb(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  4010ed:	e8 3e fc ff ff       	callq  400d30 <fopen@plt>
  4010f2:	48 89 05 f7 43 20 00 	mov    %rax,0x2043f7(%rip)        # 6054f0 <infile>
  4010f9:	48 85 c0             	test   %rax,%rax
  4010fc:	0f 85 88 00 00 00    	jne    40118a <main+0x14e>
  401102:	48 8b 0d 9f 43 20 00 	mov    0x20439f(%rip),%rcx        # 6054a8 <optarg@@GLIBC_2.2.5>
  401109:	ba 1a 2e 40 00       	mov    $0x402e1a,%edx
  40110e:	be 01 00 00 00       	mov    $0x1,%esi
  401113:	48 8b 3d a6 43 20 00 	mov    0x2043a6(%rip),%rdi        # 6054c0 <stderr@@GLIBC_2.2.5>
  40111a:	e8 61 fc ff ff       	callq  400d80 <__fprintf_chk@plt>
  40111f:	b8 01 00 00 00       	mov    $0x1,%eax
  401124:	e9 e4 00 00 00       	jmpq   40120d <main+0x1d1>
  401129:	ba 10 00 00 00       	mov    $0x10,%edx
  40112e:	be 00 00 00 00       	mov    $0x0,%esi
  401133:	48 8b 3d 6e 43 20 00 	mov    0x20436e(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  40113a:	e8 11 fc ff ff       	callq  400d50 <strtoul@plt>
  40113f:	41 89 c6             	mov    %eax,%r14d
  401142:	eb 46                	jmp    40118a <main+0x14e>
  401144:	ba 0a 00 00 00       	mov    $0xa,%edx
  401149:	be 00 00 00 00       	mov    $0x0,%esi
  40114e:	48 8b 3d 53 43 20 00 	mov    0x204353(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  401155:	e8 56 fb ff ff       	callq  400cb0 <strtol@plt>
  40115a:	41 89 c5             	mov    %eax,%r13d
  40115d:	eb 2b                	jmp    40118a <main+0x14e>
  40115f:	c7 05 1f 43 20 00 00 	movl   $0x0,0x20431f(%rip)        # 605488 <notify>
  401166:	00 00 00 
  401169:	eb 1f                	jmp    40118a <main+0x14e>
  40116b:	0f be d2             	movsbl %dl,%edx
  40116e:	be 37 2e 40 00       	mov    $0x402e37,%esi
  401173:	bf 01 00 00 00       	mov    $0x1,%edi
  401178:	b8 00 00 00 00       	mov    $0x0,%eax
  40117d:	e8 9e fb ff ff       	callq  400d20 <__printf_chk@plt>
  401182:	48 8b 3b             	mov    (%rbx),%rdi
  401185:	e8 2c fd ff ff       	callq  400eb6 <usage>
  40118a:	48 89 ea             	mov    %rbp,%rdx
  40118d:	48 89 de             	mov    %rbx,%rsi
  401190:	44 89 e7             	mov    %r12d,%edi
  401193:	e8 a8 fb ff ff       	callq  400d40 <getopt@plt>
  401198:	89 c2                	mov    %eax,%edx
  40119a:	3c ff                	cmp    $0xff,%al
  40119c:	0f 85 22 ff ff ff    	jne    4010c4 <main+0x88>
  4011a2:	be 01 00 00 00       	mov    $0x1,%esi
  4011a7:	44 89 ef             	mov    %r13d,%edi
  4011aa:	e8 91 fd ff ff       	callq  400f40 <initialize_target>
  4011af:	83 3d 52 43 20 00 00 	cmpl   $0x0,0x204352(%rip)        # 605508 <is_checker>
  4011b6:	74 2a                	je     4011e2 <main+0x1a6>
  4011b8:	44 3b 35 41 43 20 00 	cmp    0x204341(%rip),%r14d        # 605500 <authkey>
  4011bf:	74 21                	je     4011e2 <main+0x1a6>
  4011c1:	44 89 f2             	mov    %r14d,%edx
  4011c4:	be 70 2d 40 00       	mov    $0x402d70,%esi
  4011c9:	bf 01 00 00 00       	mov    $0x1,%edi
  4011ce:	b8 00 00 00 00       	mov    $0x0,%eax
  4011d3:	e8 48 fb ff ff       	callq  400d20 <__printf_chk@plt>
  4011d8:	b8 00 00 00 00       	mov    $0x0,%eax
  4011dd:	e8 ea 07 00 00       	callq  4019cc <check_fail>
  4011e2:	8b 15 1c 43 20 00    	mov    0x20431c(%rip),%edx        # 605504 <cookie>
  4011e8:	be 4a 2e 40 00       	mov    $0x402e4a,%esi
  4011ed:	bf 01 00 00 00       	mov    $0x1,%edi
  4011f2:	b8 00 00 00 00       	mov    $0x0,%eax
  4011f7:	e8 24 fb ff ff       	callq  400d20 <__printf_chk@plt>
  4011fc:	48 8b 3d 7d 42 20 00 	mov    0x20427d(%rip),%rdi        # 605480 <buf_offset>
  401203:	e8 65 0c 00 00       	callq  401e6d <launch>
  401208:	b8 00 00 00 00       	mov    $0x0,%eax
  40120d:	5b                   	pop    %rbx
  40120e:	5d                   	pop    %rbp
  40120f:	41 5c                	pop    %r12
  401211:	41 5d                	pop    %r13
  401213:	41 5e                	pop    %r14
  401215:	c3                   	retq   

0000000000401216 <scramble>:
  401216:	48 83 ec 38          	sub    $0x38,%rsp
  40121a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401221:	00 00 
  401223:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  401228:	31 c0                	xor    %eax,%eax
  40122a:	eb 10                	jmp    40123c <scramble+0x26>
  40122c:	69 d0 33 52 00 00    	imul   $0x5233,%eax,%edx
  401232:	01 fa                	add    %edi,%edx
  401234:	89 c1                	mov    %eax,%ecx
  401236:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
  401239:	83 c0 01             	add    $0x1,%eax
  40123c:	83 f8 09             	cmp    $0x9,%eax
  40123f:	76 eb                	jbe    40122c <scramble+0x16>
  401241:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401245:	69 c0 42 99 00 00    	imul   $0x9942,%eax,%eax
  40124b:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40124f:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401253:	69 c0 f3 90 00 00    	imul   $0x90f3,%eax,%eax
  401259:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40125d:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401261:	69 c0 99 1a 00 00    	imul   $0x1a99,%eax,%eax
  401267:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40126b:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40126f:	69 c0 24 f9 00 00    	imul   $0xf924,%eax,%eax
  401275:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401279:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40127d:	69 c0 40 33 00 00    	imul   $0x3340,%eax,%eax
  401283:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401287:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40128b:	69 c0 ba 8a 00 00    	imul   $0x8aba,%eax,%eax
  401291:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401295:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401299:	69 c0 6b ba 00 00    	imul   $0xba6b,%eax,%eax
  40129f:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4012a3:	8b 44 24 04          	mov    0x4(%rsp),%eax
  4012a7:	69 c0 76 a1 00 00    	imul   $0xa176,%eax,%eax
  4012ad:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4012b1:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4012b5:	69 c0 e9 53 00 00    	imul   $0x53e9,%eax,%eax
  4012bb:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4012bf:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4012c3:	69 c0 65 12 00 00    	imul   $0x1265,%eax,%eax
  4012c9:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4012cd:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4012d1:	69 c0 60 36 00 00    	imul   $0x3660,%eax,%eax
  4012d7:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4012db:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4012df:	69 c0 45 81 00 00    	imul   $0x8145,%eax,%eax
  4012e5:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4012e9:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4012ed:	69 c0 62 ba 00 00    	imul   $0xba62,%eax,%eax
  4012f3:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4012f7:	8b 04 24             	mov    (%rsp),%eax
  4012fa:	69 c0 60 d4 00 00    	imul   $0xd460,%eax,%eax
  401300:	89 04 24             	mov    %eax,(%rsp)
  401303:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401307:	69 c0 0e 80 00 00    	imul   $0x800e,%eax,%eax
  40130d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401311:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401315:	69 c0 d8 06 00 00    	imul   $0x6d8,%eax,%eax
  40131b:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40131f:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401323:	69 c0 5b a6 00 00    	imul   $0xa65b,%eax,%eax
  401329:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40132d:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401331:	69 c0 6a dd 00 00    	imul   $0xdd6a,%eax,%eax
  401337:	89 44 24 10          	mov    %eax,0x10(%rsp)
  40133b:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40133f:	69 c0 e7 6d 00 00    	imul   $0x6de7,%eax,%eax
  401345:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401349:	8b 44 24 24          	mov    0x24(%rsp),%eax
  40134d:	69 c0 6d da 00 00    	imul   $0xda6d,%eax,%eax
  401353:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401357:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40135b:	69 c0 00 39 00 00    	imul   $0x3900,%eax,%eax
  401361:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401365:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401369:	69 c0 34 0c 00 00    	imul   $0xc34,%eax,%eax
  40136f:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401373:	8b 44 24 20          	mov    0x20(%rsp),%eax
  401377:	69 c0 d6 b7 00 00    	imul   $0xb7d6,%eax,%eax
  40137d:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401381:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401385:	69 c0 d8 cd 00 00    	imul   $0xcdd8,%eax,%eax
  40138b:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40138f:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401393:	69 c0 bf ab 00 00    	imul   $0xabbf,%eax,%eax
  401399:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40139d:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4013a1:	69 c0 5b 77 00 00    	imul   $0x775b,%eax,%eax
  4013a7:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4013ab:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4013af:	69 c0 75 67 00 00    	imul   $0x6775,%eax,%eax
  4013b5:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4013b9:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4013bd:	69 c0 de ed 00 00    	imul   $0xedde,%eax,%eax
  4013c3:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4013c7:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4013cb:	69 c0 9a d8 00 00    	imul   $0xd89a,%eax,%eax
  4013d1:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4013d5:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4013d9:	69 c0 7c d6 00 00    	imul   $0xd67c,%eax,%eax
  4013df:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4013e3:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4013e7:	69 c0 7b 14 00 00    	imul   $0x147b,%eax,%eax
  4013ed:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4013f1:	8b 44 24 04          	mov    0x4(%rsp),%eax
  4013f5:	69 c0 f9 71 00 00    	imul   $0x71f9,%eax,%eax
  4013fb:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4013ff:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401403:	69 c0 1f 75 00 00    	imul   $0x751f,%eax,%eax
  401409:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40140d:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401411:	69 c0 cb 7b 00 00    	imul   $0x7bcb,%eax,%eax
  401417:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40141b:	8b 44 24 24          	mov    0x24(%rsp),%eax
  40141f:	69 c0 f1 25 00 00    	imul   $0x25f1,%eax,%eax
  401425:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401429:	8b 04 24             	mov    (%rsp),%eax
  40142c:	69 c0 2e 84 00 00    	imul   $0x842e,%eax,%eax
  401432:	89 04 24             	mov    %eax,(%rsp)
  401435:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401439:	69 c0 60 bb 00 00    	imul   $0xbb60,%eax,%eax
  40143f:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401443:	8b 44 24 20          	mov    0x20(%rsp),%eax
  401447:	69 c0 5d 52 00 00    	imul   $0x525d,%eax,%eax
  40144d:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401451:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401455:	69 c0 0c 3e 00 00    	imul   $0x3e0c,%eax,%eax
  40145b:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40145f:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401463:	69 c0 f5 7e 00 00    	imul   $0x7ef5,%eax,%eax
  401469:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40146d:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401471:	6b c0 73             	imul   $0x73,%eax,%eax
  401474:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401478:	8b 04 24             	mov    (%rsp),%eax
  40147b:	69 c0 eb cb 00 00    	imul   $0xcbeb,%eax,%eax
  401481:	89 04 24             	mov    %eax,(%rsp)
  401484:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401488:	69 c0 f1 ee 00 00    	imul   $0xeef1,%eax,%eax
  40148e:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401492:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401496:	69 c0 c0 89 00 00    	imul   $0x89c0,%eax,%eax
  40149c:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4014a0:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4014a4:	69 c0 07 7c 00 00    	imul   $0x7c07,%eax,%eax
  4014aa:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4014ae:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4014b2:	69 c0 34 20 00 00    	imul   $0x2034,%eax,%eax
  4014b8:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4014bc:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4014c0:	69 c0 90 3d 00 00    	imul   $0x3d90,%eax,%eax
  4014c6:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4014ca:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4014ce:	69 c0 59 4b 00 00    	imul   $0x4b59,%eax,%eax
  4014d4:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4014d8:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4014dc:	69 c0 91 e1 00 00    	imul   $0xe191,%eax,%eax
  4014e2:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4014e6:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4014ea:	69 c0 b6 95 00 00    	imul   $0x95b6,%eax,%eax
  4014f0:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4014f4:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4014f8:	69 c0 5e 1d 00 00    	imul   $0x1d5e,%eax,%eax
  4014fe:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401502:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401506:	69 c0 75 66 00 00    	imul   $0x6675,%eax,%eax
  40150c:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401510:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401514:	69 c0 46 aa 00 00    	imul   $0xaa46,%eax,%eax
  40151a:	89 44 24 10          	mov    %eax,0x10(%rsp)
  40151e:	8b 44 24 20          	mov    0x20(%rsp),%eax
  401522:	69 c0 f5 4b 00 00    	imul   $0x4bf5,%eax,%eax
  401528:	89 44 24 20          	mov    %eax,0x20(%rsp)
  40152c:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401530:	69 c0 08 d9 00 00    	imul   $0xd908,%eax,%eax
  401536:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40153a:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40153e:	69 c0 1d d2 00 00    	imul   $0xd21d,%eax,%eax
  401544:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401548:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40154c:	69 c0 3b c1 00 00    	imul   $0xc13b,%eax,%eax
  401552:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401556:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40155a:	69 c0 64 41 00 00    	imul   $0x4164,%eax,%eax
  401560:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401564:	8b 04 24             	mov    (%rsp),%eax
  401567:	69 c0 d1 57 00 00    	imul   $0x57d1,%eax,%eax
  40156d:	89 04 24             	mov    %eax,(%rsp)
  401570:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401574:	69 c0 b7 77 00 00    	imul   $0x77b7,%eax,%eax
  40157a:	89 44 24 10          	mov    %eax,0x10(%rsp)
  40157e:	8b 04 24             	mov    (%rsp),%eax
  401581:	69 c0 60 2b 00 00    	imul   $0x2b60,%eax,%eax
  401587:	89 04 24             	mov    %eax,(%rsp)
  40158a:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40158e:	69 c0 5b 64 00 00    	imul   $0x645b,%eax,%eax
  401594:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401598:	8b 44 24 20          	mov    0x20(%rsp),%eax
  40159c:	69 c0 1a 2a 00 00    	imul   $0x2a1a,%eax,%eax
  4015a2:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4015a6:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4015aa:	69 c0 a0 1b 00 00    	imul   $0x1ba0,%eax,%eax
  4015b0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4015b4:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4015b8:	69 c0 d9 76 00 00    	imul   $0x76d9,%eax,%eax
  4015be:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4015c2:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4015c6:	69 c0 2e 13 00 00    	imul   $0x132e,%eax,%eax
  4015cc:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4015d0:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4015d4:	69 c0 3a cb 00 00    	imul   $0xcb3a,%eax,%eax
  4015da:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4015de:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4015e2:	69 c0 f6 6c 00 00    	imul   $0x6cf6,%eax,%eax
  4015e8:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4015ec:	8b 44 24 04          	mov    0x4(%rsp),%eax
  4015f0:	69 c0 76 32 00 00    	imul   $0x3276,%eax,%eax
  4015f6:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4015fa:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4015fe:	69 c0 d2 5d 00 00    	imul   $0x5dd2,%eax,%eax
  401604:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401608:	8b 44 24 24          	mov    0x24(%rsp),%eax
  40160c:	69 c0 d5 83 00 00    	imul   $0x83d5,%eax,%eax
  401612:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401616:	8b 04 24             	mov    (%rsp),%eax
  401619:	69 c0 fa e4 00 00    	imul   $0xe4fa,%eax,%eax
  40161f:	89 04 24             	mov    %eax,(%rsp)
  401622:	ba 00 00 00 00       	mov    $0x0,%edx
  401627:	b8 00 00 00 00       	mov    $0x0,%eax
  40162c:	eb 0a                	jmp    401638 <scramble+0x422>
  40162e:	89 d1                	mov    %edx,%ecx
  401630:	8b 0c 8c             	mov    (%rsp,%rcx,4),%ecx
  401633:	01 c8                	add    %ecx,%eax
  401635:	83 c2 01             	add    $0x1,%edx
  401638:	83 fa 09             	cmp    $0x9,%edx
  40163b:	76 f1                	jbe    40162e <scramble+0x418>
  40163d:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  401642:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  401649:	00 00 
  40164b:	74 05                	je     401652 <scramble+0x43c>
  40164d:	e8 ce f5 ff ff       	callq  400c20 <__stack_chk_fail@plt>
  401652:	48 83 c4 38          	add    $0x38,%rsp
  401656:	c3                   	retq   

0000000000401657 <getbuf>:
  401657:	48 83 ec 18          	sub    $0x18,%rsp
  40165b:	48 89 e7             	mov    %rsp,%rdi
  40165e:	e8 9e 03 00 00       	callq  401a01 <Gets>
  401663:	b8 01 00 00 00       	mov    $0x1,%eax
  401668:	48 83 c4 18          	add    $0x18,%rsp
  40166c:	c3                   	retq   

000000000040166d <touch1>:
  40166d:	48 83 ec 08          	sub    $0x8,%rsp
  401671:	c7 05 81 3e 20 00 01 	movl   $0x1,0x203e81(%rip)        # 6054fc <vlevel>
  401678:	00 00 00 
  40167b:	bf 33 2f 40 00       	mov    $0x402f33,%edi
  401680:	e8 7b f5 ff ff       	callq  400c00 <puts@plt>
  401685:	bf 01 00 00 00       	mov    $0x1,%edi
  40168a:	e8 b7 05 00 00       	callq  401c46 <validate>
  40168f:	bf 00 00 00 00       	mov    $0x0,%edi
  401694:	e8 c7 f6 ff ff       	callq  400d60 <exit@plt>

0000000000401699 <touch2>:
  401699:	48 83 ec 08          	sub    $0x8,%rsp
  40169d:	89 fa                	mov    %edi,%edx
  40169f:	c7 05 53 3e 20 00 02 	movl   $0x2,0x203e53(%rip)        # 6054fc <vlevel>
  4016a6:	00 00 00 
  4016a9:	39 3d 55 3e 20 00    	cmp    %edi,0x203e55(%rip)        # 605504 <cookie>
  4016af:	75 20                	jne    4016d1 <touch2+0x38>
  4016b1:	be 58 2f 40 00       	mov    $0x402f58,%esi
  4016b6:	bf 01 00 00 00       	mov    $0x1,%edi
  4016bb:	b8 00 00 00 00       	mov    $0x0,%eax
  4016c0:	e8 5b f6 ff ff       	callq  400d20 <__printf_chk@plt>
  4016c5:	bf 02 00 00 00       	mov    $0x2,%edi
  4016ca:	e8 77 05 00 00       	callq  401c46 <validate>
  4016cf:	eb 1e                	jmp    4016ef <touch2+0x56>
  4016d1:	be 80 2f 40 00       	mov    $0x402f80,%esi
  4016d6:	bf 01 00 00 00       	mov    $0x1,%edi
  4016db:	b8 00 00 00 00       	mov    $0x0,%eax
  4016e0:	e8 3b f6 ff ff       	callq  400d20 <__printf_chk@plt>
  4016e5:	bf 02 00 00 00       	mov    $0x2,%edi
  4016ea:	e8 19 06 00 00       	callq  401d08 <fail>
  4016ef:	bf 00 00 00 00       	mov    $0x0,%edi
  4016f4:	e8 67 f6 ff ff       	callq  400d60 <exit@plt>

00000000004016f9 <hexmatch>:
  4016f9:	41 54                	push   %r12
  4016fb:	55                   	push   %rbp
  4016fc:	53                   	push   %rbx
  4016fd:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  401701:	89 fd                	mov    %edi,%ebp
  401703:	48 89 f3             	mov    %rsi,%rbx
  401706:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40170d:	00 00 
  40170f:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  401714:	31 c0                	xor    %eax,%eax
  401716:	e8 c5 f5 ff ff       	callq  400ce0 <random@plt>
  40171b:	48 89 c1             	mov    %rax,%rcx
  40171e:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401725:	0a d7 a3 
  401728:	48 f7 ea             	imul   %rdx
  40172b:	48 01 ca             	add    %rcx,%rdx
  40172e:	48 c1 fa 06          	sar    $0x6,%rdx
  401732:	48 89 c8             	mov    %rcx,%rax
  401735:	48 c1 f8 3f          	sar    $0x3f,%rax
  401739:	48 29 c2             	sub    %rax,%rdx
  40173c:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  401740:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  401744:	48 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%rax
  40174b:	00 
  40174c:	48 29 c1             	sub    %rax,%rcx
  40174f:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  401753:	41 89 e8             	mov    %ebp,%r8d
  401756:	b9 50 2f 40 00       	mov    $0x402f50,%ecx
  40175b:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401762:	be 01 00 00 00       	mov    $0x1,%esi
  401767:	4c 89 e7             	mov    %r12,%rdi
  40176a:	b8 00 00 00 00       	mov    $0x0,%eax
  40176f:	e8 1c f6 ff ff       	callq  400d90 <__sprintf_chk@plt>
  401774:	ba 09 00 00 00       	mov    $0x9,%edx
  401779:	4c 89 e6             	mov    %r12,%rsi
  40177c:	48 89 df             	mov    %rbx,%rdi
  40177f:	e8 5c f4 ff ff       	callq  400be0 <strncmp@plt>
  401784:	85 c0                	test   %eax,%eax
  401786:	0f 94 c0             	sete   %al
  401789:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
  40178e:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  401795:	00 00 
  401797:	74 05                	je     40179e <hexmatch+0xa5>
  401799:	e8 82 f4 ff ff       	callq  400c20 <__stack_chk_fail@plt>
  40179e:	0f b6 c0             	movzbl %al,%eax
  4017a1:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
  4017a5:	5b                   	pop    %rbx
  4017a6:	5d                   	pop    %rbp
  4017a7:	41 5c                	pop    %r12
  4017a9:	c3                   	retq   

00000000004017aa <touch3>:
  4017aa:	53                   	push   %rbx
  4017ab:	48 89 fb             	mov    %rdi,%rbx
  4017ae:	c7 05 44 3d 20 00 03 	movl   $0x3,0x203d44(%rip)        # 6054fc <vlevel>
  4017b5:	00 00 00 
  4017b8:	48 89 fe             	mov    %rdi,%rsi
  4017bb:	8b 3d 43 3d 20 00    	mov    0x203d43(%rip),%edi        # 605504 <cookie>
  4017c1:	e8 33 ff ff ff       	callq  4016f9 <hexmatch>
  4017c6:	85 c0                	test   %eax,%eax
  4017c8:	74 23                	je     4017ed <touch3+0x43>
  4017ca:	48 89 da             	mov    %rbx,%rdx
  4017cd:	be a8 2f 40 00       	mov    $0x402fa8,%esi
  4017d2:	bf 01 00 00 00       	mov    $0x1,%edi
  4017d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4017dc:	e8 3f f5 ff ff       	callq  400d20 <__printf_chk@plt>
  4017e1:	bf 03 00 00 00       	mov    $0x3,%edi
  4017e6:	e8 5b 04 00 00       	callq  401c46 <validate>
  4017eb:	eb 21                	jmp    40180e <touch3+0x64>
  4017ed:	48 89 da             	mov    %rbx,%rdx
  4017f0:	be d0 2f 40 00       	mov    $0x402fd0,%esi
  4017f5:	bf 01 00 00 00       	mov    $0x1,%edi
  4017fa:	b8 00 00 00 00       	mov    $0x0,%eax
  4017ff:	e8 1c f5 ff ff       	callq  400d20 <__printf_chk@plt>
  401804:	bf 03 00 00 00       	mov    $0x3,%edi
  401809:	e8 fa 04 00 00       	callq  401d08 <fail>
  40180e:	bf 00 00 00 00       	mov    $0x0,%edi
  401813:	e8 48 f5 ff ff       	callq  400d60 <exit@plt>

0000000000401818 <test>:
  401818:	48 83 ec 08          	sub    $0x8,%rsp
  40181c:	b8 00 00 00 00       	mov    $0x0,%eax
  401821:	e8 31 fe ff ff       	callq  401657 <getbuf>
  401826:	89 c2                	mov    %eax,%edx
  401828:	be f8 2f 40 00       	mov    $0x402ff8,%esi
  40182d:	bf 01 00 00 00       	mov    $0x1,%edi
  401832:	b8 00 00 00 00       	mov    $0x0,%eax
  401837:	e8 e4 f4 ff ff       	callq  400d20 <__printf_chk@plt>
  40183c:	48 83 c4 08          	add    $0x8,%rsp
  401840:	c3                   	retq   

0000000000401841 <start_farm>:
  401841:	b8 01 00 00 00       	mov    $0x1,%eax
  401846:	c3                   	retq   

0000000000401847 <getval_168>:
  401847:	b8 48 89 c7 94       	mov    $0x94c78948,%eax
  40184c:	c3                   	retq   

000000000040184d <getval_448>:
  40184d:	b8 7e 58 89 c7       	mov    $0xc789587e,%eax
  401852:	c3                   	retq   

0000000000401853 <getval_387>:
  401853:	b8 48 89 c7 c3       	mov    $0xc3c78948,%eax
  401858:	c3                   	retq   

0000000000401859 <getval_247>:
  401859:	b8 18 90 90 90       	mov    $0x90909018,%eax
  40185e:	c3                   	retq   

000000000040185f <addval_452>:
  40185f:	8d 87 48 89 c7 c3    	lea    -0x3c3876b8(%rdi),%eax
  401865:	c3                   	retq   

0000000000401866 <setval_382>:
  401866:	c7 07 7c 51 58 c3    	movl   $0xc358517c,(%rdi)
  40186c:	c3                   	retq   

000000000040186d <setval_489>:
  40186d:	c7 07 11 58 c1 27    	movl   $0x27c15811,(%rdi)
  401873:	c3                   	retq   

0000000000401874 <getval_137>:
  401874:	b8 58 90 c3 f0       	mov    $0xf0c39058,%eax
  401879:	c3                   	retq   

000000000040187a <mid_farm>:
  40187a:	b8 01 00 00 00       	mov    $0x1,%eax
  40187f:	c3                   	retq   

0000000000401880 <add_xy>:
  401880:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  401884:	c3                   	retq   

0000000000401885 <addval_468>:
  401885:	8d 87 89 c1 08 d2    	lea    -0x2df73e77(%rdi),%eax
  40188b:	c3                   	retq   

000000000040188c <getval_214>:
  40188c:	b8 89 ca 92 90       	mov    $0x9092ca89,%eax
  401891:	c3                   	retq   

0000000000401892 <addval_125>:
  401892:	8d 87 09 d6 38 c9    	lea    -0x36c729f7(%rdi),%eax
  401898:	c3                   	retq   

0000000000401899 <setval_163>:
  401899:	c7 07 99 c1 38 c0    	movl   $0xc038c199,(%rdi)
  40189f:	c3                   	retq   

00000000004018a0 <setval_261>:
  4018a0:	c7 07 89 ca 38 db    	movl   $0xdb38ca89,(%rdi)
  4018a6:	c3                   	retq   

00000000004018a7 <setval_243>:
  4018a7:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  4018ad:	c3                   	retq   

00000000004018ae <setval_140>:
  4018ae:	c7 07 ea 68 89 e0    	movl   $0xe08968ea,(%rdi)
  4018b4:	c3                   	retq   

00000000004018b5 <addval_191>:
  4018b5:	8d 87 48 89 e0 c3    	lea    -0x3c1f76b8(%rdi),%eax
  4018bb:	c3                   	retq   

00000000004018bc <addval_257>:
  4018bc:	8d 87 89 d6 18 d2    	lea    -0x2de72977(%rdi),%eax
  4018c2:	c3                   	retq   

00000000004018c3 <addval_492>:
  4018c3:	8d 87 88 d6 84 d2    	lea    -0x2d7b2978(%rdi),%eax
  4018c9:	c3                   	retq   

00000000004018ca <setval_156>:
  4018ca:	c7 07 89 d6 08 c9    	movl   $0xc908d689,(%rdi)
  4018d0:	c3                   	retq   

00000000004018d1 <getval_399>:
  4018d1:	b8 48 09 e0 90       	mov    $0x90e00948,%eax
  4018d6:	c3                   	retq   

00000000004018d7 <setval_412>:
  4018d7:	c7 07 48 89 e0 c7    	movl   $0xc7e08948,(%rdi)
  4018dd:	c3                   	retq   

00000000004018de <addval_290>:
  4018de:	8d 87 89 ca 94 db    	lea    -0x246b3577(%rdi),%eax
  4018e4:	c3                   	retq   

00000000004018e5 <getval_270>:
  4018e5:	b8 58 cc 8b c1       	mov    $0xc18bcc58,%eax
  4018ea:	c3                   	retq   

00000000004018eb <getval_139>:
  4018eb:	b8 c9 c1 84 c9       	mov    $0xc984c1c9,%eax
  4018f0:	c3                   	retq   

00000000004018f1 <getval_164>:
  4018f1:	b8 48 89 e0 c1       	mov    $0xc1e08948,%eax
  4018f6:	c3                   	retq   

00000000004018f7 <setval_459>:
  4018f7:	c7 07 8b d6 90 c3    	movl   $0xc390d68b,(%rdi)
  4018fd:	c3                   	retq   

00000000004018fe <addval_430>:
  4018fe:	8d 87 89 d6 48 c0    	lea    -0x3fb72977(%rdi),%eax
  401904:	c3                   	retq   

0000000000401905 <addval_334>:
  401905:	8d 87 c9 c1 90 c3    	lea    -0x3c6f3e37(%rdi),%eax
  40190b:	c3                   	retq   

000000000040190c <setval_221>:
  40190c:	c7 07 89 ca c4 d2    	movl   $0xd2c4ca89,(%rdi)
  401912:	c3                   	retq   

0000000000401913 <getval_252>:
  401913:	b8 89 ca 20 d2       	mov    $0xd220ca89,%eax
  401918:	c3                   	retq   

0000000000401919 <getval_474>:
  401919:	b8 89 d6 84 c0       	mov    $0xc084d689,%eax
  40191e:	c3                   	retq   

000000000040191f <setval_238>:
  40191f:	c7 07 8b ca 38 d2    	movl   $0xd238ca8b,(%rdi)
  401925:	c3                   	retq   

0000000000401926 <getval_241>:
  401926:	b8 89 d6 94 c0       	mov    $0xc094d689,%eax
  40192b:	c3                   	retq   

000000000040192c <addval_376>:
  40192c:	8d 87 48 89 e0 91    	lea    -0x6e1f76b8(%rdi),%eax
  401932:	c3                   	retq   

0000000000401933 <setval_145>:
  401933:	c7 07 88 c1 08 db    	movl   $0xdb08c188,(%rdi)
  401939:	c3                   	retq   

000000000040193a <addval_319>:
  40193a:	8d 87 c9 ca 08 d2    	lea    -0x2df73537(%rdi),%eax
  401940:	c3                   	retq   

0000000000401941 <setval_287>:
  401941:	c7 07 c2 48 09 e0    	movl   $0xe00948c2,(%rdi)
  401947:	c3                   	retq   

0000000000401948 <getval_380>:
  401948:	b8 95 09 c1 90       	mov    $0x90c10995,%eax
  40194d:	c3                   	retq   

000000000040194e <addval_421>:
  40194e:	8d 87 70 09 ca 90    	lea    -0x6f35f690(%rdi),%eax
  401954:	c3                   	retq   

0000000000401955 <getval_343>:
  401955:	b8 89 c1 90 90       	mov    $0x9090c189,%eax
  40195a:	c3                   	retq   

000000000040195b <end_farm>:
  40195b:	b8 01 00 00 00       	mov    $0x1,%eax
  401960:	c3                   	retq   

0000000000401961 <save_char>:
  401961:	8b 05 bd 47 20 00    	mov    0x2047bd(%rip),%eax        # 606124 <gets_cnt>
  401967:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  40196c:	7f 49                	jg     4019b7 <save_char+0x56>
  40196e:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401971:	89 f9                	mov    %edi,%ecx
  401973:	c0 e9 04             	shr    $0x4,%cl
  401976:	83 e1 0f             	and    $0xf,%ecx
  401979:	0f b6 b1 20 33 40 00 	movzbl 0x403320(%rcx),%esi
  401980:	48 63 ca             	movslq %edx,%rcx
  401983:	40 88 b1 20 55 60 00 	mov    %sil,0x605520(%rcx)
  40198a:	8d 4a 01             	lea    0x1(%rdx),%ecx
  40198d:	83 e7 0f             	and    $0xf,%edi
  401990:	0f b6 b7 20 33 40 00 	movzbl 0x403320(%rdi),%esi
  401997:	48 63 c9             	movslq %ecx,%rcx
  40199a:	40 88 b1 20 55 60 00 	mov    %sil,0x605520(%rcx)
  4019a1:	83 c2 02             	add    $0x2,%edx
  4019a4:	48 63 d2             	movslq %edx,%rdx
  4019a7:	c6 82 20 55 60 00 20 	movb   $0x20,0x605520(%rdx)
  4019ae:	83 c0 01             	add    $0x1,%eax
  4019b1:	89 05 6d 47 20 00    	mov    %eax,0x20476d(%rip)        # 606124 <gets_cnt>
  4019b7:	f3 c3                	repz retq 

00000000004019b9 <save_term>:
  4019b9:	8b 05 65 47 20 00    	mov    0x204765(%rip),%eax        # 606124 <gets_cnt>
  4019bf:	8d 04 40             	lea    (%rax,%rax,2),%eax
  4019c2:	48 98                	cltq   
  4019c4:	c6 80 20 55 60 00 00 	movb   $0x0,0x605520(%rax)
  4019cb:	c3                   	retq   

00000000004019cc <check_fail>:
  4019cc:	48 83 ec 08          	sub    $0x8,%rsp
  4019d0:	0f be 15 51 47 20 00 	movsbl 0x204751(%rip),%edx        # 606128 <target_prefix>
  4019d7:	41 b8 20 55 60 00    	mov    $0x605520,%r8d
  4019dd:	8b 0d 15 3b 20 00    	mov    0x203b15(%rip),%ecx        # 6054f8 <check_level>
  4019e3:	be 1b 30 40 00       	mov    $0x40301b,%esi
  4019e8:	bf 01 00 00 00       	mov    $0x1,%edi
  4019ed:	b8 00 00 00 00       	mov    $0x0,%eax
  4019f2:	e8 29 f3 ff ff       	callq  400d20 <__printf_chk@plt>
  4019f7:	bf 01 00 00 00       	mov    $0x1,%edi
  4019fc:	e8 5f f3 ff ff       	callq  400d60 <exit@plt>

0000000000401a01 <Gets>:
  401a01:	41 54                	push   %r12
  401a03:	55                   	push   %rbp
  401a04:	53                   	push   %rbx
  401a05:	49 89 fc             	mov    %rdi,%r12
  401a08:	c7 05 12 47 20 00 00 	movl   $0x0,0x204712(%rip)        # 606124 <gets_cnt>
  401a0f:	00 00 00 
  401a12:	48 89 fb             	mov    %rdi,%rbx
  401a15:	eb 11                	jmp    401a28 <Gets+0x27>
  401a17:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401a1b:	88 03                	mov    %al,(%rbx)
  401a1d:	0f b6 f8             	movzbl %al,%edi
  401a20:	e8 3c ff ff ff       	callq  401961 <save_char>
  401a25:	48 89 eb             	mov    %rbp,%rbx
  401a28:	48 8b 3d c1 3a 20 00 	mov    0x203ac1(%rip),%rdi        # 6054f0 <infile>
  401a2f:	e8 bc f2 ff ff       	callq  400cf0 <_IO_getc@plt>
  401a34:	83 f8 ff             	cmp    $0xffffffff,%eax
  401a37:	74 05                	je     401a3e <Gets+0x3d>
  401a39:	83 f8 0a             	cmp    $0xa,%eax
  401a3c:	75 d9                	jne    401a17 <Gets+0x16>
  401a3e:	c6 03 00             	movb   $0x0,(%rbx)
  401a41:	b8 00 00 00 00       	mov    $0x0,%eax
  401a46:	e8 6e ff ff ff       	callq  4019b9 <save_term>
  401a4b:	4c 89 e0             	mov    %r12,%rax
  401a4e:	5b                   	pop    %rbx
  401a4f:	5d                   	pop    %rbp
  401a50:	41 5c                	pop    %r12
  401a52:	c3                   	retq   

0000000000401a53 <notify_server>:
  401a53:	53                   	push   %rbx
  401a54:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401a5b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401a62:	00 00 
  401a64:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401a6b:	00 
  401a6c:	31 c0                	xor    %eax,%eax
  401a6e:	83 3d 93 3a 20 00 00 	cmpl   $0x0,0x203a93(%rip)        # 605508 <is_checker>
  401a75:	0f 85 aa 01 00 00    	jne    401c25 <notify_server+0x1d2>
  401a7b:	89 fb                	mov    %edi,%ebx
  401a7d:	8b 05 a1 46 20 00    	mov    0x2046a1(%rip),%eax        # 606124 <gets_cnt>
  401a83:	83 c0 64             	add    $0x64,%eax
  401a86:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401a8b:	7e 1e                	jle    401aab <notify_server+0x58>
  401a8d:	be 50 31 40 00       	mov    $0x403150,%esi
  401a92:	bf 01 00 00 00       	mov    $0x1,%edi
  401a97:	b8 00 00 00 00       	mov    $0x0,%eax
  401a9c:	e8 7f f2 ff ff       	callq  400d20 <__printf_chk@plt>
  401aa1:	bf 01 00 00 00       	mov    $0x1,%edi
  401aa6:	e8 b5 f2 ff ff       	callq  400d60 <exit@plt>
  401aab:	0f be 05 76 46 20 00 	movsbl 0x204676(%rip),%eax        # 606128 <target_prefix>
  401ab2:	83 3d cf 39 20 00 00 	cmpl   $0x0,0x2039cf(%rip)        # 605488 <notify>
  401ab9:	74 08                	je     401ac3 <notify_server+0x70>
  401abb:	8b 15 3f 3a 20 00    	mov    0x203a3f(%rip),%edx        # 605500 <authkey>
  401ac1:	eb 05                	jmp    401ac8 <notify_server+0x75>
  401ac3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401ac8:	85 db                	test   %ebx,%ebx
  401aca:	74 08                	je     401ad4 <notify_server+0x81>
  401acc:	41 b9 31 30 40 00    	mov    $0x403031,%r9d
  401ad2:	eb 06                	jmp    401ada <notify_server+0x87>
  401ad4:	41 b9 36 30 40 00    	mov    $0x403036,%r9d
  401ada:	68 20 55 60 00       	pushq  $0x605520
  401adf:	56                   	push   %rsi
  401ae0:	50                   	push   %rax
  401ae1:	52                   	push   %rdx
  401ae2:	44 8b 05 5f 36 20 00 	mov    0x20365f(%rip),%r8d        # 605148 <target_id>
  401ae9:	b9 3b 30 40 00       	mov    $0x40303b,%ecx
  401aee:	ba 00 20 00 00       	mov    $0x2000,%edx
  401af3:	be 01 00 00 00       	mov    $0x1,%esi
  401af8:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401afd:	b8 00 00 00 00       	mov    $0x0,%eax
  401b02:	e8 89 f2 ff ff       	callq  400d90 <__sprintf_chk@plt>
  401b07:	48 83 c4 20          	add    $0x20,%rsp
  401b0b:	83 3d 76 39 20 00 00 	cmpl   $0x0,0x203976(%rip)        # 605488 <notify>
  401b12:	0f 84 81 00 00 00    	je     401b99 <notify_server+0x146>
  401b18:	85 db                	test   %ebx,%ebx
  401b1a:	74 6e                	je     401b8a <notify_server+0x137>
  401b1c:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401b23:	00 
  401b24:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401b2a:	48 89 e1             	mov    %rsp,%rcx
  401b2d:	48 8b 15 1c 36 20 00 	mov    0x20361c(%rip),%rdx        # 605150 <lab>
  401b34:	48 8b 35 1d 36 20 00 	mov    0x20361d(%rip),%rsi        # 605158 <course>
  401b3b:	48 8b 3d fe 35 20 00 	mov    0x2035fe(%rip),%rdi        # 605140 <user_id>
  401b42:	e8 d3 0f 00 00       	callq  402b1a <driver_post>
  401b47:	85 c0                	test   %eax,%eax
  401b49:	79 26                	jns    401b71 <notify_server+0x11e>
  401b4b:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401b52:	00 
  401b53:	be 57 30 40 00       	mov    $0x403057,%esi
  401b58:	bf 01 00 00 00       	mov    $0x1,%edi
  401b5d:	b8 00 00 00 00       	mov    $0x0,%eax
  401b62:	e8 b9 f1 ff ff       	callq  400d20 <__printf_chk@plt>
  401b67:	bf 01 00 00 00       	mov    $0x1,%edi
  401b6c:	e8 ef f1 ff ff       	callq  400d60 <exit@plt>
  401b71:	bf 80 31 40 00       	mov    $0x403180,%edi
  401b76:	e8 85 f0 ff ff       	callq  400c00 <puts@plt>
  401b7b:	bf 63 30 40 00       	mov    $0x403063,%edi
  401b80:	e8 7b f0 ff ff       	callq  400c00 <puts@plt>
  401b85:	e9 9b 00 00 00       	jmpq   401c25 <notify_server+0x1d2>
  401b8a:	bf 6d 30 40 00       	mov    $0x40306d,%edi
  401b8f:	e8 6c f0 ff ff       	callq  400c00 <puts@plt>
  401b94:	e9 8c 00 00 00       	jmpq   401c25 <notify_server+0x1d2>
  401b99:	85 db                	test   %ebx,%ebx
  401b9b:	74 07                	je     401ba4 <notify_server+0x151>
  401b9d:	ba 31 30 40 00       	mov    $0x403031,%edx
  401ba2:	eb 05                	jmp    401ba9 <notify_server+0x156>
  401ba4:	ba 36 30 40 00       	mov    $0x403036,%edx
  401ba9:	be b8 31 40 00       	mov    $0x4031b8,%esi
  401bae:	bf 01 00 00 00       	mov    $0x1,%edi
  401bb3:	b8 00 00 00 00       	mov    $0x0,%eax
  401bb8:	e8 63 f1 ff ff       	callq  400d20 <__printf_chk@plt>
  401bbd:	48 8b 15 7c 35 20 00 	mov    0x20357c(%rip),%rdx        # 605140 <user_id>
  401bc4:	be 74 30 40 00       	mov    $0x403074,%esi
  401bc9:	bf 01 00 00 00       	mov    $0x1,%edi
  401bce:	b8 00 00 00 00       	mov    $0x0,%eax
  401bd3:	e8 48 f1 ff ff       	callq  400d20 <__printf_chk@plt>
  401bd8:	48 8b 15 79 35 20 00 	mov    0x203579(%rip),%rdx        # 605158 <course>
  401bdf:	be 81 30 40 00       	mov    $0x403081,%esi
  401be4:	bf 01 00 00 00       	mov    $0x1,%edi
  401be9:	b8 00 00 00 00       	mov    $0x0,%eax
  401bee:	e8 2d f1 ff ff       	callq  400d20 <__printf_chk@plt>
  401bf3:	48 8b 15 56 35 20 00 	mov    0x203556(%rip),%rdx        # 605150 <lab>
  401bfa:	be 8d 30 40 00       	mov    $0x40308d,%esi
  401bff:	bf 01 00 00 00       	mov    $0x1,%edi
  401c04:	b8 00 00 00 00       	mov    $0x0,%eax
  401c09:	e8 12 f1 ff ff       	callq  400d20 <__printf_chk@plt>
  401c0e:	48 89 e2             	mov    %rsp,%rdx
  401c11:	be 96 30 40 00       	mov    $0x403096,%esi
  401c16:	bf 01 00 00 00       	mov    $0x1,%edi
  401c1b:	b8 00 00 00 00       	mov    $0x0,%eax
  401c20:	e8 fb f0 ff ff       	callq  400d20 <__printf_chk@plt>
  401c25:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  401c2c:	00 
  401c2d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401c34:	00 00 
  401c36:	74 05                	je     401c3d <notify_server+0x1ea>
  401c38:	e8 e3 ef ff ff       	callq  400c20 <__stack_chk_fail@plt>
  401c3d:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401c44:	5b                   	pop    %rbx
  401c45:	c3                   	retq   

0000000000401c46 <validate>:
  401c46:	53                   	push   %rbx
  401c47:	89 fb                	mov    %edi,%ebx
  401c49:	83 3d b8 38 20 00 00 	cmpl   $0x0,0x2038b8(%rip)        # 605508 <is_checker>
  401c50:	74 6b                	je     401cbd <validate+0x77>
  401c52:	39 3d a4 38 20 00    	cmp    %edi,0x2038a4(%rip)        # 6054fc <vlevel>
  401c58:	74 14                	je     401c6e <validate+0x28>
  401c5a:	bf a2 30 40 00       	mov    $0x4030a2,%edi
  401c5f:	e8 9c ef ff ff       	callq  400c00 <puts@plt>
  401c64:	b8 00 00 00 00       	mov    $0x0,%eax
  401c69:	e8 5e fd ff ff       	callq  4019cc <check_fail>
  401c6e:	8b 15 84 38 20 00    	mov    0x203884(%rip),%edx        # 6054f8 <check_level>
  401c74:	39 d7                	cmp    %edx,%edi
  401c76:	74 20                	je     401c98 <validate+0x52>
  401c78:	89 f9                	mov    %edi,%ecx
  401c7a:	be e0 31 40 00       	mov    $0x4031e0,%esi
  401c7f:	bf 01 00 00 00       	mov    $0x1,%edi
  401c84:	b8 00 00 00 00       	mov    $0x0,%eax
  401c89:	e8 92 f0 ff ff       	callq  400d20 <__printf_chk@plt>
  401c8e:	b8 00 00 00 00       	mov    $0x0,%eax
  401c93:	e8 34 fd ff ff       	callq  4019cc <check_fail>
  401c98:	0f be 15 89 44 20 00 	movsbl 0x204489(%rip),%edx        # 606128 <target_prefix>
  401c9f:	41 b8 20 55 60 00    	mov    $0x605520,%r8d
  401ca5:	89 f9                	mov    %edi,%ecx
  401ca7:	be c0 30 40 00       	mov    $0x4030c0,%esi
  401cac:	bf 01 00 00 00       	mov    $0x1,%edi
  401cb1:	b8 00 00 00 00       	mov    $0x0,%eax
  401cb6:	e8 65 f0 ff ff       	callq  400d20 <__printf_chk@plt>
  401cbb:	eb 49                	jmp    401d06 <validate+0xc0>
  401cbd:	3b 3d 39 38 20 00    	cmp    0x203839(%rip),%edi        # 6054fc <vlevel>
  401cc3:	74 18                	je     401cdd <validate+0x97>
  401cc5:	bf a2 30 40 00       	mov    $0x4030a2,%edi
  401cca:	e8 31 ef ff ff       	callq  400c00 <puts@plt>
  401ccf:	89 de                	mov    %ebx,%esi
  401cd1:	bf 00 00 00 00       	mov    $0x0,%edi
  401cd6:	e8 78 fd ff ff       	callq  401a53 <notify_server>
  401cdb:	eb 29                	jmp    401d06 <validate+0xc0>
  401cdd:	0f be 0d 44 44 20 00 	movsbl 0x204444(%rip),%ecx        # 606128 <target_prefix>
  401ce4:	89 fa                	mov    %edi,%edx
  401ce6:	be 08 32 40 00       	mov    $0x403208,%esi
  401ceb:	bf 01 00 00 00       	mov    $0x1,%edi
  401cf0:	b8 00 00 00 00       	mov    $0x0,%eax
  401cf5:	e8 26 f0 ff ff       	callq  400d20 <__printf_chk@plt>
  401cfa:	89 de                	mov    %ebx,%esi
  401cfc:	bf 01 00 00 00       	mov    $0x1,%edi
  401d01:	e8 4d fd ff ff       	callq  401a53 <notify_server>
  401d06:	5b                   	pop    %rbx
  401d07:	c3                   	retq   

0000000000401d08 <fail>:
  401d08:	48 83 ec 08          	sub    $0x8,%rsp
  401d0c:	83 3d f5 37 20 00 00 	cmpl   $0x0,0x2037f5(%rip)        # 605508 <is_checker>
  401d13:	74 0a                	je     401d1f <fail+0x17>
  401d15:	b8 00 00 00 00       	mov    $0x0,%eax
  401d1a:	e8 ad fc ff ff       	callq  4019cc <check_fail>
  401d1f:	89 fe                	mov    %edi,%esi
  401d21:	bf 00 00 00 00       	mov    $0x0,%edi
  401d26:	e8 28 fd ff ff       	callq  401a53 <notify_server>
  401d2b:	48 83 c4 08          	add    $0x8,%rsp
  401d2f:	c3                   	retq   

0000000000401d30 <bushandler>:
  401d30:	48 83 ec 08          	sub    $0x8,%rsp
  401d34:	83 3d cd 37 20 00 00 	cmpl   $0x0,0x2037cd(%rip)        # 605508 <is_checker>
  401d3b:	74 14                	je     401d51 <bushandler+0x21>
  401d3d:	bf d5 30 40 00       	mov    $0x4030d5,%edi
  401d42:	e8 b9 ee ff ff       	callq  400c00 <puts@plt>
  401d47:	b8 00 00 00 00       	mov    $0x0,%eax
  401d4c:	e8 7b fc ff ff       	callq  4019cc <check_fail>
  401d51:	bf 40 32 40 00       	mov    $0x403240,%edi
  401d56:	e8 a5 ee ff ff       	callq  400c00 <puts@plt>
  401d5b:	bf df 30 40 00       	mov    $0x4030df,%edi
  401d60:	e8 9b ee ff ff       	callq  400c00 <puts@plt>
  401d65:	be 00 00 00 00       	mov    $0x0,%esi
  401d6a:	bf 00 00 00 00       	mov    $0x0,%edi
  401d6f:	e8 df fc ff ff       	callq  401a53 <notify_server>
  401d74:	bf 01 00 00 00       	mov    $0x1,%edi
  401d79:	e8 e2 ef ff ff       	callq  400d60 <exit@plt>

0000000000401d7e <seghandler>:
  401d7e:	48 83 ec 08          	sub    $0x8,%rsp
  401d82:	83 3d 7f 37 20 00 00 	cmpl   $0x0,0x20377f(%rip)        # 605508 <is_checker>
  401d89:	74 14                	je     401d9f <seghandler+0x21>
  401d8b:	bf f5 30 40 00       	mov    $0x4030f5,%edi
  401d90:	e8 6b ee ff ff       	callq  400c00 <puts@plt>
  401d95:	b8 00 00 00 00       	mov    $0x0,%eax
  401d9a:	e8 2d fc ff ff       	callq  4019cc <check_fail>
  401d9f:	bf 60 32 40 00       	mov    $0x403260,%edi
  401da4:	e8 57 ee ff ff       	callq  400c00 <puts@plt>
  401da9:	bf df 30 40 00       	mov    $0x4030df,%edi
  401dae:	e8 4d ee ff ff       	callq  400c00 <puts@plt>
  401db3:	be 00 00 00 00       	mov    $0x0,%esi
  401db8:	bf 00 00 00 00       	mov    $0x0,%edi
  401dbd:	e8 91 fc ff ff       	callq  401a53 <notify_server>
  401dc2:	bf 01 00 00 00       	mov    $0x1,%edi
  401dc7:	e8 94 ef ff ff       	callq  400d60 <exit@plt>

0000000000401dcc <illegalhandler>:
  401dcc:	48 83 ec 08          	sub    $0x8,%rsp
  401dd0:	83 3d 31 37 20 00 00 	cmpl   $0x0,0x203731(%rip)        # 605508 <is_checker>
  401dd7:	74 14                	je     401ded <illegalhandler+0x21>
  401dd9:	bf 08 31 40 00       	mov    $0x403108,%edi
  401dde:	e8 1d ee ff ff       	callq  400c00 <puts@plt>
  401de3:	b8 00 00 00 00       	mov    $0x0,%eax
  401de8:	e8 df fb ff ff       	callq  4019cc <check_fail>
  401ded:	bf 88 32 40 00       	mov    $0x403288,%edi
  401df2:	e8 09 ee ff ff       	callq  400c00 <puts@plt>
  401df7:	bf df 30 40 00       	mov    $0x4030df,%edi
  401dfc:	e8 ff ed ff ff       	callq  400c00 <puts@plt>
  401e01:	be 00 00 00 00       	mov    $0x0,%esi
  401e06:	bf 00 00 00 00       	mov    $0x0,%edi
  401e0b:	e8 43 fc ff ff       	callq  401a53 <notify_server>
  401e10:	bf 01 00 00 00       	mov    $0x1,%edi
  401e15:	e8 46 ef ff ff       	callq  400d60 <exit@plt>

0000000000401e1a <sigalrmhandler>:
  401e1a:	48 83 ec 08          	sub    $0x8,%rsp
  401e1e:	83 3d e3 36 20 00 00 	cmpl   $0x0,0x2036e3(%rip)        # 605508 <is_checker>
  401e25:	74 14                	je     401e3b <sigalrmhandler+0x21>
  401e27:	bf 1c 31 40 00       	mov    $0x40311c,%edi
  401e2c:	e8 cf ed ff ff       	callq  400c00 <puts@plt>
  401e31:	b8 00 00 00 00       	mov    $0x0,%eax
  401e36:	e8 91 fb ff ff       	callq  4019cc <check_fail>
  401e3b:	ba 05 00 00 00       	mov    $0x5,%edx
  401e40:	be b8 32 40 00       	mov    $0x4032b8,%esi
  401e45:	bf 01 00 00 00       	mov    $0x1,%edi
  401e4a:	b8 00 00 00 00       	mov    $0x0,%eax
  401e4f:	e8 cc ee ff ff       	callq  400d20 <__printf_chk@plt>
  401e54:	be 00 00 00 00       	mov    $0x0,%esi
  401e59:	bf 00 00 00 00       	mov    $0x0,%edi
  401e5e:	e8 f0 fb ff ff       	callq  401a53 <notify_server>
  401e63:	bf 01 00 00 00       	mov    $0x1,%edi
  401e68:	e8 f3 ee ff ff       	callq  400d60 <exit@plt>

0000000000401e6d <launch>:
  401e6d:	55                   	push   %rbp
  401e6e:	48 89 e5             	mov    %rsp,%rbp
  401e71:	48 83 ec 10          	sub    $0x10,%rsp
  401e75:	48 89 fa             	mov    %rdi,%rdx
  401e78:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401e7f:	00 00 
  401e81:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401e85:	31 c0                	xor    %eax,%eax
  401e87:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401e8b:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401e8f:	48 29 c4             	sub    %rax,%rsp
  401e92:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401e97:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401e9b:	be f4 00 00 00       	mov    $0xf4,%esi
  401ea0:	e8 9b ed ff ff       	callq  400c40 <memset@plt>
  401ea5:	48 8b 05 f4 35 20 00 	mov    0x2035f4(%rip),%rax        # 6054a0 <stdin@@GLIBC_2.2.5>
  401eac:	48 39 05 3d 36 20 00 	cmp    %rax,0x20363d(%rip)        # 6054f0 <infile>
  401eb3:	75 14                	jne    401ec9 <launch+0x5c>
  401eb5:	be 24 31 40 00       	mov    $0x403124,%esi
  401eba:	bf 01 00 00 00       	mov    $0x1,%edi
  401ebf:	b8 00 00 00 00       	mov    $0x0,%eax
  401ec4:	e8 57 ee ff ff       	callq  400d20 <__printf_chk@plt>
  401ec9:	c7 05 29 36 20 00 00 	movl   $0x0,0x203629(%rip)        # 6054fc <vlevel>
  401ed0:	00 00 00 
  401ed3:	b8 00 00 00 00       	mov    $0x0,%eax
  401ed8:	e8 3b f9 ff ff       	callq  401818 <test>
  401edd:	83 3d 24 36 20 00 00 	cmpl   $0x0,0x203624(%rip)        # 605508 <is_checker>
  401ee4:	74 14                	je     401efa <launch+0x8d>
  401ee6:	bf 31 31 40 00       	mov    $0x403131,%edi
  401eeb:	e8 10 ed ff ff       	callq  400c00 <puts@plt>
  401ef0:	b8 00 00 00 00       	mov    $0x0,%eax
  401ef5:	e8 d2 fa ff ff       	callq  4019cc <check_fail>
  401efa:	bf 3c 31 40 00       	mov    $0x40313c,%edi
  401eff:	e8 fc ec ff ff       	callq  400c00 <puts@plt>
  401f04:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401f08:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401f0f:	00 00 
  401f11:	74 05                	je     401f18 <launch+0xab>
  401f13:	e8 08 ed ff ff       	callq  400c20 <__stack_chk_fail@plt>
  401f18:	c9                   	leaveq 
  401f19:	c3                   	retq   

0000000000401f1a <stable_launch>:
  401f1a:	53                   	push   %rbx
  401f1b:	48 89 3d c6 35 20 00 	mov    %rdi,0x2035c6(%rip)        # 6054e8 <global_offset>
  401f22:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401f28:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401f2e:	b9 32 01 00 00       	mov    $0x132,%ecx
  401f33:	ba 07 00 00 00       	mov    $0x7,%edx
  401f38:	be 00 00 10 00       	mov    $0x100000,%esi
  401f3d:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401f42:	e8 e9 ec ff ff       	callq  400c30 <mmap@plt>
  401f47:	48 89 c3             	mov    %rax,%rbx
  401f4a:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  401f50:	74 37                	je     401f89 <stable_launch+0x6f>
  401f52:	be 00 00 10 00       	mov    $0x100000,%esi
  401f57:	48 89 c7             	mov    %rax,%rdi
  401f5a:	e8 b1 ed ff ff       	callq  400d10 <munmap@plt>
  401f5f:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  401f64:	ba f0 32 40 00       	mov    $0x4032f0,%edx
  401f69:	be 01 00 00 00       	mov    $0x1,%esi
  401f6e:	48 8b 3d 4b 35 20 00 	mov    0x20354b(%rip),%rdi        # 6054c0 <stderr@@GLIBC_2.2.5>
  401f75:	b8 00 00 00 00       	mov    $0x0,%eax
  401f7a:	e8 01 ee ff ff       	callq  400d80 <__fprintf_chk@plt>
  401f7f:	bf 01 00 00 00       	mov    $0x1,%edi
  401f84:	e8 d7 ed ff ff       	callq  400d60 <exit@plt>
  401f89:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  401f90:	48 89 15 99 41 20 00 	mov    %rdx,0x204199(%rip)        # 606130 <stack_top>
  401f97:	48 89 e0             	mov    %rsp,%rax
  401f9a:	48 89 d4             	mov    %rdx,%rsp
  401f9d:	48 89 c2             	mov    %rax,%rdx
  401fa0:	48 89 15 39 35 20 00 	mov    %rdx,0x203539(%rip)        # 6054e0 <global_save_stack>
  401fa7:	48 8b 3d 3a 35 20 00 	mov    0x20353a(%rip),%rdi        # 6054e8 <global_offset>
  401fae:	e8 ba fe ff ff       	callq  401e6d <launch>
  401fb3:	48 8b 05 26 35 20 00 	mov    0x203526(%rip),%rax        # 6054e0 <global_save_stack>
  401fba:	48 89 c4             	mov    %rax,%rsp
  401fbd:	be 00 00 10 00       	mov    $0x100000,%esi
  401fc2:	48 89 df             	mov    %rbx,%rdi
  401fc5:	e8 46 ed ff ff       	callq  400d10 <munmap@plt>
  401fca:	5b                   	pop    %rbx
  401fcb:	c3                   	retq   

0000000000401fcc <rio_readinitb>:
  401fcc:	89 37                	mov    %esi,(%rdi)
  401fce:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401fd5:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401fd9:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401fdd:	c3                   	retq   

0000000000401fde <sigalrm_handler>:
  401fde:	48 83 ec 08          	sub    $0x8,%rsp
  401fe2:	b9 00 00 00 00       	mov    $0x0,%ecx
  401fe7:	ba 30 33 40 00       	mov    $0x403330,%edx
  401fec:	be 01 00 00 00       	mov    $0x1,%esi
  401ff1:	48 8b 3d c8 34 20 00 	mov    0x2034c8(%rip),%rdi        # 6054c0 <stderr@@GLIBC_2.2.5>
  401ff8:	b8 00 00 00 00       	mov    $0x0,%eax
  401ffd:	e8 7e ed ff ff       	callq  400d80 <__fprintf_chk@plt>
  402002:	bf 01 00 00 00       	mov    $0x1,%edi
  402007:	e8 54 ed ff ff       	callq  400d60 <exit@plt>

000000000040200c <rio_writen>:
  40200c:	41 55                	push   %r13
  40200e:	41 54                	push   %r12
  402010:	55                   	push   %rbp
  402011:	53                   	push   %rbx
  402012:	48 83 ec 08          	sub    $0x8,%rsp
  402016:	41 89 fc             	mov    %edi,%r12d
  402019:	48 89 f5             	mov    %rsi,%rbp
  40201c:	49 89 d5             	mov    %rdx,%r13
  40201f:	48 89 d3             	mov    %rdx,%rbx
  402022:	eb 28                	jmp    40204c <rio_writen+0x40>
  402024:	48 89 da             	mov    %rbx,%rdx
  402027:	48 89 ee             	mov    %rbp,%rsi
  40202a:	44 89 e7             	mov    %r12d,%edi
  40202d:	e8 de eb ff ff       	callq  400c10 <write@plt>
  402032:	48 85 c0             	test   %rax,%rax
  402035:	7f 0f                	jg     402046 <rio_writen+0x3a>
  402037:	e8 84 eb ff ff       	callq  400bc0 <__errno_location@plt>
  40203c:	83 38 04             	cmpl   $0x4,(%rax)
  40203f:	75 15                	jne    402056 <rio_writen+0x4a>
  402041:	b8 00 00 00 00       	mov    $0x0,%eax
  402046:	48 29 c3             	sub    %rax,%rbx
  402049:	48 01 c5             	add    %rax,%rbp
  40204c:	48 85 db             	test   %rbx,%rbx
  40204f:	75 d3                	jne    402024 <rio_writen+0x18>
  402051:	4c 89 e8             	mov    %r13,%rax
  402054:	eb 07                	jmp    40205d <rio_writen+0x51>
  402056:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40205d:	48 83 c4 08          	add    $0x8,%rsp
  402061:	5b                   	pop    %rbx
  402062:	5d                   	pop    %rbp
  402063:	41 5c                	pop    %r12
  402065:	41 5d                	pop    %r13
  402067:	c3                   	retq   

0000000000402068 <rio_read>:
  402068:	41 55                	push   %r13
  40206a:	41 54                	push   %r12
  40206c:	55                   	push   %rbp
  40206d:	53                   	push   %rbx
  40206e:	48 83 ec 08          	sub    $0x8,%rsp
  402072:	48 89 fb             	mov    %rdi,%rbx
  402075:	49 89 f5             	mov    %rsi,%r13
  402078:	49 89 d4             	mov    %rdx,%r12
  40207b:	eb 2e                	jmp    4020ab <rio_read+0x43>
  40207d:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  402081:	8b 3b                	mov    (%rbx),%edi
  402083:	ba 00 20 00 00       	mov    $0x2000,%edx
  402088:	48 89 ee             	mov    %rbp,%rsi
  40208b:	e8 e0 eb ff ff       	callq  400c70 <read@plt>
  402090:	89 43 04             	mov    %eax,0x4(%rbx)
  402093:	85 c0                	test   %eax,%eax
  402095:	79 0c                	jns    4020a3 <rio_read+0x3b>
  402097:	e8 24 eb ff ff       	callq  400bc0 <__errno_location@plt>
  40209c:	83 38 04             	cmpl   $0x4,(%rax)
  40209f:	74 0a                	je     4020ab <rio_read+0x43>
  4020a1:	eb 37                	jmp    4020da <rio_read+0x72>
  4020a3:	85 c0                	test   %eax,%eax
  4020a5:	74 3c                	je     4020e3 <rio_read+0x7b>
  4020a7:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4020ab:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4020ae:	85 ed                	test   %ebp,%ebp
  4020b0:	7e cb                	jle    40207d <rio_read+0x15>
  4020b2:	89 e8                	mov    %ebp,%eax
  4020b4:	49 39 c4             	cmp    %rax,%r12
  4020b7:	77 03                	ja     4020bc <rio_read+0x54>
  4020b9:	44 89 e5             	mov    %r12d,%ebp
  4020bc:	4c 63 e5             	movslq %ebp,%r12
  4020bf:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4020c3:	4c 89 e2             	mov    %r12,%rdx
  4020c6:	4c 89 ef             	mov    %r13,%rdi
  4020c9:	e8 f2 eb ff ff       	callq  400cc0 <memcpy@plt>
  4020ce:	4c 01 63 08          	add    %r12,0x8(%rbx)
  4020d2:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4020d5:	4c 89 e0             	mov    %r12,%rax
  4020d8:	eb 0e                	jmp    4020e8 <rio_read+0x80>
  4020da:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4020e1:	eb 05                	jmp    4020e8 <rio_read+0x80>
  4020e3:	b8 00 00 00 00       	mov    $0x0,%eax
  4020e8:	48 83 c4 08          	add    $0x8,%rsp
  4020ec:	5b                   	pop    %rbx
  4020ed:	5d                   	pop    %rbp
  4020ee:	41 5c                	pop    %r12
  4020f0:	41 5d                	pop    %r13
  4020f2:	c3                   	retq   

00000000004020f3 <rio_readlineb>:
  4020f3:	41 55                	push   %r13
  4020f5:	41 54                	push   %r12
  4020f7:	55                   	push   %rbp
  4020f8:	53                   	push   %rbx
  4020f9:	48 83 ec 18          	sub    $0x18,%rsp
  4020fd:	49 89 fd             	mov    %rdi,%r13
  402100:	48 89 f5             	mov    %rsi,%rbp
  402103:	49 89 d4             	mov    %rdx,%r12
  402106:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40210d:	00 00 
  40210f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402114:	31 c0                	xor    %eax,%eax
  402116:	bb 01 00 00 00       	mov    $0x1,%ebx
  40211b:	eb 3f                	jmp    40215c <rio_readlineb+0x69>
  40211d:	ba 01 00 00 00       	mov    $0x1,%edx
  402122:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  402127:	4c 89 ef             	mov    %r13,%rdi
  40212a:	e8 39 ff ff ff       	callq  402068 <rio_read>
  40212f:	83 f8 01             	cmp    $0x1,%eax
  402132:	75 15                	jne    402149 <rio_readlineb+0x56>
  402134:	48 8d 45 01          	lea    0x1(%rbp),%rax
  402138:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  40213d:	88 55 00             	mov    %dl,0x0(%rbp)
  402140:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  402145:	75 0e                	jne    402155 <rio_readlineb+0x62>
  402147:	eb 1a                	jmp    402163 <rio_readlineb+0x70>
  402149:	85 c0                	test   %eax,%eax
  40214b:	75 22                	jne    40216f <rio_readlineb+0x7c>
  40214d:	48 83 fb 01          	cmp    $0x1,%rbx
  402151:	75 13                	jne    402166 <rio_readlineb+0x73>
  402153:	eb 23                	jmp    402178 <rio_readlineb+0x85>
  402155:	48 83 c3 01          	add    $0x1,%rbx
  402159:	48 89 c5             	mov    %rax,%rbp
  40215c:	4c 39 e3             	cmp    %r12,%rbx
  40215f:	72 bc                	jb     40211d <rio_readlineb+0x2a>
  402161:	eb 03                	jmp    402166 <rio_readlineb+0x73>
  402163:	48 89 c5             	mov    %rax,%rbp
  402166:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  40216a:	48 89 d8             	mov    %rbx,%rax
  40216d:	eb 0e                	jmp    40217d <rio_readlineb+0x8a>
  40216f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402176:	eb 05                	jmp    40217d <rio_readlineb+0x8a>
  402178:	b8 00 00 00 00       	mov    $0x0,%eax
  40217d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  402182:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402189:	00 00 
  40218b:	74 05                	je     402192 <rio_readlineb+0x9f>
  40218d:	e8 8e ea ff ff       	callq  400c20 <__stack_chk_fail@plt>
  402192:	48 83 c4 18          	add    $0x18,%rsp
  402196:	5b                   	pop    %rbx
  402197:	5d                   	pop    %rbp
  402198:	41 5c                	pop    %r12
  40219a:	41 5d                	pop    %r13
  40219c:	c3                   	retq   

000000000040219d <urlencode>:
  40219d:	41 54                	push   %r12
  40219f:	55                   	push   %rbp
  4021a0:	53                   	push   %rbx
  4021a1:	48 83 ec 10          	sub    $0x10,%rsp
  4021a5:	48 89 fb             	mov    %rdi,%rbx
  4021a8:	48 89 f5             	mov    %rsi,%rbp
  4021ab:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4021b2:	00 00 
  4021b4:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4021b9:	31 c0                	xor    %eax,%eax
  4021bb:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4021c2:	f2 ae                	repnz scas %es:(%rdi),%al
  4021c4:	48 f7 d1             	not    %rcx
  4021c7:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4021ca:	e9 aa 00 00 00       	jmpq   402279 <urlencode+0xdc>
  4021cf:	44 0f b6 03          	movzbl (%rbx),%r8d
  4021d3:	41 80 f8 2a          	cmp    $0x2a,%r8b
  4021d7:	0f 94 c2             	sete   %dl
  4021da:	41 80 f8 2d          	cmp    $0x2d,%r8b
  4021de:	0f 94 c0             	sete   %al
  4021e1:	08 c2                	or     %al,%dl
  4021e3:	75 24                	jne    402209 <urlencode+0x6c>
  4021e5:	41 80 f8 2e          	cmp    $0x2e,%r8b
  4021e9:	74 1e                	je     402209 <urlencode+0x6c>
  4021eb:	41 80 f8 5f          	cmp    $0x5f,%r8b
  4021ef:	74 18                	je     402209 <urlencode+0x6c>
  4021f1:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  4021f5:	3c 09                	cmp    $0x9,%al
  4021f7:	76 10                	jbe    402209 <urlencode+0x6c>
  4021f9:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  4021fd:	3c 19                	cmp    $0x19,%al
  4021ff:	76 08                	jbe    402209 <urlencode+0x6c>
  402201:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  402205:	3c 19                	cmp    $0x19,%al
  402207:	77 0a                	ja     402213 <urlencode+0x76>
  402209:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  40220d:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402211:	eb 5f                	jmp    402272 <urlencode+0xd5>
  402213:	41 80 f8 20          	cmp    $0x20,%r8b
  402217:	75 0a                	jne    402223 <urlencode+0x86>
  402219:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  40221d:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402221:	eb 4f                	jmp    402272 <urlencode+0xd5>
  402223:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  402227:	3c 5f                	cmp    $0x5f,%al
  402229:	0f 96 c2             	setbe  %dl
  40222c:	41 80 f8 09          	cmp    $0x9,%r8b
  402230:	0f 94 c0             	sete   %al
  402233:	08 c2                	or     %al,%dl
  402235:	74 50                	je     402287 <urlencode+0xea>
  402237:	45 0f b6 c0          	movzbl %r8b,%r8d
  40223b:	b9 c8 33 40 00       	mov    $0x4033c8,%ecx
  402240:	ba 08 00 00 00       	mov    $0x8,%edx
  402245:	be 01 00 00 00       	mov    $0x1,%esi
  40224a:	48 89 e7             	mov    %rsp,%rdi
  40224d:	b8 00 00 00 00       	mov    $0x0,%eax
  402252:	e8 39 eb ff ff       	callq  400d90 <__sprintf_chk@plt>
  402257:	0f b6 04 24          	movzbl (%rsp),%eax
  40225b:	88 45 00             	mov    %al,0x0(%rbp)
  40225e:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  402263:	88 45 01             	mov    %al,0x1(%rbp)
  402266:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  40226b:	88 45 02             	mov    %al,0x2(%rbp)
  40226e:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  402272:	48 83 c3 01          	add    $0x1,%rbx
  402276:	44 89 e0             	mov    %r12d,%eax
  402279:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  40227d:	85 c0                	test   %eax,%eax
  40227f:	0f 85 4a ff ff ff    	jne    4021cf <urlencode+0x32>
  402285:	eb 05                	jmp    40228c <urlencode+0xef>
  402287:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40228c:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  402291:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  402298:	00 00 
  40229a:	74 05                	je     4022a1 <urlencode+0x104>
  40229c:	e8 7f e9 ff ff       	callq  400c20 <__stack_chk_fail@plt>
  4022a1:	48 83 c4 10          	add    $0x10,%rsp
  4022a5:	5b                   	pop    %rbx
  4022a6:	5d                   	pop    %rbp
  4022a7:	41 5c                	pop    %r12
  4022a9:	c3                   	retq   

00000000004022aa <submitr>:
  4022aa:	41 57                	push   %r15
  4022ac:	41 56                	push   %r14
  4022ae:	41 55                	push   %r13
  4022b0:	41 54                	push   %r12
  4022b2:	55                   	push   %rbp
  4022b3:	53                   	push   %rbx
  4022b4:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  4022bb:	49 89 ff             	mov    %rdi,%r15
  4022be:	89 74 24 04          	mov    %esi,0x4(%rsp)
  4022c2:	49 89 d6             	mov    %rdx,%r14
  4022c5:	49 89 cd             	mov    %rcx,%r13
  4022c8:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  4022cd:	4d 89 cc             	mov    %r9,%r12
  4022d0:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  4022d7:	00 
  4022d8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4022df:	00 00 
  4022e1:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  4022e8:	00 
  4022e9:	31 c0                	xor    %eax,%eax
  4022eb:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  4022f2:	00 
  4022f3:	ba 00 00 00 00       	mov    $0x0,%edx
  4022f8:	be 01 00 00 00       	mov    $0x1,%esi
  4022fd:	bf 02 00 00 00       	mov    $0x2,%edi
  402302:	e8 99 ea ff ff       	callq  400da0 <socket@plt>
  402307:	85 c0                	test   %eax,%eax
  402309:	79 4e                	jns    402359 <submitr+0xaf>
  40230b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402312:	3a 20 43 
  402315:	48 89 03             	mov    %rax,(%rbx)
  402318:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40231f:	20 75 6e 
  402322:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402326:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40232d:	74 6f 20 
  402330:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402334:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  40233b:	65 20 73 
  40233e:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402342:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402349:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  40234f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402354:	e9 0a 06 00 00       	jmpq   402963 <submitr+0x6b9>
  402359:	89 c5                	mov    %eax,%ebp
  40235b:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  402362:	bf cf 33 40 00       	mov    $0x4033cf,%edi
  402367:	b8 00 00 00 00       	mov    $0x0,%eax
  40236c:	e8 1f e9 ff ff       	callq  400c90 <inet_addr@plt>
  402371:	89 44 24 24          	mov    %eax,0x24(%rsp)
  402375:	0f b7 44 24 04       	movzwl 0x4(%rsp),%eax
  40237a:	66 c1 c8 08          	ror    $0x8,%ax
  40237e:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  402383:	ba 10 00 00 00       	mov    $0x10,%edx
  402388:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  40238d:	89 ef                	mov    %ebp,%edi
  40238f:	e8 dc e9 ff ff       	callq  400d70 <connect@plt>
  402394:	85 c0                	test   %eax,%eax
  402396:	79 59                	jns    4023f1 <submitr+0x147>
  402398:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  40239f:	3a 20 55 
  4023a2:	48 89 03             	mov    %rax,(%rbx)
  4023a5:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  4023ac:	20 74 6f 
  4023af:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4023b3:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  4023ba:	65 63 74 
  4023bd:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4023c1:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  4023c8:	68 65 20 
  4023cb:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4023cf:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  4023d6:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  4023dc:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  4023e0:	89 ef                	mov    %ebp,%edi
  4023e2:	e8 79 e8 ff ff       	callq  400c60 <close@plt>
  4023e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023ec:	e9 72 05 00 00       	jmpq   402963 <submitr+0x6b9>
  4023f1:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  4023f8:	b8 00 00 00 00       	mov    $0x0,%eax
  4023fd:	48 89 f1             	mov    %rsi,%rcx
  402400:	4c 89 e7             	mov    %r12,%rdi
  402403:	f2 ae                	repnz scas %es:(%rdi),%al
  402405:	48 f7 d1             	not    %rcx
  402408:	48 89 ca             	mov    %rcx,%rdx
  40240b:	48 89 f1             	mov    %rsi,%rcx
  40240e:	4c 89 f7             	mov    %r14,%rdi
  402411:	f2 ae                	repnz scas %es:(%rdi),%al
  402413:	48 f7 d1             	not    %rcx
  402416:	49 89 c8             	mov    %rcx,%r8
  402419:	48 89 f1             	mov    %rsi,%rcx
  40241c:	4c 89 ef             	mov    %r13,%rdi
  40241f:	f2 ae                	repnz scas %es:(%rdi),%al
  402421:	48 f7 d1             	not    %rcx
  402424:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  402429:	48 89 f1             	mov    %rsi,%rcx
  40242c:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402431:	f2 ae                	repnz scas %es:(%rdi),%al
  402433:	48 89 c8             	mov    %rcx,%rax
  402436:	48 f7 d0             	not    %rax
  402439:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  40243e:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  402443:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  40244a:	00 
  40244b:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  402451:	76 72                	jbe    4024c5 <submitr+0x21b>
  402453:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40245a:	3a 20 52 
  40245d:	48 89 03             	mov    %rax,(%rbx)
  402460:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402467:	20 73 74 
  40246a:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40246e:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  402475:	74 6f 6f 
  402478:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40247c:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  402483:	65 2e 20 
  402486:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40248a:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402491:	61 73 65 
  402494:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402498:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  40249f:	49 54 52 
  4024a2:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4024a6:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  4024ad:	55 46 00 
  4024b0:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4024b4:	89 ef                	mov    %ebp,%edi
  4024b6:	e8 a5 e7 ff ff       	callq  400c60 <close@plt>
  4024bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024c0:	e9 9e 04 00 00       	jmpq   402963 <submitr+0x6b9>
  4024c5:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  4024cc:	00 
  4024cd:	b9 00 04 00 00       	mov    $0x400,%ecx
  4024d2:	b8 00 00 00 00       	mov    $0x0,%eax
  4024d7:	48 89 f7             	mov    %rsi,%rdi
  4024da:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4024dd:	4c 89 e7             	mov    %r12,%rdi
  4024e0:	e8 b8 fc ff ff       	callq  40219d <urlencode>
  4024e5:	85 c0                	test   %eax,%eax
  4024e7:	0f 89 8a 00 00 00    	jns    402577 <submitr+0x2cd>
  4024ed:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4024f4:	3a 20 52 
  4024f7:	48 89 03             	mov    %rax,(%rbx)
  4024fa:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402501:	20 73 74 
  402504:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402508:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  40250f:	63 6f 6e 
  402512:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402516:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  40251d:	20 61 6e 
  402520:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402524:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  40252b:	67 61 6c 
  40252e:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402532:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  402539:	6e 70 72 
  40253c:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402540:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402547:	6c 65 20 
  40254a:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40254e:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  402555:	63 74 65 
  402558:	48 89 43 38          	mov    %rax,0x38(%rbx)
  40255c:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  402562:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  402566:	89 ef                	mov    %ebp,%edi
  402568:	e8 f3 e6 ff ff       	callq  400c60 <close@plt>
  40256d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402572:	e9 ec 03 00 00       	jmpq   402963 <submitr+0x6b9>
  402577:	4c 8d a4 24 40 20 00 	lea    0x2040(%rsp),%r12
  40257e:	00 
  40257f:	41 57                	push   %r15
  402581:	48 8d 84 24 48 40 00 	lea    0x4048(%rsp),%rax
  402588:	00 
  402589:	50                   	push   %rax
  40258a:	4d 89 f1             	mov    %r14,%r9
  40258d:	4d 89 e8             	mov    %r13,%r8
  402590:	b9 58 33 40 00       	mov    $0x403358,%ecx
  402595:	ba 00 20 00 00       	mov    $0x2000,%edx
  40259a:	be 01 00 00 00       	mov    $0x1,%esi
  40259f:	4c 89 e7             	mov    %r12,%rdi
  4025a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4025a7:	e8 e4 e7 ff ff       	callq  400d90 <__sprintf_chk@plt>
  4025ac:	b8 00 00 00 00       	mov    $0x0,%eax
  4025b1:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4025b8:	4c 89 e7             	mov    %r12,%rdi
  4025bb:	f2 ae                	repnz scas %es:(%rdi),%al
  4025bd:	48 f7 d1             	not    %rcx
  4025c0:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  4025c4:	4c 89 e6             	mov    %r12,%rsi
  4025c7:	89 ef                	mov    %ebp,%edi
  4025c9:	e8 3e fa ff ff       	callq  40200c <rio_writen>
  4025ce:	48 83 c4 10          	add    $0x10,%rsp
  4025d2:	48 85 c0             	test   %rax,%rax
  4025d5:	79 6e                	jns    402645 <submitr+0x39b>
  4025d7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4025de:	3a 20 43 
  4025e1:	48 89 03             	mov    %rax,(%rbx)
  4025e4:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4025eb:	20 75 6e 
  4025ee:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4025f2:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4025f9:	74 6f 20 
  4025fc:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402600:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  402607:	20 74 6f 
  40260a:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40260e:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  402615:	72 65 73 
  402618:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40261c:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  402623:	65 72 76 
  402626:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40262a:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  402630:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  402634:	89 ef                	mov    %ebp,%edi
  402636:	e8 25 e6 ff ff       	callq  400c60 <close@plt>
  40263b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402640:	e9 1e 03 00 00       	jmpq   402963 <submitr+0x6b9>
  402645:	89 ee                	mov    %ebp,%esi
  402647:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40264c:	e8 7b f9 ff ff       	callq  401fcc <rio_readinitb>
  402651:	ba 00 20 00 00       	mov    $0x2000,%edx
  402656:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  40265d:	00 
  40265e:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402663:	e8 8b fa ff ff       	callq  4020f3 <rio_readlineb>
  402668:	48 85 c0             	test   %rax,%rax
  40266b:	7f 7d                	jg     4026ea <submitr+0x440>
  40266d:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402674:	3a 20 43 
  402677:	48 89 03             	mov    %rax,(%rbx)
  40267a:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402681:	20 75 6e 
  402684:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402688:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40268f:	74 6f 20 
  402692:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402696:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  40269d:	66 69 72 
  4026a0:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026a4:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  4026ab:	61 64 65 
  4026ae:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4026b2:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  4026b9:	6d 20 72 
  4026bc:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4026c0:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  4026c7:	20 73 65 
  4026ca:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4026ce:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  4026d5:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  4026d9:	89 ef                	mov    %ebp,%edi
  4026db:	e8 80 e5 ff ff       	callq  400c60 <close@plt>
  4026e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026e5:	e9 79 02 00 00       	jmpq   402963 <submitr+0x6b9>
  4026ea:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  4026f1:	00 
  4026f2:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  4026f7:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  4026fe:	00 
  4026ff:	be de 33 40 00       	mov    $0x4033de,%esi
  402704:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  40270b:	00 
  40270c:	b8 00 00 00 00       	mov    $0x0,%eax
  402711:	e8 ea e5 ff ff       	callq  400d00 <__isoc99_sscanf@plt>
  402716:	e9 95 00 00 00       	jmpq   4027b0 <submitr+0x506>
  40271b:	ba 00 20 00 00       	mov    $0x2000,%edx
  402720:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402727:	00 
  402728:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40272d:	e8 c1 f9 ff ff       	callq  4020f3 <rio_readlineb>
  402732:	48 85 c0             	test   %rax,%rax
  402735:	7f 79                	jg     4027b0 <submitr+0x506>
  402737:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40273e:	3a 20 43 
  402741:	48 89 03             	mov    %rax,(%rbx)
  402744:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40274b:	20 75 6e 
  40274e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402752:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402759:	74 6f 20 
  40275c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402760:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402767:	68 65 61 
  40276a:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40276e:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402775:	66 72 6f 
  402778:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40277c:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  402783:	20 72 65 
  402786:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40278a:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  402791:	73 65 72 
  402794:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402798:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  40279f:	89 ef                	mov    %ebp,%edi
  4027a1:	e8 ba e4 ff ff       	callq  400c60 <close@plt>
  4027a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027ab:	e9 b3 01 00 00       	jmpq   402963 <submitr+0x6b9>
  4027b0:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  4027b7:	00 
  4027b8:	b8 0d 00 00 00       	mov    $0xd,%eax
  4027bd:	29 d0                	sub    %edx,%eax
  4027bf:	75 1b                	jne    4027dc <submitr+0x532>
  4027c1:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  4027c8:	00 
  4027c9:	b8 0a 00 00 00       	mov    $0xa,%eax
  4027ce:	29 d0                	sub    %edx,%eax
  4027d0:	75 0a                	jne    4027dc <submitr+0x532>
  4027d2:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  4027d9:	00 
  4027da:	f7 d8                	neg    %eax
  4027dc:	85 c0                	test   %eax,%eax
  4027de:	0f 85 37 ff ff ff    	jne    40271b <submitr+0x471>
  4027e4:	ba 00 20 00 00       	mov    $0x2000,%edx
  4027e9:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4027f0:	00 
  4027f1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4027f6:	e8 f8 f8 ff ff       	callq  4020f3 <rio_readlineb>
  4027fb:	48 85 c0             	test   %rax,%rax
  4027fe:	0f 8f 83 00 00 00    	jg     402887 <submitr+0x5dd>
  402804:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40280b:	3a 20 43 
  40280e:	48 89 03             	mov    %rax,(%rbx)
  402811:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402818:	20 75 6e 
  40281b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40281f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402826:	74 6f 20 
  402829:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40282d:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402834:	73 74 61 
  402837:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40283b:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402842:	65 73 73 
  402845:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402849:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402850:	72 6f 6d 
  402853:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402857:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  40285e:	6c 74 20 
  402861:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402865:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  40286c:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402872:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402876:	89 ef                	mov    %ebp,%edi
  402878:	e8 e3 e3 ff ff       	callq  400c60 <close@plt>
  40287d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402882:	e9 dc 00 00 00       	jmpq   402963 <submitr+0x6b9>
  402887:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  40288c:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402893:	74 37                	je     4028cc <submitr+0x622>
  402895:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  40289c:	00 
  40289d:	b9 98 33 40 00       	mov    $0x403398,%ecx
  4028a2:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4028a9:	be 01 00 00 00       	mov    $0x1,%esi
  4028ae:	48 89 df             	mov    %rbx,%rdi
  4028b1:	b8 00 00 00 00       	mov    $0x0,%eax
  4028b6:	e8 d5 e4 ff ff       	callq  400d90 <__sprintf_chk@plt>
  4028bb:	89 ef                	mov    %ebp,%edi
  4028bd:	e8 9e e3 ff ff       	callq  400c60 <close@plt>
  4028c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028c7:	e9 97 00 00 00       	jmpq   402963 <submitr+0x6b9>
  4028cc:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4028d3:	00 
  4028d4:	48 89 df             	mov    %rbx,%rdi
  4028d7:	e8 14 e3 ff ff       	callq  400bf0 <strcpy@plt>
  4028dc:	89 ef                	mov    %ebp,%edi
  4028de:	e8 7d e3 ff ff       	callq  400c60 <close@plt>
  4028e3:	0f b6 03             	movzbl (%rbx),%eax
  4028e6:	ba 4f 00 00 00       	mov    $0x4f,%edx
  4028eb:	29 c2                	sub    %eax,%edx
  4028ed:	75 22                	jne    402911 <submitr+0x667>
  4028ef:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  4028f3:	b8 4b 00 00 00       	mov    $0x4b,%eax
  4028f8:	29 c8                	sub    %ecx,%eax
  4028fa:	75 17                	jne    402913 <submitr+0x669>
  4028fc:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402900:	b8 0a 00 00 00       	mov    $0xa,%eax
  402905:	29 c8                	sub    %ecx,%eax
  402907:	75 0a                	jne    402913 <submitr+0x669>
  402909:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  40290d:	f7 d8                	neg    %eax
  40290f:	eb 02                	jmp    402913 <submitr+0x669>
  402911:	89 d0                	mov    %edx,%eax
  402913:	85 c0                	test   %eax,%eax
  402915:	74 40                	je     402957 <submitr+0x6ad>
  402917:	bf ef 33 40 00       	mov    $0x4033ef,%edi
  40291c:	b9 05 00 00 00       	mov    $0x5,%ecx
  402921:	48 89 de             	mov    %rbx,%rsi
  402924:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402926:	0f 97 c0             	seta   %al
  402929:	0f 92 c1             	setb   %cl
  40292c:	29 c8                	sub    %ecx,%eax
  40292e:	0f be c0             	movsbl %al,%eax
  402931:	85 c0                	test   %eax,%eax
  402933:	74 2e                	je     402963 <submitr+0x6b9>
  402935:	85 d2                	test   %edx,%edx
  402937:	75 13                	jne    40294c <submitr+0x6a2>
  402939:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  40293d:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402942:	29 c2                	sub    %eax,%edx
  402944:	75 06                	jne    40294c <submitr+0x6a2>
  402946:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  40294a:	f7 da                	neg    %edx
  40294c:	85 d2                	test   %edx,%edx
  40294e:	75 0e                	jne    40295e <submitr+0x6b4>
  402950:	b8 00 00 00 00       	mov    $0x0,%eax
  402955:	eb 0c                	jmp    402963 <submitr+0x6b9>
  402957:	b8 00 00 00 00       	mov    $0x0,%eax
  40295c:	eb 05                	jmp    402963 <submitr+0x6b9>
  40295e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402963:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  40296a:	00 
  40296b:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402972:	00 00 
  402974:	74 05                	je     40297b <submitr+0x6d1>
  402976:	e8 a5 e2 ff ff       	callq  400c20 <__stack_chk_fail@plt>
  40297b:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402982:	5b                   	pop    %rbx
  402983:	5d                   	pop    %rbp
  402984:	41 5c                	pop    %r12
  402986:	41 5d                	pop    %r13
  402988:	41 5e                	pop    %r14
  40298a:	41 5f                	pop    %r15
  40298c:	c3                   	retq   

000000000040298d <init_timeout>:
  40298d:	85 ff                	test   %edi,%edi
  40298f:	74 23                	je     4029b4 <init_timeout+0x27>
  402991:	53                   	push   %rbx
  402992:	89 fb                	mov    %edi,%ebx
  402994:	85 ff                	test   %edi,%edi
  402996:	79 05                	jns    40299d <init_timeout+0x10>
  402998:	bb 00 00 00 00       	mov    $0x0,%ebx
  40299d:	be de 1f 40 00       	mov    $0x401fde,%esi
  4029a2:	bf 0e 00 00 00       	mov    $0xe,%edi
  4029a7:	e8 f4 e2 ff ff       	callq  400ca0 <signal@plt>
  4029ac:	89 df                	mov    %ebx,%edi
  4029ae:	e8 9d e2 ff ff       	callq  400c50 <alarm@plt>
  4029b3:	5b                   	pop    %rbx
  4029b4:	f3 c3                	repz retq 

00000000004029b6 <init_driver>:
  4029b6:	55                   	push   %rbp
  4029b7:	53                   	push   %rbx
  4029b8:	48 83 ec 28          	sub    $0x28,%rsp
  4029bc:	48 89 fd             	mov    %rdi,%rbp
  4029bf:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4029c6:	00 00 
  4029c8:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  4029cd:	31 c0                	xor    %eax,%eax
  4029cf:	be 01 00 00 00       	mov    $0x1,%esi
  4029d4:	bf 0d 00 00 00       	mov    $0xd,%edi
  4029d9:	e8 c2 e2 ff ff       	callq  400ca0 <signal@plt>
  4029de:	be 01 00 00 00       	mov    $0x1,%esi
  4029e3:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4029e8:	e8 b3 e2 ff ff       	callq  400ca0 <signal@plt>
  4029ed:	be 01 00 00 00       	mov    $0x1,%esi
  4029f2:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4029f7:	e8 a4 e2 ff ff       	callq  400ca0 <signal@plt>
  4029fc:	ba 00 00 00 00       	mov    $0x0,%edx
  402a01:	be 01 00 00 00       	mov    $0x1,%esi
  402a06:	bf 02 00 00 00       	mov    $0x2,%edi
  402a0b:	e8 90 e3 ff ff       	callq  400da0 <socket@plt>
  402a10:	85 c0                	test   %eax,%eax
  402a12:	79 4f                	jns    402a63 <init_driver+0xad>
  402a14:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a1b:	3a 20 43 
  402a1e:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402a22:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402a29:	20 75 6e 
  402a2c:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402a30:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402a37:	74 6f 20 
  402a3a:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402a3e:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402a45:	65 20 73 
  402a48:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402a4c:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402a53:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402a59:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a5e:	e9 9b 00 00 00       	jmpq   402afe <init_driver+0x148>
  402a63:	89 c3                	mov    %eax,%ebx
  402a65:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402a6b:	bf cf 33 40 00       	mov    $0x4033cf,%edi
  402a70:	b8 00 00 00 00       	mov    $0x0,%eax
  402a75:	e8 16 e2 ff ff       	callq  400c90 <inet_addr@plt>
  402a7a:	89 44 24 04          	mov    %eax,0x4(%rsp)
  402a7e:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402a85:	ba 10 00 00 00       	mov    $0x10,%edx
  402a8a:	48 89 e6             	mov    %rsp,%rsi
  402a8d:	89 df                	mov    %ebx,%edi
  402a8f:	e8 dc e2 ff ff       	callq  400d70 <connect@plt>
  402a94:	85 c0                	test   %eax,%eax
  402a96:	79 50                	jns    402ae8 <init_driver+0x132>
  402a98:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402a9f:	3a 20 55 
  402aa2:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402aa6:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402aad:	20 74 6f 
  402ab0:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402ab4:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402abb:	65 63 74 
  402abe:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ac2:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402ac9:	65 72 76 
  402acc:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402ad0:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402ad6:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402ada:	89 df                	mov    %ebx,%edi
  402adc:	e8 7f e1 ff ff       	callq  400c60 <close@plt>
  402ae1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ae6:	eb 16                	jmp    402afe <init_driver+0x148>
  402ae8:	89 df                	mov    %ebx,%edi
  402aea:	e8 71 e1 ff ff       	callq  400c60 <close@plt>
  402aef:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402af5:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402af9:	b8 00 00 00 00       	mov    $0x0,%eax
  402afe:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402b03:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402b0a:	00 00 
  402b0c:	74 05                	je     402b13 <init_driver+0x15d>
  402b0e:	e8 0d e1 ff ff       	callq  400c20 <__stack_chk_fail@plt>
  402b13:	48 83 c4 28          	add    $0x28,%rsp
  402b17:	5b                   	pop    %rbx
  402b18:	5d                   	pop    %rbp
  402b19:	c3                   	retq   

0000000000402b1a <driver_post>:
  402b1a:	53                   	push   %rbx
  402b1b:	4c 89 cb             	mov    %r9,%rbx
  402b1e:	45 85 c0             	test   %r8d,%r8d
  402b21:	74 27                	je     402b4a <driver_post+0x30>
  402b23:	48 89 ca             	mov    %rcx,%rdx
  402b26:	be f4 33 40 00       	mov    $0x4033f4,%esi
  402b2b:	bf 01 00 00 00       	mov    $0x1,%edi
  402b30:	b8 00 00 00 00       	mov    $0x0,%eax
  402b35:	e8 e6 e1 ff ff       	callq  400d20 <__printf_chk@plt>
  402b3a:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402b3f:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402b43:	b8 00 00 00 00       	mov    $0x0,%eax
  402b48:	eb 3f                	jmp    402b89 <driver_post+0x6f>
  402b4a:	48 85 ff             	test   %rdi,%rdi
  402b4d:	74 2c                	je     402b7b <driver_post+0x61>
  402b4f:	80 3f 00             	cmpb   $0x0,(%rdi)
  402b52:	74 27                	je     402b7b <driver_post+0x61>
  402b54:	48 83 ec 08          	sub    $0x8,%rsp
  402b58:	41 51                	push   %r9
  402b5a:	49 89 c9             	mov    %rcx,%r9
  402b5d:	49 89 d0             	mov    %rdx,%r8
  402b60:	48 89 f9             	mov    %rdi,%rcx
  402b63:	48 89 f2             	mov    %rsi,%rdx
  402b66:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402b6b:	bf 0b 34 40 00       	mov    $0x40340b,%edi
  402b70:	e8 35 f7 ff ff       	callq  4022aa <submitr>
  402b75:	48 83 c4 10          	add    $0x10,%rsp
  402b79:	eb 0e                	jmp    402b89 <driver_post+0x6f>
  402b7b:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402b80:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402b84:	b8 00 00 00 00       	mov    $0x0,%eax
  402b89:	5b                   	pop    %rbx
  402b8a:	c3                   	retq   

0000000000402b8b <check>:
  402b8b:	89 f8                	mov    %edi,%eax
  402b8d:	c1 e8 1c             	shr    $0x1c,%eax
  402b90:	85 c0                	test   %eax,%eax
  402b92:	74 1d                	je     402bb1 <check+0x26>
  402b94:	b9 00 00 00 00       	mov    $0x0,%ecx
  402b99:	eb 0b                	jmp    402ba6 <check+0x1b>
  402b9b:	89 f8                	mov    %edi,%eax
  402b9d:	d3 e8                	shr    %cl,%eax
  402b9f:	3c 0a                	cmp    $0xa,%al
  402ba1:	74 14                	je     402bb7 <check+0x2c>
  402ba3:	83 c1 08             	add    $0x8,%ecx
  402ba6:	83 f9 1f             	cmp    $0x1f,%ecx
  402ba9:	7e f0                	jle    402b9b <check+0x10>
  402bab:	b8 01 00 00 00       	mov    $0x1,%eax
  402bb0:	c3                   	retq   
  402bb1:	b8 00 00 00 00       	mov    $0x0,%eax
  402bb6:	c3                   	retq   
  402bb7:	b8 00 00 00 00       	mov    $0x0,%eax
  402bbc:	c3                   	retq   

0000000000402bbd <gencookie>:
  402bbd:	53                   	push   %rbx
  402bbe:	83 c7 01             	add    $0x1,%edi
  402bc1:	e8 0a e0 ff ff       	callq  400bd0 <srandom@plt>
  402bc6:	e8 15 e1 ff ff       	callq  400ce0 <random@plt>
  402bcb:	89 c3                	mov    %eax,%ebx
  402bcd:	89 c7                	mov    %eax,%edi
  402bcf:	e8 b7 ff ff ff       	callq  402b8b <check>
  402bd4:	85 c0                	test   %eax,%eax
  402bd6:	74 ee                	je     402bc6 <gencookie+0x9>
  402bd8:	89 d8                	mov    %ebx,%eax
  402bda:	5b                   	pop    %rbx
  402bdb:	c3                   	retq   
  402bdc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402be0 <__libc_csu_init>:
  402be0:	41 57                	push   %r15
  402be2:	41 56                	push   %r14
  402be4:	41 89 ff             	mov    %edi,%r15d
  402be7:	41 55                	push   %r13
  402be9:	41 54                	push   %r12
  402beb:	4c 8d 25 1e 22 20 00 	lea    0x20221e(%rip),%r12        # 604e10 <__frame_dummy_init_array_entry>
  402bf2:	55                   	push   %rbp
  402bf3:	48 8d 2d 1e 22 20 00 	lea    0x20221e(%rip),%rbp        # 604e18 <__do_global_dtors_aux_fini_array_entry>
  402bfa:	53                   	push   %rbx
  402bfb:	49 89 f6             	mov    %rsi,%r14
  402bfe:	49 89 d5             	mov    %rdx,%r13
  402c01:	4c 29 e5             	sub    %r12,%rbp
  402c04:	48 83 ec 08          	sub    $0x8,%rsp
  402c08:	48 c1 fd 03          	sar    $0x3,%rbp
  402c0c:	e8 77 df ff ff       	callq  400b88 <_init>
  402c11:	48 85 ed             	test   %rbp,%rbp
  402c14:	74 20                	je     402c36 <__libc_csu_init+0x56>
  402c16:	31 db                	xor    %ebx,%ebx
  402c18:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402c1f:	00 
  402c20:	4c 89 ea             	mov    %r13,%rdx
  402c23:	4c 89 f6             	mov    %r14,%rsi
  402c26:	44 89 ff             	mov    %r15d,%edi
  402c29:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402c2d:	48 83 c3 01          	add    $0x1,%rbx
  402c31:	48 39 eb             	cmp    %rbp,%rbx
  402c34:	75 ea                	jne    402c20 <__libc_csu_init+0x40>
  402c36:	48 83 c4 08          	add    $0x8,%rsp
  402c3a:	5b                   	pop    %rbx
  402c3b:	5d                   	pop    %rbp
  402c3c:	41 5c                	pop    %r12
  402c3e:	41 5d                	pop    %r13
  402c40:	41 5e                	pop    %r14
  402c42:	41 5f                	pop    %r15
  402c44:	c3                   	retq   
  402c45:	90                   	nop
  402c46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402c4d:	00 00 00 

0000000000402c50 <__libc_csu_fini>:
  402c50:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402c54 <_fini>:
  402c54:	48 83 ec 08          	sub    $0x8,%rsp
  402c58:	48 83 c4 08          	add    $0x8,%rsp
  402c5c:	c3                   	retq   
