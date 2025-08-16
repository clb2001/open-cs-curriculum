
ctarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400b88 <_init>:
  400b88:	48 83 ec 08          	sub    $0x8,%rsp
  400b8c:	48 8b 05 65 34 20 00 	mov    0x203465(%rip),%rax        # 603ff8 <__gmon_start__>
  400b93:	48 85 c0             	test   %rax,%rax
  400b96:	74 05                	je     400b9d <_init+0x15>
  400b98:	e8 13 02 00 00       	callq  400db0 <__gmon_start__@plt>
  400b9d:	48 83 c4 08          	add    $0x8,%rsp
  400ba1:	c3                   	retq   

Disassembly of section .plt:

0000000000400bb0 <.plt>:
  400bb0:	ff 35 52 34 20 00    	pushq  0x203452(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400bb6:	ff 25 54 34 20 00    	jmpq   *0x203454(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400bbc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400bc0 <__errno_location@plt>:
  400bc0:	ff 25 52 34 20 00    	jmpq   *0x203452(%rip)        # 604018 <__errno_location@GLIBC_2.2.5>
  400bc6:	68 00 00 00 00       	pushq  $0x0
  400bcb:	e9 e0 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400bd0 <srandom@plt>:
  400bd0:	ff 25 4a 34 20 00    	jmpq   *0x20344a(%rip)        # 604020 <srandom@GLIBC_2.2.5>
  400bd6:	68 01 00 00 00       	pushq  $0x1
  400bdb:	e9 d0 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400be0 <strncmp@plt>:
  400be0:	ff 25 42 34 20 00    	jmpq   *0x203442(%rip)        # 604028 <strncmp@GLIBC_2.2.5>
  400be6:	68 02 00 00 00       	pushq  $0x2
  400beb:	e9 c0 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400bf0 <strcpy@plt>:
  400bf0:	ff 25 3a 34 20 00    	jmpq   *0x20343a(%rip)        # 604030 <strcpy@GLIBC_2.2.5>
  400bf6:	68 03 00 00 00       	pushq  $0x3
  400bfb:	e9 b0 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c00 <puts@plt>:
  400c00:	ff 25 32 34 20 00    	jmpq   *0x203432(%rip)        # 604038 <puts@GLIBC_2.2.5>
  400c06:	68 04 00 00 00       	pushq  $0x4
  400c0b:	e9 a0 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c10 <write@plt>:
  400c10:	ff 25 2a 34 20 00    	jmpq   *0x20342a(%rip)        # 604040 <write@GLIBC_2.2.5>
  400c16:	68 05 00 00 00       	pushq  $0x5
  400c1b:	e9 90 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c20 <__stack_chk_fail@plt>:
  400c20:	ff 25 22 34 20 00    	jmpq   *0x203422(%rip)        # 604048 <__stack_chk_fail@GLIBC_2.4>
  400c26:	68 06 00 00 00       	pushq  $0x6
  400c2b:	e9 80 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c30 <mmap@plt>:
  400c30:	ff 25 1a 34 20 00    	jmpq   *0x20341a(%rip)        # 604050 <mmap@GLIBC_2.2.5>
  400c36:	68 07 00 00 00       	pushq  $0x7
  400c3b:	e9 70 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c40 <memset@plt>:
  400c40:	ff 25 12 34 20 00    	jmpq   *0x203412(%rip)        # 604058 <memset@GLIBC_2.2.5>
  400c46:	68 08 00 00 00       	pushq  $0x8
  400c4b:	e9 60 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c50 <alarm@plt>:
  400c50:	ff 25 0a 34 20 00    	jmpq   *0x20340a(%rip)        # 604060 <alarm@GLIBC_2.2.5>
  400c56:	68 09 00 00 00       	pushq  $0x9
  400c5b:	e9 50 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c60 <close@plt>:
  400c60:	ff 25 02 34 20 00    	jmpq   *0x203402(%rip)        # 604068 <close@GLIBC_2.2.5>
  400c66:	68 0a 00 00 00       	pushq  $0xa
  400c6b:	e9 40 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c70 <read@plt>:
  400c70:	ff 25 fa 33 20 00    	jmpq   *0x2033fa(%rip)        # 604070 <read@GLIBC_2.2.5>
  400c76:	68 0b 00 00 00       	pushq  $0xb
  400c7b:	e9 30 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c80 <__libc_start_main@plt>:
  400c80:	ff 25 f2 33 20 00    	jmpq   *0x2033f2(%rip)        # 604078 <__libc_start_main@GLIBC_2.2.5>
  400c86:	68 0c 00 00 00       	pushq  $0xc
  400c8b:	e9 20 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400c90 <inet_addr@plt>:
  400c90:	ff 25 ea 33 20 00    	jmpq   *0x2033ea(%rip)        # 604080 <inet_addr@GLIBC_2.2.5>
  400c96:	68 0d 00 00 00       	pushq  $0xd
  400c9b:	e9 10 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400ca0 <signal@plt>:
  400ca0:	ff 25 e2 33 20 00    	jmpq   *0x2033e2(%rip)        # 604088 <signal@GLIBC_2.2.5>
  400ca6:	68 0e 00 00 00       	pushq  $0xe
  400cab:	e9 00 ff ff ff       	jmpq   400bb0 <.plt>

0000000000400cb0 <strtol@plt>:
  400cb0:	ff 25 da 33 20 00    	jmpq   *0x2033da(%rip)        # 604090 <strtol@GLIBC_2.2.5>
  400cb6:	68 0f 00 00 00       	pushq  $0xf
  400cbb:	e9 f0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400cc0 <memcpy@plt>:
  400cc0:	ff 25 d2 33 20 00    	jmpq   *0x2033d2(%rip)        # 604098 <memcpy@GLIBC_2.14>
  400cc6:	68 10 00 00 00       	pushq  $0x10
  400ccb:	e9 e0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400cd0 <time@plt>:
  400cd0:	ff 25 ca 33 20 00    	jmpq   *0x2033ca(%rip)        # 6040a0 <time@GLIBC_2.2.5>
  400cd6:	68 11 00 00 00       	pushq  $0x11
  400cdb:	e9 d0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400ce0 <random@plt>:
  400ce0:	ff 25 c2 33 20 00    	jmpq   *0x2033c2(%rip)        # 6040a8 <random@GLIBC_2.2.5>
  400ce6:	68 12 00 00 00       	pushq  $0x12
  400ceb:	e9 c0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400cf0 <_IO_getc@plt>:
  400cf0:	ff 25 ba 33 20 00    	jmpq   *0x2033ba(%rip)        # 6040b0 <_IO_getc@GLIBC_2.2.5>
  400cf6:	68 13 00 00 00       	pushq  $0x13
  400cfb:	e9 b0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d00 <__isoc99_sscanf@plt>:
  400d00:	ff 25 b2 33 20 00    	jmpq   *0x2033b2(%rip)        # 6040b8 <__isoc99_sscanf@GLIBC_2.7>
  400d06:	68 14 00 00 00       	pushq  $0x14
  400d0b:	e9 a0 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d10 <munmap@plt>:
  400d10:	ff 25 aa 33 20 00    	jmpq   *0x2033aa(%rip)        # 6040c0 <munmap@GLIBC_2.2.5>
  400d16:	68 15 00 00 00       	pushq  $0x15
  400d1b:	e9 90 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d20 <__printf_chk@plt>:
  400d20:	ff 25 a2 33 20 00    	jmpq   *0x2033a2(%rip)        # 6040c8 <__printf_chk@GLIBC_2.3.4>
  400d26:	68 16 00 00 00       	pushq  $0x16
  400d2b:	e9 80 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d30 <fopen@plt>:
  400d30:	ff 25 9a 33 20 00    	jmpq   *0x20339a(%rip)        # 6040d0 <fopen@GLIBC_2.2.5>
  400d36:	68 17 00 00 00       	pushq  $0x17
  400d3b:	e9 70 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d40 <getopt@plt>:
  400d40:	ff 25 92 33 20 00    	jmpq   *0x203392(%rip)        # 6040d8 <getopt@GLIBC_2.2.5>
  400d46:	68 18 00 00 00       	pushq  $0x18
  400d4b:	e9 60 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d50 <strtoul@plt>:
  400d50:	ff 25 8a 33 20 00    	jmpq   *0x20338a(%rip)        # 6040e0 <strtoul@GLIBC_2.2.5>
  400d56:	68 19 00 00 00       	pushq  $0x19
  400d5b:	e9 50 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d60 <exit@plt>:
  400d60:	ff 25 82 33 20 00    	jmpq   *0x203382(%rip)        # 6040e8 <exit@GLIBC_2.2.5>
  400d66:	68 1a 00 00 00       	pushq  $0x1a
  400d6b:	e9 40 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d70 <connect@plt>:
  400d70:	ff 25 7a 33 20 00    	jmpq   *0x20337a(%rip)        # 6040f0 <connect@GLIBC_2.2.5>
  400d76:	68 1b 00 00 00       	pushq  $0x1b
  400d7b:	e9 30 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d80 <__fprintf_chk@plt>:
  400d80:	ff 25 72 33 20 00    	jmpq   *0x203372(%rip)        # 6040f8 <__fprintf_chk@GLIBC_2.3.4>
  400d86:	68 1c 00 00 00       	pushq  $0x1c
  400d8b:	e9 20 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400d90 <__sprintf_chk@plt>:
  400d90:	ff 25 6a 33 20 00    	jmpq   *0x20336a(%rip)        # 604100 <__sprintf_chk@GLIBC_2.3.4>
  400d96:	68 1d 00 00 00       	pushq  $0x1d
  400d9b:	e9 10 fe ff ff       	jmpq   400bb0 <.plt>

0000000000400da0 <socket@plt>:
  400da0:	ff 25 62 33 20 00    	jmpq   *0x203362(%rip)        # 604108 <socket@GLIBC_2.2.5>
  400da6:	68 1e 00 00 00       	pushq  $0x1e
  400dab:	e9 00 fe ff ff       	jmpq   400bb0 <.plt>

Disassembly of section .plt.got:

0000000000400db0 <__gmon_start__@plt>:
  400db0:	ff 25 42 32 20 00    	jmpq   *0x203242(%rip)        # 603ff8 <__gmon_start__>
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
  400dcf:	49 c7 c0 30 2b 40 00 	mov    $0x402b30,%r8
  400dd6:	48 c7 c1 c0 2a 40 00 	mov    $0x402ac0,%rcx
  400ddd:	48 c7 c7 3c 10 40 00 	mov    $0x40103c,%rdi
  400de4:	e8 97 fe ff ff       	callq  400c80 <__libc_start_main@plt>
  400de9:	f4                   	hlt    
  400dea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400df0 <deregister_tm_clones>:
  400df0:	b8 97 44 60 00       	mov    $0x604497,%eax
  400df5:	55                   	push   %rbp
  400df6:	48 2d 90 44 60 00    	sub    $0x604490,%rax
  400dfc:	48 83 f8 0e          	cmp    $0xe,%rax
  400e00:	48 89 e5             	mov    %rsp,%rbp
  400e03:	76 1b                	jbe    400e20 <deregister_tm_clones+0x30>
  400e05:	b8 00 00 00 00       	mov    $0x0,%eax
  400e0a:	48 85 c0             	test   %rax,%rax
  400e0d:	74 11                	je     400e20 <deregister_tm_clones+0x30>
  400e0f:	5d                   	pop    %rbp
  400e10:	bf 90 44 60 00       	mov    $0x604490,%edi
  400e15:	ff e0                	jmpq   *%rax
  400e17:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400e1e:	00 00 
  400e20:	5d                   	pop    %rbp
  400e21:	c3                   	retq   
  400e22:	0f 1f 40 00          	nopl   0x0(%rax)
  400e26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e2d:	00 00 00 

0000000000400e30 <register_tm_clones>:
  400e30:	be 90 44 60 00       	mov    $0x604490,%esi
  400e35:	55                   	push   %rbp
  400e36:	48 81 ee 90 44 60 00 	sub    $0x604490,%rsi
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
  400e5e:	bf 90 44 60 00       	mov    $0x604490,%edi
  400e63:	ff e0                	jmpq   *%rax
  400e65:	0f 1f 00             	nopl   (%rax)
  400e68:	5d                   	pop    %rbp
  400e69:	c3                   	retq   
  400e6a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e70 <__do_global_dtors_aux>:
  400e70:	80 3d 51 36 20 00 00 	cmpb   $0x0,0x203651(%rip)        # 6044c8 <completed.7594>
  400e77:	75 11                	jne    400e8a <__do_global_dtors_aux+0x1a>
  400e79:	55                   	push   %rbp
  400e7a:	48 89 e5             	mov    %rsp,%rbp
  400e7d:	e8 6e ff ff ff       	callq  400df0 <deregister_tm_clones>
  400e82:	5d                   	pop    %rbp
  400e83:	c6 05 3e 36 20 00 01 	movb   $0x1,0x20363e(%rip)        # 6044c8 <completed.7594>
  400e8a:	f3 c3                	repz retq 
  400e8c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400e90 <frame_dummy>:
  400e90:	bf 20 3e 60 00       	mov    $0x603e20,%edi
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
  400ebd:	83 3d 44 36 20 00 00 	cmpl   $0x0,0x203644(%rip)        # 604508 <is_checker>
  400ec4:	74 3e                	je     400f04 <usage+0x4e>
  400ec6:	be 48 2b 40 00       	mov    $0x402b48,%esi
  400ecb:	bf 01 00 00 00       	mov    $0x1,%edi
  400ed0:	b8 00 00 00 00       	mov    $0x0,%eax
  400ed5:	e8 46 fe ff ff       	callq  400d20 <__printf_chk@plt>
  400eda:	bf 80 2b 40 00       	mov    $0x402b80,%edi
  400edf:	e8 1c fd ff ff       	callq  400c00 <puts@plt>
  400ee4:	bf 80 2c 40 00       	mov    $0x402c80,%edi
  400ee9:	e8 12 fd ff ff       	callq  400c00 <puts@plt>
  400eee:	bf a8 2b 40 00       	mov    $0x402ba8,%edi
  400ef3:	e8 08 fd ff ff       	callq  400c00 <puts@plt>
  400ef8:	bf 9a 2c 40 00       	mov    $0x402c9a,%edi
  400efd:	e8 fe fc ff ff       	callq  400c00 <puts@plt>
  400f02:	eb 32                	jmp    400f36 <usage+0x80>
  400f04:	be b6 2c 40 00       	mov    $0x402cb6,%esi
  400f09:	bf 01 00 00 00       	mov    $0x1,%edi
  400f0e:	b8 00 00 00 00       	mov    $0x0,%eax
  400f13:	e8 08 fe ff ff       	callq  400d20 <__printf_chk@plt>
  400f18:	bf d0 2b 40 00       	mov    $0x402bd0,%edi
  400f1d:	e8 de fc ff ff       	callq  400c00 <puts@plt>
  400f22:	bf f8 2b 40 00       	mov    $0x402bf8,%edi
  400f27:	e8 d4 fc ff ff       	callq  400c00 <puts@plt>
  400f2c:	bf d4 2c 40 00       	mov    $0x402cd4,%edi
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
  400f5e:	89 3d 94 35 20 00    	mov    %edi,0x203594(%rip)        # 6044f8 <check_level>
  400f64:	8b 3d de 31 20 00    	mov    0x2031de(%rip),%edi        # 604148 <target_id>
  400f6a:	e8 2e 1b 00 00       	callq  402a9d <gencookie>
  400f6f:	89 05 8f 35 20 00    	mov    %eax,0x20358f(%rip)        # 604504 <cookie>
  400f75:	89 c7                	mov    %eax,%edi
  400f77:	e8 21 1b 00 00       	callq  402a9d <gencookie>
  400f7c:	89 05 7e 35 20 00    	mov    %eax,0x20357e(%rip)        # 604500 <authkey>
  400f82:	8b 05 c0 31 20 00    	mov    0x2031c0(%rip),%eax        # 604148 <target_id>
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
  400fcd:	48 89 05 ac 34 20 00 	mov    %rax,0x2034ac(%rip)        # 604480 <buf_offset>
  400fd4:	c6 05 4d 41 20 00 63 	movb   $0x63,0x20414d(%rip)        # 605128 <target_prefix>
  400fdb:	83 3d a6 34 20 00 00 	cmpl   $0x0,0x2034a6(%rip)        # 604488 <notify>
  400fe2:	74 36                	je     40101a <initialize_target+0xda>
  400fe4:	83 3d 1d 35 20 00 00 	cmpl   $0x0,0x20351d(%rip)        # 604508 <is_checker>
  400feb:	75 2d                	jne    40101a <initialize_target+0xda>
  400fed:	48 89 e7             	mov    %rsp,%rdi
  400ff0:	e8 a1 18 00 00       	callq  402896 <init_driver>
  400ff5:	85 c0                	test   %eax,%eax
  400ff7:	79 21                	jns    40101a <initialize_target+0xda>
  400ff9:	48 89 e2             	mov    %rsp,%rdx
  400ffc:	be 28 2c 40 00       	mov    $0x402c28,%esi
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
  40104a:	be 5e 1c 40 00       	mov    $0x401c5e,%esi
  40104f:	bf 0b 00 00 00       	mov    $0xb,%edi
  401054:	e8 47 fc ff ff       	callq  400ca0 <signal@plt>
  401059:	be 10 1c 40 00       	mov    $0x401c10,%esi
  40105e:	bf 07 00 00 00       	mov    $0x7,%edi
  401063:	e8 38 fc ff ff       	callq  400ca0 <signal@plt>
  401068:	be ac 1c 40 00       	mov    $0x401cac,%esi
  40106d:	bf 04 00 00 00       	mov    $0x4,%edi
  401072:	e8 29 fc ff ff       	callq  400ca0 <signal@plt>
  401077:	83 3d 8a 34 20 00 00 	cmpl   $0x0,0x20348a(%rip)        # 604508 <is_checker>
  40107e:	74 20                	je     4010a0 <main+0x64>
  401080:	be fa 1c 40 00       	mov    $0x401cfa,%esi
  401085:	bf 0e 00 00 00       	mov    $0xe,%edi
  40108a:	e8 11 fc ff ff       	callq  400ca0 <signal@plt>
  40108f:	bf 05 00 00 00       	mov    $0x5,%edi
  401094:	e8 b7 fb ff ff       	callq  400c50 <alarm@plt>
  401099:	bd f2 2c 40 00       	mov    $0x402cf2,%ebp
  40109e:	eb 05                	jmp    4010a5 <main+0x69>
  4010a0:	bd ed 2c 40 00       	mov    $0x402ced,%ebp
  4010a5:	48 8b 05 f4 33 20 00 	mov    0x2033f4(%rip),%rax        # 6044a0 <stdin@@GLIBC_2.2.5>
  4010ac:	48 89 05 3d 34 20 00 	mov    %rax,0x20343d(%rip)        # 6044f0 <infile>
  4010b3:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  4010b9:	41 be 00 00 00 00    	mov    $0x0,%r14d
  4010bf:	e9 c6 00 00 00       	jmpq   40118a <main+0x14e>
  4010c4:	83 e8 61             	sub    $0x61,%eax
  4010c7:	3c 10                	cmp    $0x10,%al
  4010c9:	0f 87 9c 00 00 00    	ja     40116b <main+0x12f>
  4010cf:	0f b6 c0             	movzbl %al,%eax
  4010d2:	ff 24 c5 38 2d 40 00 	jmpq   *0x402d38(,%rax,8)
  4010d9:	48 8b 3b             	mov    (%rbx),%rdi
  4010dc:	e8 d5 fd ff ff       	callq  400eb6 <usage>
  4010e1:	be bd 2f 40 00       	mov    $0x402fbd,%esi
  4010e6:	48 8b 3d bb 33 20 00 	mov    0x2033bb(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  4010ed:	e8 3e fc ff ff       	callq  400d30 <fopen@plt>
  4010f2:	48 89 05 f7 33 20 00 	mov    %rax,0x2033f7(%rip)        # 6044f0 <infile>
  4010f9:	48 85 c0             	test   %rax,%rax
  4010fc:	0f 85 88 00 00 00    	jne    40118a <main+0x14e>
  401102:	48 8b 0d 9f 33 20 00 	mov    0x20339f(%rip),%rcx        # 6044a8 <optarg@@GLIBC_2.2.5>
  401109:	ba fa 2c 40 00       	mov    $0x402cfa,%edx
  40110e:	be 01 00 00 00       	mov    $0x1,%esi
  401113:	48 8b 3d a6 33 20 00 	mov    0x2033a6(%rip),%rdi        # 6044c0 <stderr@@GLIBC_2.2.5>
  40111a:	e8 61 fc ff ff       	callq  400d80 <__fprintf_chk@plt>
  40111f:	b8 01 00 00 00       	mov    $0x1,%eax
  401124:	e9 e4 00 00 00       	jmpq   40120d <main+0x1d1>
  401129:	ba 10 00 00 00       	mov    $0x10,%edx
  40112e:	be 00 00 00 00       	mov    $0x0,%esi
  401133:	48 8b 3d 6e 33 20 00 	mov    0x20336e(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  40113a:	e8 11 fc ff ff       	callq  400d50 <strtoul@plt>
  40113f:	41 89 c6             	mov    %eax,%r14d
  401142:	eb 46                	jmp    40118a <main+0x14e>
  401144:	ba 0a 00 00 00       	mov    $0xa,%edx
  401149:	be 00 00 00 00       	mov    $0x0,%esi
  40114e:	48 8b 3d 53 33 20 00 	mov    0x203353(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  401155:	e8 56 fb ff ff       	callq  400cb0 <strtol@plt>
  40115a:	41 89 c5             	mov    %eax,%r13d
  40115d:	eb 2b                	jmp    40118a <main+0x14e>
  40115f:	c7 05 1f 33 20 00 00 	movl   $0x0,0x20331f(%rip)        # 604488 <notify>
  401166:	00 00 00 
  401169:	eb 1f                	jmp    40118a <main+0x14e>
  40116b:	0f be d2             	movsbl %dl,%edx
  40116e:	be 17 2d 40 00       	mov    $0x402d17,%esi
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
  4011a2:	be 00 00 00 00       	mov    $0x0,%esi
  4011a7:	44 89 ef             	mov    %r13d,%edi
  4011aa:	e8 91 fd ff ff       	callq  400f40 <initialize_target>
  4011af:	83 3d 52 33 20 00 00 	cmpl   $0x0,0x203352(%rip)        # 604508 <is_checker>
  4011b6:	74 2a                	je     4011e2 <main+0x1a6>
  4011b8:	44 3b 35 41 33 20 00 	cmp    0x203341(%rip),%r14d        # 604500 <authkey>
  4011bf:	74 21                	je     4011e2 <main+0x1a6>
  4011c1:	44 89 f2             	mov    %r14d,%edx
  4011c4:	be 50 2c 40 00       	mov    $0x402c50,%esi
  4011c9:	bf 01 00 00 00       	mov    $0x1,%edi
  4011ce:	b8 00 00 00 00       	mov    $0x0,%eax
  4011d3:	e8 48 fb ff ff       	callq  400d20 <__printf_chk@plt>
  4011d8:	b8 00 00 00 00       	mov    $0x0,%eax
  4011dd:	e8 ca 06 00 00       	callq  4018ac <check_fail>
  4011e2:	8b 15 1c 33 20 00    	mov    0x20331c(%rip),%edx        # 604504 <cookie>
  4011e8:	be 2a 2d 40 00       	mov    $0x402d2a,%esi
  4011ed:	bf 01 00 00 00       	mov    $0x1,%edi
  4011f2:	b8 00 00 00 00       	mov    $0x0,%eax
  4011f7:	e8 24 fb ff ff       	callq  400d20 <__printf_chk@plt>
  4011fc:	48 8b 3d 7d 32 20 00 	mov    0x20327d(%rip),%rdi        # 604480 <buf_offset>
  401203:	e8 f2 0b 00 00       	callq  401dfa <stable_launch>
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
  40165e:	e8 7e 02 00 00       	callq  4018e1 <Gets>
  401663:	b8 01 00 00 00       	mov    $0x1,%eax
  401668:	48 83 c4 18          	add    $0x18,%rsp
  40166c:	c3                   	retq   

000000000040166d <touch1>:
  40166d:	48 83 ec 08          	sub    $0x8,%rsp
  401671:	c7 05 81 2e 20 00 01 	movl   $0x1,0x202e81(%rip)        # 6044fc <vlevel>
  401678:	00 00 00 
  40167b:	bf 13 2e 40 00       	mov    $0x402e13,%edi
  401680:	e8 7b f5 ff ff       	callq  400c00 <puts@plt>
  401685:	bf 01 00 00 00       	mov    $0x1,%edi
  40168a:	e8 97 04 00 00       	callq  401b26 <validate>
  40168f:	bf 00 00 00 00       	mov    $0x0,%edi
  401694:	e8 c7 f6 ff ff       	callq  400d60 <exit@plt>

0000000000401699 <touch2>:
  401699:	48 83 ec 08          	sub    $0x8,%rsp
  40169d:	89 fa                	mov    %edi,%edx
  40169f:	c7 05 53 2e 20 00 02 	movl   $0x2,0x202e53(%rip)        # 6044fc <vlevel>
  4016a6:	00 00 00 
  4016a9:	39 3d 55 2e 20 00    	cmp    %edi,0x202e55(%rip)        # 604504 <cookie>
  4016af:	75 20                	jne    4016d1 <touch2+0x38>
  4016b1:	be 38 2e 40 00       	mov    $0x402e38,%esi
  4016b6:	bf 01 00 00 00       	mov    $0x1,%edi
  4016bb:	b8 00 00 00 00       	mov    $0x0,%eax
  4016c0:	e8 5b f6 ff ff       	callq  400d20 <__printf_chk@plt>
  4016c5:	bf 02 00 00 00       	mov    $0x2,%edi
  4016ca:	e8 57 04 00 00       	callq  401b26 <validate>
  4016cf:	eb 1e                	jmp    4016ef <touch2+0x56>
  4016d1:	be 60 2e 40 00       	mov    $0x402e60,%esi
  4016d6:	bf 01 00 00 00       	mov    $0x1,%edi
  4016db:	b8 00 00 00 00       	mov    $0x0,%eax
  4016e0:	e8 3b f6 ff ff       	callq  400d20 <__printf_chk@plt>
  4016e5:	bf 02 00 00 00       	mov    $0x2,%edi
  4016ea:	e8 f9 04 00 00       	callq  401be8 <fail>
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
  401756:	b9 30 2e 40 00       	mov    $0x402e30,%ecx
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
  4017ae:	c7 05 44 2d 20 00 03 	movl   $0x3,0x202d44(%rip)        # 6044fc <vlevel>
  4017b5:	00 00 00 
  4017b8:	48 89 fe             	mov    %rdi,%rsi
  4017bb:	8b 3d 43 2d 20 00    	mov    0x202d43(%rip),%edi        # 604504 <cookie>
  4017c1:	e8 33 ff ff ff       	callq  4016f9 <hexmatch>
  4017c6:	85 c0                	test   %eax,%eax
  4017c8:	74 23                	je     4017ed <touch3+0x43>
  4017ca:	48 89 da             	mov    %rbx,%rdx
  4017cd:	be 88 2e 40 00       	mov    $0x402e88,%esi
  4017d2:	bf 01 00 00 00       	mov    $0x1,%edi
  4017d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4017dc:	e8 3f f5 ff ff       	callq  400d20 <__printf_chk@plt>
  4017e1:	bf 03 00 00 00       	mov    $0x3,%edi
  4017e6:	e8 3b 03 00 00       	callq  401b26 <validate>
  4017eb:	eb 21                	jmp    40180e <touch3+0x64>
  4017ed:	48 89 da             	mov    %rbx,%rdx
  4017f0:	be b0 2e 40 00       	mov    $0x402eb0,%esi
  4017f5:	bf 01 00 00 00       	mov    $0x1,%edi
  4017fa:	b8 00 00 00 00       	mov    $0x0,%eax
  4017ff:	e8 1c f5 ff ff       	callq  400d20 <__printf_chk@plt>
  401804:	bf 03 00 00 00       	mov    $0x3,%edi
  401809:	e8 da 03 00 00       	callq  401be8 <fail>
  40180e:	bf 00 00 00 00       	mov    $0x0,%edi
  401813:	e8 48 f5 ff ff       	callq  400d60 <exit@plt>

0000000000401818 <test>:
  401818:	48 83 ec 08          	sub    $0x8,%rsp
  40181c:	b8 00 00 00 00       	mov    $0x0,%eax
  401821:	e8 31 fe ff ff       	callq  401657 <getbuf>
  401826:	89 c2                	mov    %eax,%edx
  401828:	be d8 2e 40 00       	mov    $0x402ed8,%esi
  40182d:	bf 01 00 00 00       	mov    $0x1,%edi
  401832:	b8 00 00 00 00       	mov    $0x0,%eax
  401837:	e8 e4 f4 ff ff       	callq  400d20 <__printf_chk@plt>
  40183c:	48 83 c4 08          	add    $0x8,%rsp
  401840:	c3                   	retq   

0000000000401841 <save_char>:
  401841:	8b 05 dd 38 20 00    	mov    0x2038dd(%rip),%eax        # 605124 <gets_cnt>
  401847:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  40184c:	7f 49                	jg     401897 <save_char+0x56>
  40184e:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401851:	89 f9                	mov    %edi,%ecx
  401853:	c0 e9 04             	shr    $0x4,%cl
  401856:	83 e1 0f             	and    $0xf,%ecx
  401859:	0f b6 b1 00 32 40 00 	movzbl 0x403200(%rcx),%esi
  401860:	48 63 ca             	movslq %edx,%rcx
  401863:	40 88 b1 20 45 60 00 	mov    %sil,0x604520(%rcx)
  40186a:	8d 4a 01             	lea    0x1(%rdx),%ecx
  40186d:	83 e7 0f             	and    $0xf,%edi
  401870:	0f b6 b7 00 32 40 00 	movzbl 0x403200(%rdi),%esi
  401877:	48 63 c9             	movslq %ecx,%rcx
  40187a:	40 88 b1 20 45 60 00 	mov    %sil,0x604520(%rcx)
  401881:	83 c2 02             	add    $0x2,%edx
  401884:	48 63 d2             	movslq %edx,%rdx
  401887:	c6 82 20 45 60 00 20 	movb   $0x20,0x604520(%rdx)
  40188e:	83 c0 01             	add    $0x1,%eax
  401891:	89 05 8d 38 20 00    	mov    %eax,0x20388d(%rip)        # 605124 <gets_cnt>
  401897:	f3 c3                	repz retq 

0000000000401899 <save_term>:
  401899:	8b 05 85 38 20 00    	mov    0x203885(%rip),%eax        # 605124 <gets_cnt>
  40189f:	8d 04 40             	lea    (%rax,%rax,2),%eax
  4018a2:	48 98                	cltq   
  4018a4:	c6 80 20 45 60 00 00 	movb   $0x0,0x604520(%rax)
  4018ab:	c3                   	retq   

00000000004018ac <check_fail>:
  4018ac:	48 83 ec 08          	sub    $0x8,%rsp
  4018b0:	0f be 15 71 38 20 00 	movsbl 0x203871(%rip),%edx        # 605128 <target_prefix>
  4018b7:	41 b8 20 45 60 00    	mov    $0x604520,%r8d
  4018bd:	8b 0d 35 2c 20 00    	mov    0x202c35(%rip),%ecx        # 6044f8 <check_level>
  4018c3:	be fb 2e 40 00       	mov    $0x402efb,%esi
  4018c8:	bf 01 00 00 00       	mov    $0x1,%edi
  4018cd:	b8 00 00 00 00       	mov    $0x0,%eax
  4018d2:	e8 49 f4 ff ff       	callq  400d20 <__printf_chk@plt>
  4018d7:	bf 01 00 00 00       	mov    $0x1,%edi
  4018dc:	e8 7f f4 ff ff       	callq  400d60 <exit@plt>

00000000004018e1 <Gets>:
  4018e1:	41 54                	push   %r12
  4018e3:	55                   	push   %rbp
  4018e4:	53                   	push   %rbx
  4018e5:	49 89 fc             	mov    %rdi,%r12
  4018e8:	c7 05 32 38 20 00 00 	movl   $0x0,0x203832(%rip)        # 605124 <gets_cnt>
  4018ef:	00 00 00 
  4018f2:	48 89 fb             	mov    %rdi,%rbx
  4018f5:	eb 11                	jmp    401908 <Gets+0x27>
  4018f7:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  4018fb:	88 03                	mov    %al,(%rbx)
  4018fd:	0f b6 f8             	movzbl %al,%edi
  401900:	e8 3c ff ff ff       	callq  401841 <save_char>
  401905:	48 89 eb             	mov    %rbp,%rbx
  401908:	48 8b 3d e1 2b 20 00 	mov    0x202be1(%rip),%rdi        # 6044f0 <infile>
  40190f:	e8 dc f3 ff ff       	callq  400cf0 <_IO_getc@plt>
  401914:	83 f8 ff             	cmp    $0xffffffff,%eax
  401917:	74 05                	je     40191e <Gets+0x3d>
  401919:	83 f8 0a             	cmp    $0xa,%eax
  40191c:	75 d9                	jne    4018f7 <Gets+0x16>
  40191e:	c6 03 00             	movb   $0x0,(%rbx)
  401921:	b8 00 00 00 00       	mov    $0x0,%eax
  401926:	e8 6e ff ff ff       	callq  401899 <save_term>
  40192b:	4c 89 e0             	mov    %r12,%rax
  40192e:	5b                   	pop    %rbx
  40192f:	5d                   	pop    %rbp
  401930:	41 5c                	pop    %r12
  401932:	c3                   	retq   

0000000000401933 <notify_server>:
  401933:	53                   	push   %rbx
  401934:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  40193b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401942:	00 00 
  401944:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  40194b:	00 
  40194c:	31 c0                	xor    %eax,%eax
  40194e:	83 3d b3 2b 20 00 00 	cmpl   $0x0,0x202bb3(%rip)        # 604508 <is_checker>
  401955:	0f 85 aa 01 00 00    	jne    401b05 <notify_server+0x1d2>
  40195b:	89 fb                	mov    %edi,%ebx
  40195d:	8b 05 c1 37 20 00    	mov    0x2037c1(%rip),%eax        # 605124 <gets_cnt>
  401963:	83 c0 64             	add    $0x64,%eax
  401966:	3d 00 20 00 00       	cmp    $0x2000,%eax
  40196b:	7e 1e                	jle    40198b <notify_server+0x58>
  40196d:	be 30 30 40 00       	mov    $0x403030,%esi
  401972:	bf 01 00 00 00       	mov    $0x1,%edi
  401977:	b8 00 00 00 00       	mov    $0x0,%eax
  40197c:	e8 9f f3 ff ff       	callq  400d20 <__printf_chk@plt>
  401981:	bf 01 00 00 00       	mov    $0x1,%edi
  401986:	e8 d5 f3 ff ff       	callq  400d60 <exit@plt>
  40198b:	0f be 05 96 37 20 00 	movsbl 0x203796(%rip),%eax        # 605128 <target_prefix>
  401992:	83 3d ef 2a 20 00 00 	cmpl   $0x0,0x202aef(%rip)        # 604488 <notify>
  401999:	74 08                	je     4019a3 <notify_server+0x70>
  40199b:	8b 15 5f 2b 20 00    	mov    0x202b5f(%rip),%edx        # 604500 <authkey>
  4019a1:	eb 05                	jmp    4019a8 <notify_server+0x75>
  4019a3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  4019a8:	85 db                	test   %ebx,%ebx
  4019aa:	74 08                	je     4019b4 <notify_server+0x81>
  4019ac:	41 b9 11 2f 40 00    	mov    $0x402f11,%r9d
  4019b2:	eb 06                	jmp    4019ba <notify_server+0x87>
  4019b4:	41 b9 16 2f 40 00    	mov    $0x402f16,%r9d
  4019ba:	68 20 45 60 00       	pushq  $0x604520
  4019bf:	56                   	push   %rsi
  4019c0:	50                   	push   %rax
  4019c1:	52                   	push   %rdx
  4019c2:	44 8b 05 7f 27 20 00 	mov    0x20277f(%rip),%r8d        # 604148 <target_id>
  4019c9:	b9 1b 2f 40 00       	mov    $0x402f1b,%ecx
  4019ce:	ba 00 20 00 00       	mov    $0x2000,%edx
  4019d3:	be 01 00 00 00       	mov    $0x1,%esi
  4019d8:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  4019dd:	b8 00 00 00 00       	mov    $0x0,%eax
  4019e2:	e8 a9 f3 ff ff       	callq  400d90 <__sprintf_chk@plt>
  4019e7:	48 83 c4 20          	add    $0x20,%rsp
  4019eb:	83 3d 96 2a 20 00 00 	cmpl   $0x0,0x202a96(%rip)        # 604488 <notify>
  4019f2:	0f 84 81 00 00 00    	je     401a79 <notify_server+0x146>
  4019f8:	85 db                	test   %ebx,%ebx
  4019fa:	74 6e                	je     401a6a <notify_server+0x137>
  4019fc:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401a03:	00 
  401a04:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401a0a:	48 89 e1             	mov    %rsp,%rcx
  401a0d:	48 8b 15 3c 27 20 00 	mov    0x20273c(%rip),%rdx        # 604150 <lab>
  401a14:	48 8b 35 3d 27 20 00 	mov    0x20273d(%rip),%rsi        # 604158 <course>
  401a1b:	48 8b 3d 1e 27 20 00 	mov    0x20271e(%rip),%rdi        # 604140 <user_id>
  401a22:	e8 d3 0f 00 00       	callq  4029fa <driver_post>
  401a27:	85 c0                	test   %eax,%eax
  401a29:	79 26                	jns    401a51 <notify_server+0x11e>
  401a2b:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401a32:	00 
  401a33:	be 37 2f 40 00       	mov    $0x402f37,%esi
  401a38:	bf 01 00 00 00       	mov    $0x1,%edi
  401a3d:	b8 00 00 00 00       	mov    $0x0,%eax
  401a42:	e8 d9 f2 ff ff       	callq  400d20 <__printf_chk@plt>
  401a47:	bf 01 00 00 00       	mov    $0x1,%edi
  401a4c:	e8 0f f3 ff ff       	callq  400d60 <exit@plt>
  401a51:	bf 60 30 40 00       	mov    $0x403060,%edi
  401a56:	e8 a5 f1 ff ff       	callq  400c00 <puts@plt>
  401a5b:	bf 43 2f 40 00       	mov    $0x402f43,%edi
  401a60:	e8 9b f1 ff ff       	callq  400c00 <puts@plt>
  401a65:	e9 9b 00 00 00       	jmpq   401b05 <notify_server+0x1d2>
  401a6a:	bf 4d 2f 40 00       	mov    $0x402f4d,%edi
  401a6f:	e8 8c f1 ff ff       	callq  400c00 <puts@plt>
  401a74:	e9 8c 00 00 00       	jmpq   401b05 <notify_server+0x1d2>
  401a79:	85 db                	test   %ebx,%ebx
  401a7b:	74 07                	je     401a84 <notify_server+0x151>
  401a7d:	ba 11 2f 40 00       	mov    $0x402f11,%edx
  401a82:	eb 05                	jmp    401a89 <notify_server+0x156>
  401a84:	ba 16 2f 40 00       	mov    $0x402f16,%edx
  401a89:	be 98 30 40 00       	mov    $0x403098,%esi
  401a8e:	bf 01 00 00 00       	mov    $0x1,%edi
  401a93:	b8 00 00 00 00       	mov    $0x0,%eax
  401a98:	e8 83 f2 ff ff       	callq  400d20 <__printf_chk@plt>
  401a9d:	48 8b 15 9c 26 20 00 	mov    0x20269c(%rip),%rdx        # 604140 <user_id>
  401aa4:	be 54 2f 40 00       	mov    $0x402f54,%esi
  401aa9:	bf 01 00 00 00       	mov    $0x1,%edi
  401aae:	b8 00 00 00 00       	mov    $0x0,%eax
  401ab3:	e8 68 f2 ff ff       	callq  400d20 <__printf_chk@plt>
  401ab8:	48 8b 15 99 26 20 00 	mov    0x202699(%rip),%rdx        # 604158 <course>
  401abf:	be 61 2f 40 00       	mov    $0x402f61,%esi
  401ac4:	bf 01 00 00 00       	mov    $0x1,%edi
  401ac9:	b8 00 00 00 00       	mov    $0x0,%eax
  401ace:	e8 4d f2 ff ff       	callq  400d20 <__printf_chk@plt>
  401ad3:	48 8b 15 76 26 20 00 	mov    0x202676(%rip),%rdx        # 604150 <lab>
  401ada:	be 6d 2f 40 00       	mov    $0x402f6d,%esi
  401adf:	bf 01 00 00 00       	mov    $0x1,%edi
  401ae4:	b8 00 00 00 00       	mov    $0x0,%eax
  401ae9:	e8 32 f2 ff ff       	callq  400d20 <__printf_chk@plt>
  401aee:	48 89 e2             	mov    %rsp,%rdx
  401af1:	be 76 2f 40 00       	mov    $0x402f76,%esi
  401af6:	bf 01 00 00 00       	mov    $0x1,%edi
  401afb:	b8 00 00 00 00       	mov    $0x0,%eax
  401b00:	e8 1b f2 ff ff       	callq  400d20 <__printf_chk@plt>
  401b05:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  401b0c:	00 
  401b0d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401b14:	00 00 
  401b16:	74 05                	je     401b1d <notify_server+0x1ea>
  401b18:	e8 03 f1 ff ff       	callq  400c20 <__stack_chk_fail@plt>
  401b1d:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401b24:	5b                   	pop    %rbx
  401b25:	c3                   	retq   

0000000000401b26 <validate>:
  401b26:	53                   	push   %rbx
  401b27:	89 fb                	mov    %edi,%ebx
  401b29:	83 3d d8 29 20 00 00 	cmpl   $0x0,0x2029d8(%rip)        # 604508 <is_checker>
  401b30:	74 6b                	je     401b9d <validate+0x77>
  401b32:	39 3d c4 29 20 00    	cmp    %edi,0x2029c4(%rip)        # 6044fc <vlevel>
  401b38:	74 14                	je     401b4e <validate+0x28>
  401b3a:	bf 82 2f 40 00       	mov    $0x402f82,%edi
  401b3f:	e8 bc f0 ff ff       	callq  400c00 <puts@plt>
  401b44:	b8 00 00 00 00       	mov    $0x0,%eax
  401b49:	e8 5e fd ff ff       	callq  4018ac <check_fail>
  401b4e:	8b 15 a4 29 20 00    	mov    0x2029a4(%rip),%edx        # 6044f8 <check_level>
  401b54:	39 d7                	cmp    %edx,%edi
  401b56:	74 20                	je     401b78 <validate+0x52>
  401b58:	89 f9                	mov    %edi,%ecx
  401b5a:	be c0 30 40 00       	mov    $0x4030c0,%esi
  401b5f:	bf 01 00 00 00       	mov    $0x1,%edi
  401b64:	b8 00 00 00 00       	mov    $0x0,%eax
  401b69:	e8 b2 f1 ff ff       	callq  400d20 <__printf_chk@plt>
  401b6e:	b8 00 00 00 00       	mov    $0x0,%eax
  401b73:	e8 34 fd ff ff       	callq  4018ac <check_fail>
  401b78:	0f be 15 a9 35 20 00 	movsbl 0x2035a9(%rip),%edx        # 605128 <target_prefix>
  401b7f:	41 b8 20 45 60 00    	mov    $0x604520,%r8d
  401b85:	89 f9                	mov    %edi,%ecx
  401b87:	be a0 2f 40 00       	mov    $0x402fa0,%esi
  401b8c:	bf 01 00 00 00       	mov    $0x1,%edi
  401b91:	b8 00 00 00 00       	mov    $0x0,%eax
  401b96:	e8 85 f1 ff ff       	callq  400d20 <__printf_chk@plt>
  401b9b:	eb 49                	jmp    401be6 <validate+0xc0>
  401b9d:	3b 3d 59 29 20 00    	cmp    0x202959(%rip),%edi        # 6044fc <vlevel>
  401ba3:	74 18                	je     401bbd <validate+0x97>
  401ba5:	bf 82 2f 40 00       	mov    $0x402f82,%edi
  401baa:	e8 51 f0 ff ff       	callq  400c00 <puts@plt>
  401baf:	89 de                	mov    %ebx,%esi
  401bb1:	bf 00 00 00 00       	mov    $0x0,%edi
  401bb6:	e8 78 fd ff ff       	callq  401933 <notify_server>
  401bbb:	eb 29                	jmp    401be6 <validate+0xc0>
  401bbd:	0f be 0d 64 35 20 00 	movsbl 0x203564(%rip),%ecx        # 605128 <target_prefix>
  401bc4:	89 fa                	mov    %edi,%edx
  401bc6:	be e8 30 40 00       	mov    $0x4030e8,%esi
  401bcb:	bf 01 00 00 00       	mov    $0x1,%edi
  401bd0:	b8 00 00 00 00       	mov    $0x0,%eax
  401bd5:	e8 46 f1 ff ff       	callq  400d20 <__printf_chk@plt>
  401bda:	89 de                	mov    %ebx,%esi
  401bdc:	bf 01 00 00 00       	mov    $0x1,%edi
  401be1:	e8 4d fd ff ff       	callq  401933 <notify_server>
  401be6:	5b                   	pop    %rbx
  401be7:	c3                   	retq   

0000000000401be8 <fail>:
  401be8:	48 83 ec 08          	sub    $0x8,%rsp
  401bec:	83 3d 15 29 20 00 00 	cmpl   $0x0,0x202915(%rip)        # 604508 <is_checker>
  401bf3:	74 0a                	je     401bff <fail+0x17>
  401bf5:	b8 00 00 00 00       	mov    $0x0,%eax
  401bfa:	e8 ad fc ff ff       	callq  4018ac <check_fail>
  401bff:	89 fe                	mov    %edi,%esi
  401c01:	bf 00 00 00 00       	mov    $0x0,%edi
  401c06:	e8 28 fd ff ff       	callq  401933 <notify_server>
  401c0b:	48 83 c4 08          	add    $0x8,%rsp
  401c0f:	c3                   	retq   

0000000000401c10 <bushandler>:
  401c10:	48 83 ec 08          	sub    $0x8,%rsp
  401c14:	83 3d ed 28 20 00 00 	cmpl   $0x0,0x2028ed(%rip)        # 604508 <is_checker>
  401c1b:	74 14                	je     401c31 <bushandler+0x21>
  401c1d:	bf b5 2f 40 00       	mov    $0x402fb5,%edi
  401c22:	e8 d9 ef ff ff       	callq  400c00 <puts@plt>
  401c27:	b8 00 00 00 00       	mov    $0x0,%eax
  401c2c:	e8 7b fc ff ff       	callq  4018ac <check_fail>
  401c31:	bf 20 31 40 00       	mov    $0x403120,%edi
  401c36:	e8 c5 ef ff ff       	callq  400c00 <puts@plt>
  401c3b:	bf bf 2f 40 00       	mov    $0x402fbf,%edi
  401c40:	e8 bb ef ff ff       	callq  400c00 <puts@plt>
  401c45:	be 00 00 00 00       	mov    $0x0,%esi
  401c4a:	bf 00 00 00 00       	mov    $0x0,%edi
  401c4f:	e8 df fc ff ff       	callq  401933 <notify_server>
  401c54:	bf 01 00 00 00       	mov    $0x1,%edi
  401c59:	e8 02 f1 ff ff       	callq  400d60 <exit@plt>

0000000000401c5e <seghandler>:
  401c5e:	48 83 ec 08          	sub    $0x8,%rsp
  401c62:	83 3d 9f 28 20 00 00 	cmpl   $0x0,0x20289f(%rip)        # 604508 <is_checker>
  401c69:	74 14                	je     401c7f <seghandler+0x21>
  401c6b:	bf d5 2f 40 00       	mov    $0x402fd5,%edi
  401c70:	e8 8b ef ff ff       	callq  400c00 <puts@plt>
  401c75:	b8 00 00 00 00       	mov    $0x0,%eax
  401c7a:	e8 2d fc ff ff       	callq  4018ac <check_fail>
  401c7f:	bf 40 31 40 00       	mov    $0x403140,%edi
  401c84:	e8 77 ef ff ff       	callq  400c00 <puts@plt>
  401c89:	bf bf 2f 40 00       	mov    $0x402fbf,%edi
  401c8e:	e8 6d ef ff ff       	callq  400c00 <puts@plt>
  401c93:	be 00 00 00 00       	mov    $0x0,%esi
  401c98:	bf 00 00 00 00       	mov    $0x0,%edi
  401c9d:	e8 91 fc ff ff       	callq  401933 <notify_server>
  401ca2:	bf 01 00 00 00       	mov    $0x1,%edi
  401ca7:	e8 b4 f0 ff ff       	callq  400d60 <exit@plt>

0000000000401cac <illegalhandler>:
  401cac:	48 83 ec 08          	sub    $0x8,%rsp
  401cb0:	83 3d 51 28 20 00 00 	cmpl   $0x0,0x202851(%rip)        # 604508 <is_checker>
  401cb7:	74 14                	je     401ccd <illegalhandler+0x21>
  401cb9:	bf e8 2f 40 00       	mov    $0x402fe8,%edi
  401cbe:	e8 3d ef ff ff       	callq  400c00 <puts@plt>
  401cc3:	b8 00 00 00 00       	mov    $0x0,%eax
  401cc8:	e8 df fb ff ff       	callq  4018ac <check_fail>
  401ccd:	bf 68 31 40 00       	mov    $0x403168,%edi
  401cd2:	e8 29 ef ff ff       	callq  400c00 <puts@plt>
  401cd7:	bf bf 2f 40 00       	mov    $0x402fbf,%edi
  401cdc:	e8 1f ef ff ff       	callq  400c00 <puts@plt>
  401ce1:	be 00 00 00 00       	mov    $0x0,%esi
  401ce6:	bf 00 00 00 00       	mov    $0x0,%edi
  401ceb:	e8 43 fc ff ff       	callq  401933 <notify_server>
  401cf0:	bf 01 00 00 00       	mov    $0x1,%edi
  401cf5:	e8 66 f0 ff ff       	callq  400d60 <exit@plt>

0000000000401cfa <sigalrmhandler>:
  401cfa:	48 83 ec 08          	sub    $0x8,%rsp
  401cfe:	83 3d 03 28 20 00 00 	cmpl   $0x0,0x202803(%rip)        # 604508 <is_checker>
  401d05:	74 14                	je     401d1b <sigalrmhandler+0x21>
  401d07:	bf fc 2f 40 00       	mov    $0x402ffc,%edi
  401d0c:	e8 ef ee ff ff       	callq  400c00 <puts@plt>
  401d11:	b8 00 00 00 00       	mov    $0x0,%eax
  401d16:	e8 91 fb ff ff       	callq  4018ac <check_fail>
  401d1b:	ba 05 00 00 00       	mov    $0x5,%edx
  401d20:	be 98 31 40 00       	mov    $0x403198,%esi
  401d25:	bf 01 00 00 00       	mov    $0x1,%edi
  401d2a:	b8 00 00 00 00       	mov    $0x0,%eax
  401d2f:	e8 ec ef ff ff       	callq  400d20 <__printf_chk@plt>
  401d34:	be 00 00 00 00       	mov    $0x0,%esi
  401d39:	bf 00 00 00 00       	mov    $0x0,%edi
  401d3e:	e8 f0 fb ff ff       	callq  401933 <notify_server>
  401d43:	bf 01 00 00 00       	mov    $0x1,%edi
  401d48:	e8 13 f0 ff ff       	callq  400d60 <exit@plt>

0000000000401d4d <launch>:
  401d4d:	55                   	push   %rbp
  401d4e:	48 89 e5             	mov    %rsp,%rbp
  401d51:	48 83 ec 10          	sub    $0x10,%rsp
  401d55:	48 89 fa             	mov    %rdi,%rdx
  401d58:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401d5f:	00 00 
  401d61:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401d65:	31 c0                	xor    %eax,%eax
  401d67:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401d6b:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401d6f:	48 29 c4             	sub    %rax,%rsp
  401d72:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401d77:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401d7b:	be f4 00 00 00       	mov    $0xf4,%esi
  401d80:	e8 bb ee ff ff       	callq  400c40 <memset@plt>
  401d85:	48 8b 05 14 27 20 00 	mov    0x202714(%rip),%rax        # 6044a0 <stdin@@GLIBC_2.2.5>
  401d8c:	48 39 05 5d 27 20 00 	cmp    %rax,0x20275d(%rip)        # 6044f0 <infile>
  401d93:	75 14                	jne    401da9 <launch+0x5c>
  401d95:	be 04 30 40 00       	mov    $0x403004,%esi
  401d9a:	bf 01 00 00 00       	mov    $0x1,%edi
  401d9f:	b8 00 00 00 00       	mov    $0x0,%eax
  401da4:	e8 77 ef ff ff       	callq  400d20 <__printf_chk@plt>
  401da9:	c7 05 49 27 20 00 00 	movl   $0x0,0x202749(%rip)        # 6044fc <vlevel>
  401db0:	00 00 00 
  401db3:	b8 00 00 00 00       	mov    $0x0,%eax
  401db8:	e8 5b fa ff ff       	callq  401818 <test>
  401dbd:	83 3d 44 27 20 00 00 	cmpl   $0x0,0x202744(%rip)        # 604508 <is_checker>
  401dc4:	74 14                	je     401dda <launch+0x8d>
  401dc6:	bf 11 30 40 00       	mov    $0x403011,%edi
  401dcb:	e8 30 ee ff ff       	callq  400c00 <puts@plt>
  401dd0:	b8 00 00 00 00       	mov    $0x0,%eax
  401dd5:	e8 d2 fa ff ff       	callq  4018ac <check_fail>
  401dda:	bf 1c 30 40 00       	mov    $0x40301c,%edi
  401ddf:	e8 1c ee ff ff       	callq  400c00 <puts@plt>
  401de4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401de8:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401def:	00 00 
  401df1:	74 05                	je     401df8 <launch+0xab>
  401df3:	e8 28 ee ff ff       	callq  400c20 <__stack_chk_fail@plt>
  401df8:	c9                   	leaveq 
  401df9:	c3                   	retq   

0000000000401dfa <stable_launch>:
  401dfa:	53                   	push   %rbx
  401dfb:	48 89 3d e6 26 20 00 	mov    %rdi,0x2026e6(%rip)        # 6044e8 <global_offset>
  401e02:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401e08:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401e0e:	b9 32 01 00 00       	mov    $0x132,%ecx
  401e13:	ba 07 00 00 00       	mov    $0x7,%edx
  401e18:	be 00 00 10 00       	mov    $0x100000,%esi
  401e1d:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401e22:	e8 09 ee ff ff       	callq  400c30 <mmap@plt>
  401e27:	48 89 c3             	mov    %rax,%rbx
  401e2a:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  401e30:	74 37                	je     401e69 <stable_launch+0x6f>
  401e32:	be 00 00 10 00       	mov    $0x100000,%esi
  401e37:	48 89 c7             	mov    %rax,%rdi
  401e3a:	e8 d1 ee ff ff       	callq  400d10 <munmap@plt>
  401e3f:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  401e44:	ba d0 31 40 00       	mov    $0x4031d0,%edx
  401e49:	be 01 00 00 00       	mov    $0x1,%esi
  401e4e:	48 8b 3d 6b 26 20 00 	mov    0x20266b(%rip),%rdi        # 6044c0 <stderr@@GLIBC_2.2.5>
  401e55:	b8 00 00 00 00       	mov    $0x0,%eax
  401e5a:	e8 21 ef ff ff       	callq  400d80 <__fprintf_chk@plt>
  401e5f:	bf 01 00 00 00       	mov    $0x1,%edi
  401e64:	e8 f7 ee ff ff       	callq  400d60 <exit@plt>
  401e69:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  401e70:	48 89 15 b9 32 20 00 	mov    %rdx,0x2032b9(%rip)        # 605130 <stack_top>
  401e77:	48 89 e0             	mov    %rsp,%rax
  401e7a:	48 89 d4             	mov    %rdx,%rsp
  401e7d:	48 89 c2             	mov    %rax,%rdx
  401e80:	48 89 15 59 26 20 00 	mov    %rdx,0x202659(%rip)        # 6044e0 <global_save_stack>
  401e87:	48 8b 3d 5a 26 20 00 	mov    0x20265a(%rip),%rdi        # 6044e8 <global_offset>
  401e8e:	e8 ba fe ff ff       	callq  401d4d <launch>
  401e93:	48 8b 05 46 26 20 00 	mov    0x202646(%rip),%rax        # 6044e0 <global_save_stack>
  401e9a:	48 89 c4             	mov    %rax,%rsp
  401e9d:	be 00 00 10 00       	mov    $0x100000,%esi
  401ea2:	48 89 df             	mov    %rbx,%rdi
  401ea5:	e8 66 ee ff ff       	callq  400d10 <munmap@plt>
  401eaa:	5b                   	pop    %rbx
  401eab:	c3                   	retq   

0000000000401eac <rio_readinitb>:
  401eac:	89 37                	mov    %esi,(%rdi)
  401eae:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401eb5:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401eb9:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401ebd:	c3                   	retq   

0000000000401ebe <sigalrm_handler>:
  401ebe:	48 83 ec 08          	sub    $0x8,%rsp
  401ec2:	b9 00 00 00 00       	mov    $0x0,%ecx
  401ec7:	ba 10 32 40 00       	mov    $0x403210,%edx
  401ecc:	be 01 00 00 00       	mov    $0x1,%esi
  401ed1:	48 8b 3d e8 25 20 00 	mov    0x2025e8(%rip),%rdi        # 6044c0 <stderr@@GLIBC_2.2.5>
  401ed8:	b8 00 00 00 00       	mov    $0x0,%eax
  401edd:	e8 9e ee ff ff       	callq  400d80 <__fprintf_chk@plt>
  401ee2:	bf 01 00 00 00       	mov    $0x1,%edi
  401ee7:	e8 74 ee ff ff       	callq  400d60 <exit@plt>

0000000000401eec <rio_writen>:
  401eec:	41 55                	push   %r13
  401eee:	41 54                	push   %r12
  401ef0:	55                   	push   %rbp
  401ef1:	53                   	push   %rbx
  401ef2:	48 83 ec 08          	sub    $0x8,%rsp
  401ef6:	41 89 fc             	mov    %edi,%r12d
  401ef9:	48 89 f5             	mov    %rsi,%rbp
  401efc:	49 89 d5             	mov    %rdx,%r13
  401eff:	48 89 d3             	mov    %rdx,%rbx
  401f02:	eb 28                	jmp    401f2c <rio_writen+0x40>
  401f04:	48 89 da             	mov    %rbx,%rdx
  401f07:	48 89 ee             	mov    %rbp,%rsi
  401f0a:	44 89 e7             	mov    %r12d,%edi
  401f0d:	e8 fe ec ff ff       	callq  400c10 <write@plt>
  401f12:	48 85 c0             	test   %rax,%rax
  401f15:	7f 0f                	jg     401f26 <rio_writen+0x3a>
  401f17:	e8 a4 ec ff ff       	callq  400bc0 <__errno_location@plt>
  401f1c:	83 38 04             	cmpl   $0x4,(%rax)
  401f1f:	75 15                	jne    401f36 <rio_writen+0x4a>
  401f21:	b8 00 00 00 00       	mov    $0x0,%eax
  401f26:	48 29 c3             	sub    %rax,%rbx
  401f29:	48 01 c5             	add    %rax,%rbp
  401f2c:	48 85 db             	test   %rbx,%rbx
  401f2f:	75 d3                	jne    401f04 <rio_writen+0x18>
  401f31:	4c 89 e8             	mov    %r13,%rax
  401f34:	eb 07                	jmp    401f3d <rio_writen+0x51>
  401f36:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401f3d:	48 83 c4 08          	add    $0x8,%rsp
  401f41:	5b                   	pop    %rbx
  401f42:	5d                   	pop    %rbp
  401f43:	41 5c                	pop    %r12
  401f45:	41 5d                	pop    %r13
  401f47:	c3                   	retq   

0000000000401f48 <rio_read>:
  401f48:	41 55                	push   %r13
  401f4a:	41 54                	push   %r12
  401f4c:	55                   	push   %rbp
  401f4d:	53                   	push   %rbx
  401f4e:	48 83 ec 08          	sub    $0x8,%rsp
  401f52:	48 89 fb             	mov    %rdi,%rbx
  401f55:	49 89 f5             	mov    %rsi,%r13
  401f58:	49 89 d4             	mov    %rdx,%r12
  401f5b:	eb 2e                	jmp    401f8b <rio_read+0x43>
  401f5d:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  401f61:	8b 3b                	mov    (%rbx),%edi
  401f63:	ba 00 20 00 00       	mov    $0x2000,%edx
  401f68:	48 89 ee             	mov    %rbp,%rsi
  401f6b:	e8 00 ed ff ff       	callq  400c70 <read@plt>
  401f70:	89 43 04             	mov    %eax,0x4(%rbx)
  401f73:	85 c0                	test   %eax,%eax
  401f75:	79 0c                	jns    401f83 <rio_read+0x3b>
  401f77:	e8 44 ec ff ff       	callq  400bc0 <__errno_location@plt>
  401f7c:	83 38 04             	cmpl   $0x4,(%rax)
  401f7f:	74 0a                	je     401f8b <rio_read+0x43>
  401f81:	eb 37                	jmp    401fba <rio_read+0x72>
  401f83:	85 c0                	test   %eax,%eax
  401f85:	74 3c                	je     401fc3 <rio_read+0x7b>
  401f87:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  401f8b:	8b 6b 04             	mov    0x4(%rbx),%ebp
  401f8e:	85 ed                	test   %ebp,%ebp
  401f90:	7e cb                	jle    401f5d <rio_read+0x15>
  401f92:	89 e8                	mov    %ebp,%eax
  401f94:	49 39 c4             	cmp    %rax,%r12
  401f97:	77 03                	ja     401f9c <rio_read+0x54>
  401f99:	44 89 e5             	mov    %r12d,%ebp
  401f9c:	4c 63 e5             	movslq %ebp,%r12
  401f9f:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  401fa3:	4c 89 e2             	mov    %r12,%rdx
  401fa6:	4c 89 ef             	mov    %r13,%rdi
  401fa9:	e8 12 ed ff ff       	callq  400cc0 <memcpy@plt>
  401fae:	4c 01 63 08          	add    %r12,0x8(%rbx)
  401fb2:	29 6b 04             	sub    %ebp,0x4(%rbx)
  401fb5:	4c 89 e0             	mov    %r12,%rax
  401fb8:	eb 0e                	jmp    401fc8 <rio_read+0x80>
  401fba:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401fc1:	eb 05                	jmp    401fc8 <rio_read+0x80>
  401fc3:	b8 00 00 00 00       	mov    $0x0,%eax
  401fc8:	48 83 c4 08          	add    $0x8,%rsp
  401fcc:	5b                   	pop    %rbx
  401fcd:	5d                   	pop    %rbp
  401fce:	41 5c                	pop    %r12
  401fd0:	41 5d                	pop    %r13
  401fd2:	c3                   	retq   

0000000000401fd3 <rio_readlineb>:
  401fd3:	41 55                	push   %r13
  401fd5:	41 54                	push   %r12
  401fd7:	55                   	push   %rbp
  401fd8:	53                   	push   %rbx
  401fd9:	48 83 ec 18          	sub    $0x18,%rsp
  401fdd:	49 89 fd             	mov    %rdi,%r13
  401fe0:	48 89 f5             	mov    %rsi,%rbp
  401fe3:	49 89 d4             	mov    %rdx,%r12
  401fe6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401fed:	00 00 
  401fef:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401ff4:	31 c0                	xor    %eax,%eax
  401ff6:	bb 01 00 00 00       	mov    $0x1,%ebx
  401ffb:	eb 3f                	jmp    40203c <rio_readlineb+0x69>
  401ffd:	ba 01 00 00 00       	mov    $0x1,%edx
  402002:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  402007:	4c 89 ef             	mov    %r13,%rdi
  40200a:	e8 39 ff ff ff       	callq  401f48 <rio_read>
  40200f:	83 f8 01             	cmp    $0x1,%eax
  402012:	75 15                	jne    402029 <rio_readlineb+0x56>
  402014:	48 8d 45 01          	lea    0x1(%rbp),%rax
  402018:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  40201d:	88 55 00             	mov    %dl,0x0(%rbp)
  402020:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  402025:	75 0e                	jne    402035 <rio_readlineb+0x62>
  402027:	eb 1a                	jmp    402043 <rio_readlineb+0x70>
  402029:	85 c0                	test   %eax,%eax
  40202b:	75 22                	jne    40204f <rio_readlineb+0x7c>
  40202d:	48 83 fb 01          	cmp    $0x1,%rbx
  402031:	75 13                	jne    402046 <rio_readlineb+0x73>
  402033:	eb 23                	jmp    402058 <rio_readlineb+0x85>
  402035:	48 83 c3 01          	add    $0x1,%rbx
  402039:	48 89 c5             	mov    %rax,%rbp
  40203c:	4c 39 e3             	cmp    %r12,%rbx
  40203f:	72 bc                	jb     401ffd <rio_readlineb+0x2a>
  402041:	eb 03                	jmp    402046 <rio_readlineb+0x73>
  402043:	48 89 c5             	mov    %rax,%rbp
  402046:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  40204a:	48 89 d8             	mov    %rbx,%rax
  40204d:	eb 0e                	jmp    40205d <rio_readlineb+0x8a>
  40204f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402056:	eb 05                	jmp    40205d <rio_readlineb+0x8a>
  402058:	b8 00 00 00 00       	mov    $0x0,%eax
  40205d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  402062:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402069:	00 00 
  40206b:	74 05                	je     402072 <rio_readlineb+0x9f>
  40206d:	e8 ae eb ff ff       	callq  400c20 <__stack_chk_fail@plt>
  402072:	48 83 c4 18          	add    $0x18,%rsp
  402076:	5b                   	pop    %rbx
  402077:	5d                   	pop    %rbp
  402078:	41 5c                	pop    %r12
  40207a:	41 5d                	pop    %r13
  40207c:	c3                   	retq   

000000000040207d <urlencode>:
  40207d:	41 54                	push   %r12
  40207f:	55                   	push   %rbp
  402080:	53                   	push   %rbx
  402081:	48 83 ec 10          	sub    $0x10,%rsp
  402085:	48 89 fb             	mov    %rdi,%rbx
  402088:	48 89 f5             	mov    %rsi,%rbp
  40208b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402092:	00 00 
  402094:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402099:	31 c0                	xor    %eax,%eax
  40209b:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4020a2:	f2 ae                	repnz scas %es:(%rdi),%al
  4020a4:	48 f7 d1             	not    %rcx
  4020a7:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4020aa:	e9 aa 00 00 00       	jmpq   402159 <urlencode+0xdc>
  4020af:	44 0f b6 03          	movzbl (%rbx),%r8d
  4020b3:	41 80 f8 2a          	cmp    $0x2a,%r8b
  4020b7:	0f 94 c2             	sete   %dl
  4020ba:	41 80 f8 2d          	cmp    $0x2d,%r8b
  4020be:	0f 94 c0             	sete   %al
  4020c1:	08 c2                	or     %al,%dl
  4020c3:	75 24                	jne    4020e9 <urlencode+0x6c>
  4020c5:	41 80 f8 2e          	cmp    $0x2e,%r8b
  4020c9:	74 1e                	je     4020e9 <urlencode+0x6c>
  4020cb:	41 80 f8 5f          	cmp    $0x5f,%r8b
  4020cf:	74 18                	je     4020e9 <urlencode+0x6c>
  4020d1:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  4020d5:	3c 09                	cmp    $0x9,%al
  4020d7:	76 10                	jbe    4020e9 <urlencode+0x6c>
  4020d9:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  4020dd:	3c 19                	cmp    $0x19,%al
  4020df:	76 08                	jbe    4020e9 <urlencode+0x6c>
  4020e1:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  4020e5:	3c 19                	cmp    $0x19,%al
  4020e7:	77 0a                	ja     4020f3 <urlencode+0x76>
  4020e9:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  4020ed:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4020f1:	eb 5f                	jmp    402152 <urlencode+0xd5>
  4020f3:	41 80 f8 20          	cmp    $0x20,%r8b
  4020f7:	75 0a                	jne    402103 <urlencode+0x86>
  4020f9:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  4020fd:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402101:	eb 4f                	jmp    402152 <urlencode+0xd5>
  402103:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  402107:	3c 5f                	cmp    $0x5f,%al
  402109:	0f 96 c2             	setbe  %dl
  40210c:	41 80 f8 09          	cmp    $0x9,%r8b
  402110:	0f 94 c0             	sete   %al
  402113:	08 c2                	or     %al,%dl
  402115:	74 50                	je     402167 <urlencode+0xea>
  402117:	45 0f b6 c0          	movzbl %r8b,%r8d
  40211b:	b9 a8 32 40 00       	mov    $0x4032a8,%ecx
  402120:	ba 08 00 00 00       	mov    $0x8,%edx
  402125:	be 01 00 00 00       	mov    $0x1,%esi
  40212a:	48 89 e7             	mov    %rsp,%rdi
  40212d:	b8 00 00 00 00       	mov    $0x0,%eax
  402132:	e8 59 ec ff ff       	callq  400d90 <__sprintf_chk@plt>
  402137:	0f b6 04 24          	movzbl (%rsp),%eax
  40213b:	88 45 00             	mov    %al,0x0(%rbp)
  40213e:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  402143:	88 45 01             	mov    %al,0x1(%rbp)
  402146:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  40214b:	88 45 02             	mov    %al,0x2(%rbp)
  40214e:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  402152:	48 83 c3 01          	add    $0x1,%rbx
  402156:	44 89 e0             	mov    %r12d,%eax
  402159:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  40215d:	85 c0                	test   %eax,%eax
  40215f:	0f 85 4a ff ff ff    	jne    4020af <urlencode+0x32>
  402165:	eb 05                	jmp    40216c <urlencode+0xef>
  402167:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40216c:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  402171:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  402178:	00 00 
  40217a:	74 05                	je     402181 <urlencode+0x104>
  40217c:	e8 9f ea ff ff       	callq  400c20 <__stack_chk_fail@plt>
  402181:	48 83 c4 10          	add    $0x10,%rsp
  402185:	5b                   	pop    %rbx
  402186:	5d                   	pop    %rbp
  402187:	41 5c                	pop    %r12
  402189:	c3                   	retq   

000000000040218a <submitr>:
  40218a:	41 57                	push   %r15
  40218c:	41 56                	push   %r14
  40218e:	41 55                	push   %r13
  402190:	41 54                	push   %r12
  402192:	55                   	push   %rbp
  402193:	53                   	push   %rbx
  402194:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  40219b:	49 89 ff             	mov    %rdi,%r15
  40219e:	89 74 24 04          	mov    %esi,0x4(%rsp)
  4021a2:	49 89 d6             	mov    %rdx,%r14
  4021a5:	49 89 cd             	mov    %rcx,%r13
  4021a8:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  4021ad:	4d 89 cc             	mov    %r9,%r12
  4021b0:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  4021b7:	00 
  4021b8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4021bf:	00 00 
  4021c1:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  4021c8:	00 
  4021c9:	31 c0                	xor    %eax,%eax
  4021cb:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  4021d2:	00 
  4021d3:	ba 00 00 00 00       	mov    $0x0,%edx
  4021d8:	be 01 00 00 00       	mov    $0x1,%esi
  4021dd:	bf 02 00 00 00       	mov    $0x2,%edi
  4021e2:	e8 b9 eb ff ff       	callq  400da0 <socket@plt>
  4021e7:	85 c0                	test   %eax,%eax
  4021e9:	79 4e                	jns    402239 <submitr+0xaf>
  4021eb:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4021f2:	3a 20 43 
  4021f5:	48 89 03             	mov    %rax,(%rbx)
  4021f8:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4021ff:	20 75 6e 
  402202:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402206:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40220d:	74 6f 20 
  402210:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402214:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  40221b:	65 20 73 
  40221e:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402222:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402229:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  40222f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402234:	e9 0a 06 00 00       	jmpq   402843 <submitr+0x6b9>
  402239:	89 c5                	mov    %eax,%ebp
  40223b:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  402242:	bf af 32 40 00       	mov    $0x4032af,%edi
  402247:	b8 00 00 00 00       	mov    $0x0,%eax
  40224c:	e8 3f ea ff ff       	callq  400c90 <inet_addr@plt>
  402251:	89 44 24 24          	mov    %eax,0x24(%rsp)
  402255:	0f b7 44 24 04       	movzwl 0x4(%rsp),%eax
  40225a:	66 c1 c8 08          	ror    $0x8,%ax
  40225e:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  402263:	ba 10 00 00 00       	mov    $0x10,%edx
  402268:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  40226d:	89 ef                	mov    %ebp,%edi
  40226f:	e8 fc ea ff ff       	callq  400d70 <connect@plt>
  402274:	85 c0                	test   %eax,%eax
  402276:	79 59                	jns    4022d1 <submitr+0x147>
  402278:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  40227f:	3a 20 55 
  402282:	48 89 03             	mov    %rax,(%rbx)
  402285:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  40228c:	20 74 6f 
  40228f:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402293:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  40229a:	65 63 74 
  40229d:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4022a1:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  4022a8:	68 65 20 
  4022ab:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4022af:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  4022b6:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  4022bc:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  4022c0:	89 ef                	mov    %ebp,%edi
  4022c2:	e8 99 e9 ff ff       	callq  400c60 <close@plt>
  4022c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4022cc:	e9 72 05 00 00       	jmpq   402843 <submitr+0x6b9>
  4022d1:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  4022d8:	b8 00 00 00 00       	mov    $0x0,%eax
  4022dd:	48 89 f1             	mov    %rsi,%rcx
  4022e0:	4c 89 e7             	mov    %r12,%rdi
  4022e3:	f2 ae                	repnz scas %es:(%rdi),%al
  4022e5:	48 f7 d1             	not    %rcx
  4022e8:	48 89 ca             	mov    %rcx,%rdx
  4022eb:	48 89 f1             	mov    %rsi,%rcx
  4022ee:	4c 89 f7             	mov    %r14,%rdi
  4022f1:	f2 ae                	repnz scas %es:(%rdi),%al
  4022f3:	48 f7 d1             	not    %rcx
  4022f6:	49 89 c8             	mov    %rcx,%r8
  4022f9:	48 89 f1             	mov    %rsi,%rcx
  4022fc:	4c 89 ef             	mov    %r13,%rdi
  4022ff:	f2 ae                	repnz scas %es:(%rdi),%al
  402301:	48 f7 d1             	not    %rcx
  402304:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  402309:	48 89 f1             	mov    %rsi,%rcx
  40230c:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402311:	f2 ae                	repnz scas %es:(%rdi),%al
  402313:	48 89 c8             	mov    %rcx,%rax
  402316:	48 f7 d0             	not    %rax
  402319:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  40231e:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  402323:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  40232a:	00 
  40232b:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  402331:	76 72                	jbe    4023a5 <submitr+0x21b>
  402333:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40233a:	3a 20 52 
  40233d:	48 89 03             	mov    %rax,(%rbx)
  402340:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402347:	20 73 74 
  40234a:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40234e:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  402355:	74 6f 6f 
  402358:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40235c:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  402363:	65 2e 20 
  402366:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40236a:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402371:	61 73 65 
  402374:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402378:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  40237f:	49 54 52 
  402382:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402386:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  40238d:	55 46 00 
  402390:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402394:	89 ef                	mov    %ebp,%edi
  402396:	e8 c5 e8 ff ff       	callq  400c60 <close@plt>
  40239b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023a0:	e9 9e 04 00 00       	jmpq   402843 <submitr+0x6b9>
  4023a5:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  4023ac:	00 
  4023ad:	b9 00 04 00 00       	mov    $0x400,%ecx
  4023b2:	b8 00 00 00 00       	mov    $0x0,%eax
  4023b7:	48 89 f7             	mov    %rsi,%rdi
  4023ba:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4023bd:	4c 89 e7             	mov    %r12,%rdi
  4023c0:	e8 b8 fc ff ff       	callq  40207d <urlencode>
  4023c5:	85 c0                	test   %eax,%eax
  4023c7:	0f 89 8a 00 00 00    	jns    402457 <submitr+0x2cd>
  4023cd:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4023d4:	3a 20 52 
  4023d7:	48 89 03             	mov    %rax,(%rbx)
  4023da:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4023e1:	20 73 74 
  4023e4:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4023e8:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4023ef:	63 6f 6e 
  4023f2:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4023f6:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4023fd:	20 61 6e 
  402400:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402404:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  40240b:	67 61 6c 
  40240e:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402412:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  402419:	6e 70 72 
  40241c:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402420:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402427:	6c 65 20 
  40242a:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40242e:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  402435:	63 74 65 
  402438:	48 89 43 38          	mov    %rax,0x38(%rbx)
  40243c:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  402442:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  402446:	89 ef                	mov    %ebp,%edi
  402448:	e8 13 e8 ff ff       	callq  400c60 <close@plt>
  40244d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402452:	e9 ec 03 00 00       	jmpq   402843 <submitr+0x6b9>
  402457:	4c 8d a4 24 40 20 00 	lea    0x2040(%rsp),%r12
  40245e:	00 
  40245f:	41 57                	push   %r15
  402461:	48 8d 84 24 48 40 00 	lea    0x4048(%rsp),%rax
  402468:	00 
  402469:	50                   	push   %rax
  40246a:	4d 89 f1             	mov    %r14,%r9
  40246d:	4d 89 e8             	mov    %r13,%r8
  402470:	b9 38 32 40 00       	mov    $0x403238,%ecx
  402475:	ba 00 20 00 00       	mov    $0x2000,%edx
  40247a:	be 01 00 00 00       	mov    $0x1,%esi
  40247f:	4c 89 e7             	mov    %r12,%rdi
  402482:	b8 00 00 00 00       	mov    $0x0,%eax
  402487:	e8 04 e9 ff ff       	callq  400d90 <__sprintf_chk@plt>
  40248c:	b8 00 00 00 00       	mov    $0x0,%eax
  402491:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402498:	4c 89 e7             	mov    %r12,%rdi
  40249b:	f2 ae                	repnz scas %es:(%rdi),%al
  40249d:	48 f7 d1             	not    %rcx
  4024a0:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  4024a4:	4c 89 e6             	mov    %r12,%rsi
  4024a7:	89 ef                	mov    %ebp,%edi
  4024a9:	e8 3e fa ff ff       	callq  401eec <rio_writen>
  4024ae:	48 83 c4 10          	add    $0x10,%rsp
  4024b2:	48 85 c0             	test   %rax,%rax
  4024b5:	79 6e                	jns    402525 <submitr+0x39b>
  4024b7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4024be:	3a 20 43 
  4024c1:	48 89 03             	mov    %rax,(%rbx)
  4024c4:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4024cb:	20 75 6e 
  4024ce:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4024d2:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4024d9:	74 6f 20 
  4024dc:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4024e0:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  4024e7:	20 74 6f 
  4024ea:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4024ee:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  4024f5:	72 65 73 
  4024f8:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4024fc:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  402503:	65 72 76 
  402506:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40250a:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  402510:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  402514:	89 ef                	mov    %ebp,%edi
  402516:	e8 45 e7 ff ff       	callq  400c60 <close@plt>
  40251b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402520:	e9 1e 03 00 00       	jmpq   402843 <submitr+0x6b9>
  402525:	89 ee                	mov    %ebp,%esi
  402527:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40252c:	e8 7b f9 ff ff       	callq  401eac <rio_readinitb>
  402531:	ba 00 20 00 00       	mov    $0x2000,%edx
  402536:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  40253d:	00 
  40253e:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402543:	e8 8b fa ff ff       	callq  401fd3 <rio_readlineb>
  402548:	48 85 c0             	test   %rax,%rax
  40254b:	7f 7d                	jg     4025ca <submitr+0x440>
  40254d:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402554:	3a 20 43 
  402557:	48 89 03             	mov    %rax,(%rbx)
  40255a:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402561:	20 75 6e 
  402564:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402568:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40256f:	74 6f 20 
  402572:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402576:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  40257d:	66 69 72 
  402580:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402584:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  40258b:	61 64 65 
  40258e:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402592:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402599:	6d 20 72 
  40259c:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025a0:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  4025a7:	20 73 65 
  4025aa:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4025ae:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  4025b5:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  4025b9:	89 ef                	mov    %ebp,%edi
  4025bb:	e8 a0 e6 ff ff       	callq  400c60 <close@plt>
  4025c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025c5:	e9 79 02 00 00       	jmpq   402843 <submitr+0x6b9>
  4025ca:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  4025d1:	00 
  4025d2:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  4025d7:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  4025de:	00 
  4025df:	be be 32 40 00       	mov    $0x4032be,%esi
  4025e4:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  4025eb:	00 
  4025ec:	b8 00 00 00 00       	mov    $0x0,%eax
  4025f1:	e8 0a e7 ff ff       	callq  400d00 <__isoc99_sscanf@plt>
  4025f6:	e9 95 00 00 00       	jmpq   402690 <submitr+0x506>
  4025fb:	ba 00 20 00 00       	mov    $0x2000,%edx
  402600:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402607:	00 
  402608:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40260d:	e8 c1 f9 ff ff       	callq  401fd3 <rio_readlineb>
  402612:	48 85 c0             	test   %rax,%rax
  402615:	7f 79                	jg     402690 <submitr+0x506>
  402617:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40261e:	3a 20 43 
  402621:	48 89 03             	mov    %rax,(%rbx)
  402624:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40262b:	20 75 6e 
  40262e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402632:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402639:	74 6f 20 
  40263c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402640:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402647:	68 65 61 
  40264a:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40264e:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402655:	66 72 6f 
  402658:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40265c:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  402663:	20 72 65 
  402666:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40266a:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  402671:	73 65 72 
  402674:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402678:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  40267f:	89 ef                	mov    %ebp,%edi
  402681:	e8 da e5 ff ff       	callq  400c60 <close@plt>
  402686:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40268b:	e9 b3 01 00 00       	jmpq   402843 <submitr+0x6b9>
  402690:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  402697:	00 
  402698:	b8 0d 00 00 00       	mov    $0xd,%eax
  40269d:	29 d0                	sub    %edx,%eax
  40269f:	75 1b                	jne    4026bc <submitr+0x532>
  4026a1:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  4026a8:	00 
  4026a9:	b8 0a 00 00 00       	mov    $0xa,%eax
  4026ae:	29 d0                	sub    %edx,%eax
  4026b0:	75 0a                	jne    4026bc <submitr+0x532>
  4026b2:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  4026b9:	00 
  4026ba:	f7 d8                	neg    %eax
  4026bc:	85 c0                	test   %eax,%eax
  4026be:	0f 85 37 ff ff ff    	jne    4025fb <submitr+0x471>
  4026c4:	ba 00 20 00 00       	mov    $0x2000,%edx
  4026c9:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4026d0:	00 
  4026d1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4026d6:	e8 f8 f8 ff ff       	callq  401fd3 <rio_readlineb>
  4026db:	48 85 c0             	test   %rax,%rax
  4026de:	0f 8f 83 00 00 00    	jg     402767 <submitr+0x5dd>
  4026e4:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4026eb:	3a 20 43 
  4026ee:	48 89 03             	mov    %rax,(%rbx)
  4026f1:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4026f8:	20 75 6e 
  4026fb:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4026ff:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402706:	74 6f 20 
  402709:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40270d:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402714:	73 74 61 
  402717:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40271b:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402722:	65 73 73 
  402725:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402729:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402730:	72 6f 6d 
  402733:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402737:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  40273e:	6c 74 20 
  402741:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402745:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  40274c:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402752:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402756:	89 ef                	mov    %ebp,%edi
  402758:	e8 03 e5 ff ff       	callq  400c60 <close@plt>
  40275d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402762:	e9 dc 00 00 00       	jmpq   402843 <submitr+0x6b9>
  402767:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  40276c:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402773:	74 37                	je     4027ac <submitr+0x622>
  402775:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  40277c:	00 
  40277d:	b9 78 32 40 00       	mov    $0x403278,%ecx
  402782:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402789:	be 01 00 00 00       	mov    $0x1,%esi
  40278e:	48 89 df             	mov    %rbx,%rdi
  402791:	b8 00 00 00 00       	mov    $0x0,%eax
  402796:	e8 f5 e5 ff ff       	callq  400d90 <__sprintf_chk@plt>
  40279b:	89 ef                	mov    %ebp,%edi
  40279d:	e8 be e4 ff ff       	callq  400c60 <close@plt>
  4027a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027a7:	e9 97 00 00 00       	jmpq   402843 <submitr+0x6b9>
  4027ac:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4027b3:	00 
  4027b4:	48 89 df             	mov    %rbx,%rdi
  4027b7:	e8 34 e4 ff ff       	callq  400bf0 <strcpy@plt>
  4027bc:	89 ef                	mov    %ebp,%edi
  4027be:	e8 9d e4 ff ff       	callq  400c60 <close@plt>
  4027c3:	0f b6 03             	movzbl (%rbx),%eax
  4027c6:	ba 4f 00 00 00       	mov    $0x4f,%edx
  4027cb:	29 c2                	sub    %eax,%edx
  4027cd:	75 22                	jne    4027f1 <submitr+0x667>
  4027cf:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  4027d3:	b8 4b 00 00 00       	mov    $0x4b,%eax
  4027d8:	29 c8                	sub    %ecx,%eax
  4027da:	75 17                	jne    4027f3 <submitr+0x669>
  4027dc:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  4027e0:	b8 0a 00 00 00       	mov    $0xa,%eax
  4027e5:	29 c8                	sub    %ecx,%eax
  4027e7:	75 0a                	jne    4027f3 <submitr+0x669>
  4027e9:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  4027ed:	f7 d8                	neg    %eax
  4027ef:	eb 02                	jmp    4027f3 <submitr+0x669>
  4027f1:	89 d0                	mov    %edx,%eax
  4027f3:	85 c0                	test   %eax,%eax
  4027f5:	74 40                	je     402837 <submitr+0x6ad>
  4027f7:	bf cf 32 40 00       	mov    $0x4032cf,%edi
  4027fc:	b9 05 00 00 00       	mov    $0x5,%ecx
  402801:	48 89 de             	mov    %rbx,%rsi
  402804:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402806:	0f 97 c0             	seta   %al
  402809:	0f 92 c1             	setb   %cl
  40280c:	29 c8                	sub    %ecx,%eax
  40280e:	0f be c0             	movsbl %al,%eax
  402811:	85 c0                	test   %eax,%eax
  402813:	74 2e                	je     402843 <submitr+0x6b9>
  402815:	85 d2                	test   %edx,%edx
  402817:	75 13                	jne    40282c <submitr+0x6a2>
  402819:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  40281d:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402822:	29 c2                	sub    %eax,%edx
  402824:	75 06                	jne    40282c <submitr+0x6a2>
  402826:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  40282a:	f7 da                	neg    %edx
  40282c:	85 d2                	test   %edx,%edx
  40282e:	75 0e                	jne    40283e <submitr+0x6b4>
  402830:	b8 00 00 00 00       	mov    $0x0,%eax
  402835:	eb 0c                	jmp    402843 <submitr+0x6b9>
  402837:	b8 00 00 00 00       	mov    $0x0,%eax
  40283c:	eb 05                	jmp    402843 <submitr+0x6b9>
  40283e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402843:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  40284a:	00 
  40284b:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402852:	00 00 
  402854:	74 05                	je     40285b <submitr+0x6d1>
  402856:	e8 c5 e3 ff ff       	callq  400c20 <__stack_chk_fail@plt>
  40285b:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402862:	5b                   	pop    %rbx
  402863:	5d                   	pop    %rbp
  402864:	41 5c                	pop    %r12
  402866:	41 5d                	pop    %r13
  402868:	41 5e                	pop    %r14
  40286a:	41 5f                	pop    %r15
  40286c:	c3                   	retq   

000000000040286d <init_timeout>:
  40286d:	85 ff                	test   %edi,%edi
  40286f:	74 23                	je     402894 <init_timeout+0x27>
  402871:	53                   	push   %rbx
  402872:	89 fb                	mov    %edi,%ebx
  402874:	85 ff                	test   %edi,%edi
  402876:	79 05                	jns    40287d <init_timeout+0x10>
  402878:	bb 00 00 00 00       	mov    $0x0,%ebx
  40287d:	be be 1e 40 00       	mov    $0x401ebe,%esi
  402882:	bf 0e 00 00 00       	mov    $0xe,%edi
  402887:	e8 14 e4 ff ff       	callq  400ca0 <signal@plt>
  40288c:	89 df                	mov    %ebx,%edi
  40288e:	e8 bd e3 ff ff       	callq  400c50 <alarm@plt>
  402893:	5b                   	pop    %rbx
  402894:	f3 c3                	repz retq 

0000000000402896 <init_driver>:
  402896:	55                   	push   %rbp
  402897:	53                   	push   %rbx
  402898:	48 83 ec 28          	sub    $0x28,%rsp
  40289c:	48 89 fd             	mov    %rdi,%rbp
  40289f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4028a6:	00 00 
  4028a8:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  4028ad:	31 c0                	xor    %eax,%eax
  4028af:	be 01 00 00 00       	mov    $0x1,%esi
  4028b4:	bf 0d 00 00 00       	mov    $0xd,%edi
  4028b9:	e8 e2 e3 ff ff       	callq  400ca0 <signal@plt>
  4028be:	be 01 00 00 00       	mov    $0x1,%esi
  4028c3:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4028c8:	e8 d3 e3 ff ff       	callq  400ca0 <signal@plt>
  4028cd:	be 01 00 00 00       	mov    $0x1,%esi
  4028d2:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4028d7:	e8 c4 e3 ff ff       	callq  400ca0 <signal@plt>
  4028dc:	ba 00 00 00 00       	mov    $0x0,%edx
  4028e1:	be 01 00 00 00       	mov    $0x1,%esi
  4028e6:	bf 02 00 00 00       	mov    $0x2,%edi
  4028eb:	e8 b0 e4 ff ff       	callq  400da0 <socket@plt>
  4028f0:	85 c0                	test   %eax,%eax
  4028f2:	79 4f                	jns    402943 <init_driver+0xad>
  4028f4:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4028fb:	3a 20 43 
  4028fe:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402902:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402909:	20 75 6e 
  40290c:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402910:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402917:	74 6f 20 
  40291a:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40291e:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402925:	65 20 73 
  402928:	48 89 45 18          	mov    %rax,0x18(%rbp)
  40292c:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402933:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402939:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40293e:	e9 9b 00 00 00       	jmpq   4029de <init_driver+0x148>
  402943:	89 c3                	mov    %eax,%ebx
  402945:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  40294b:	bf af 32 40 00       	mov    $0x4032af,%edi
  402950:	b8 00 00 00 00       	mov    $0x0,%eax
  402955:	e8 36 e3 ff ff       	callq  400c90 <inet_addr@plt>
  40295a:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40295e:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402965:	ba 10 00 00 00       	mov    $0x10,%edx
  40296a:	48 89 e6             	mov    %rsp,%rsi
  40296d:	89 df                	mov    %ebx,%edi
  40296f:	e8 fc e3 ff ff       	callq  400d70 <connect@plt>
  402974:	85 c0                	test   %eax,%eax
  402976:	79 50                	jns    4029c8 <init_driver+0x132>
  402978:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  40297f:	3a 20 55 
  402982:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402986:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  40298d:	20 74 6f 
  402990:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402994:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  40299b:	65 63 74 
  40299e:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4029a2:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  4029a9:	65 72 76 
  4029ac:	48 89 45 18          	mov    %rax,0x18(%rbp)
  4029b0:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  4029b6:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  4029ba:	89 df                	mov    %ebx,%edi
  4029bc:	e8 9f e2 ff ff       	callq  400c60 <close@plt>
  4029c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029c6:	eb 16                	jmp    4029de <init_driver+0x148>
  4029c8:	89 df                	mov    %ebx,%edi
  4029ca:	e8 91 e2 ff ff       	callq  400c60 <close@plt>
  4029cf:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  4029d5:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  4029d9:	b8 00 00 00 00       	mov    $0x0,%eax
  4029de:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  4029e3:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4029ea:	00 00 
  4029ec:	74 05                	je     4029f3 <init_driver+0x15d>
  4029ee:	e8 2d e2 ff ff       	callq  400c20 <__stack_chk_fail@plt>
  4029f3:	48 83 c4 28          	add    $0x28,%rsp
  4029f7:	5b                   	pop    %rbx
  4029f8:	5d                   	pop    %rbp
  4029f9:	c3                   	retq   

00000000004029fa <driver_post>:
  4029fa:	53                   	push   %rbx
  4029fb:	4c 89 cb             	mov    %r9,%rbx
  4029fe:	45 85 c0             	test   %r8d,%r8d
  402a01:	74 27                	je     402a2a <driver_post+0x30>
  402a03:	48 89 ca             	mov    %rcx,%rdx
  402a06:	be d4 32 40 00       	mov    $0x4032d4,%esi
  402a0b:	bf 01 00 00 00       	mov    $0x1,%edi
  402a10:	b8 00 00 00 00       	mov    $0x0,%eax
  402a15:	e8 06 e3 ff ff       	callq  400d20 <__printf_chk@plt>
  402a1a:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402a1f:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402a23:	b8 00 00 00 00       	mov    $0x0,%eax
  402a28:	eb 3f                	jmp    402a69 <driver_post+0x6f>
  402a2a:	48 85 ff             	test   %rdi,%rdi
  402a2d:	74 2c                	je     402a5b <driver_post+0x61>
  402a2f:	80 3f 00             	cmpb   $0x0,(%rdi)
  402a32:	74 27                	je     402a5b <driver_post+0x61>
  402a34:	48 83 ec 08          	sub    $0x8,%rsp
  402a38:	41 51                	push   %r9
  402a3a:	49 89 c9             	mov    %rcx,%r9
  402a3d:	49 89 d0             	mov    %rdx,%r8
  402a40:	48 89 f9             	mov    %rdi,%rcx
  402a43:	48 89 f2             	mov    %rsi,%rdx
  402a46:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402a4b:	bf eb 32 40 00       	mov    $0x4032eb,%edi
  402a50:	e8 35 f7 ff ff       	callq  40218a <submitr>
  402a55:	48 83 c4 10          	add    $0x10,%rsp
  402a59:	eb 0e                	jmp    402a69 <driver_post+0x6f>
  402a5b:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402a60:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402a64:	b8 00 00 00 00       	mov    $0x0,%eax
  402a69:	5b                   	pop    %rbx
  402a6a:	c3                   	retq   

0000000000402a6b <check>:
  402a6b:	89 f8                	mov    %edi,%eax
  402a6d:	c1 e8 1c             	shr    $0x1c,%eax
  402a70:	85 c0                	test   %eax,%eax
  402a72:	74 1d                	je     402a91 <check+0x26>
  402a74:	b9 00 00 00 00       	mov    $0x0,%ecx
  402a79:	eb 0b                	jmp    402a86 <check+0x1b>
  402a7b:	89 f8                	mov    %edi,%eax
  402a7d:	d3 e8                	shr    %cl,%eax
  402a7f:	3c 0a                	cmp    $0xa,%al
  402a81:	74 14                	je     402a97 <check+0x2c>
  402a83:	83 c1 08             	add    $0x8,%ecx
  402a86:	83 f9 1f             	cmp    $0x1f,%ecx
  402a89:	7e f0                	jle    402a7b <check+0x10>
  402a8b:	b8 01 00 00 00       	mov    $0x1,%eax
  402a90:	c3                   	retq   
  402a91:	b8 00 00 00 00       	mov    $0x0,%eax
  402a96:	c3                   	retq   
  402a97:	b8 00 00 00 00       	mov    $0x0,%eax
  402a9c:	c3                   	retq   

0000000000402a9d <gencookie>:
  402a9d:	53                   	push   %rbx
  402a9e:	83 c7 01             	add    $0x1,%edi
  402aa1:	e8 2a e1 ff ff       	callq  400bd0 <srandom@plt>
  402aa6:	e8 35 e2 ff ff       	callq  400ce0 <random@plt>
  402aab:	89 c3                	mov    %eax,%ebx
  402aad:	89 c7                	mov    %eax,%edi
  402aaf:	e8 b7 ff ff ff       	callq  402a6b <check>
  402ab4:	85 c0                	test   %eax,%eax
  402ab6:	74 ee                	je     402aa6 <gencookie+0x9>
  402ab8:	89 d8                	mov    %ebx,%eax
  402aba:	5b                   	pop    %rbx
  402abb:	c3                   	retq   
  402abc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402ac0 <__libc_csu_init>:
  402ac0:	41 57                	push   %r15
  402ac2:	41 56                	push   %r14
  402ac4:	41 89 ff             	mov    %edi,%r15d
  402ac7:	41 55                	push   %r13
  402ac9:	41 54                	push   %r12
  402acb:	4c 8d 25 3e 13 20 00 	lea    0x20133e(%rip),%r12        # 603e10 <__frame_dummy_init_array_entry>
  402ad2:	55                   	push   %rbp
  402ad3:	48 8d 2d 3e 13 20 00 	lea    0x20133e(%rip),%rbp        # 603e18 <__do_global_dtors_aux_fini_array_entry>
  402ada:	53                   	push   %rbx
  402adb:	49 89 f6             	mov    %rsi,%r14
  402ade:	49 89 d5             	mov    %rdx,%r13
  402ae1:	4c 29 e5             	sub    %r12,%rbp
  402ae4:	48 83 ec 08          	sub    $0x8,%rsp
  402ae8:	48 c1 fd 03          	sar    $0x3,%rbp
  402aec:	e8 97 e0 ff ff       	callq  400b88 <_init>
  402af1:	48 85 ed             	test   %rbp,%rbp
  402af4:	74 20                	je     402b16 <__libc_csu_init+0x56>
  402af6:	31 db                	xor    %ebx,%ebx
  402af8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402aff:	00 
  402b00:	4c 89 ea             	mov    %r13,%rdx
  402b03:	4c 89 f6             	mov    %r14,%rsi
  402b06:	44 89 ff             	mov    %r15d,%edi
  402b09:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402b0d:	48 83 c3 01          	add    $0x1,%rbx
  402b11:	48 39 eb             	cmp    %rbp,%rbx
  402b14:	75 ea                	jne    402b00 <__libc_csu_init+0x40>
  402b16:	48 83 c4 08          	add    $0x8,%rsp
  402b1a:	5b                   	pop    %rbx
  402b1b:	5d                   	pop    %rbp
  402b1c:	41 5c                	pop    %r12
  402b1e:	41 5d                	pop    %r13
  402b20:	41 5e                	pop    %r14
  402b22:	41 5f                	pop    %r15
  402b24:	c3                   	retq   
  402b25:	90                   	nop
  402b26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402b2d:	00 00 00 

0000000000402b30 <__libc_csu_fini>:
  402b30:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402b34 <_fini>:
  402b34:	48 83 ec 08          	sub    $0x8,%rsp
  402b38:	48 83 c4 08          	add    $0x8,%rsp
  402b3c:	c3                   	retq   
