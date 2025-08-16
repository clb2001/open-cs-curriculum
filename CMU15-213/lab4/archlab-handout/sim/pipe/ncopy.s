
ncopy.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <ncopy>:
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   %rbp
   5:	48 89 e5             	mov    %rsp,%rbp
   8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  10:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  14:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  1b:	00 
  1c:	e9 43 01 00 00       	jmpq   164 <ncopy+0x164>
  21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  25:	48 8d 50 08          	lea    0x8(%rax),%rdx
  29:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  2d:	48 8b 00             	mov    (%rax),%rax
  30:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  34:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  38:	48 8d 50 08          	lea    0x8(%rax),%rdx
  3c:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  40:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  44:	48 89 10             	mov    %rdx,(%rax)
  47:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  4c:	0f 9f c0             	setg   %al
  4f:	0f b6 c0             	movzbl %al,%eax
  52:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  56:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  5a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  5e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  62:	48 8b 00             	mov    (%rax),%rax
  65:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  69:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  6d:	48 8d 50 08          	lea    0x8(%rax),%rdx
  71:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  75:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  79:	48 89 10             	mov    %rdx,(%rax)
  7c:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  81:	0f 9f c0             	setg   %al
  84:	0f b6 c0             	movzbl %al,%eax
  87:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8f:	48 8d 50 08          	lea    0x8(%rax),%rdx
  93:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  97:	48 8b 00             	mov    (%rax),%rax
  9a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  9e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  a2:	48 8d 50 08          	lea    0x8(%rax),%rdx
  a6:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  aa:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  ae:	48 89 10             	mov    %rdx,(%rax)
  b1:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  b6:	0f 9f c0             	setg   %al
  b9:	0f b6 c0             	movzbl %al,%eax
  bc:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  c4:	48 8d 50 08          	lea    0x8(%rax),%rdx
  c8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  cc:	48 8b 00             	mov    (%rax),%rax
  cf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  d7:	48 8d 50 08          	lea    0x8(%rax),%rdx
  db:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  df:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  e3:	48 89 10             	mov    %rdx,(%rax)
  e6:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  eb:	0f 9f c0             	setg   %al
  ee:	0f b6 c0             	movzbl %al,%eax
  f1:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  f9:	48 8d 50 08          	lea    0x8(%rax),%rdx
  fd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
 101:	48 8b 00             	mov    (%rax),%rax
 104:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 108:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 10c:	48 8d 50 08          	lea    0x8(%rax),%rdx
 110:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
 114:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 118:	48 89 10             	mov    %rdx,(%rax)
 11b:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
 120:	0f 9f c0             	setg   %al
 123:	0f b6 c0             	movzbl %al,%eax
 126:	48 01 45 f0          	add    %rax,-0x10(%rbp)
 12a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 12e:	48 8d 50 08          	lea    0x8(%rax),%rdx
 132:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
 136:	48 8b 00             	mov    (%rax),%rax
 139:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 13d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 141:	48 8d 50 08          	lea    0x8(%rax),%rdx
 145:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
 149:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 14d:	48 89 10             	mov    %rdx,(%rax)
 150:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
 155:	0f 9f c0             	setg   %al
 158:	0f b6 c0             	movzbl %al,%eax
 15b:	48 01 45 f0          	add    %rax,-0x10(%rbp)
 15f:	48 83 6d d8 06       	subq   $0x6,-0x28(%rbp)
 164:	48 83 7d d8 05       	cmpq   $0x5,-0x28(%rbp)
 169:	0f 8f b2 fe ff ff    	jg     21 <ncopy+0x21>
 16f:	eb 3a                	jmp    1ab <ncopy+0x1ab>
 171:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 175:	48 8d 50 08          	lea    0x8(%rax),%rdx
 179:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
 17d:	48 8b 00             	mov    (%rax),%rax
 180:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 184:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 188:	48 8d 50 08          	lea    0x8(%rax),%rdx
 18c:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
 190:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 194:	48 89 10             	mov    %rdx,(%rax)
 197:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
 19c:	0f 9f c0             	setg   %al
 19f:	0f b6 c0             	movzbl %al,%eax
 1a2:	48 01 45 f0          	add    %rax,-0x10(%rbp)
 1a6:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
 1ab:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
 1b0:	7f bf                	jg     171 <ncopy+0x171>
 1b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1b6:	5d                   	pop    %rbp
 1b7:	c3                   	retq   

00000000000001b8 <main>:
 1b8:	f3 0f 1e fa          	endbr64 
 1bc:	55                   	push   %rbp
 1bd:	48 89 e5             	mov    %rsp,%rbp
 1c0:	48 83 ec 10          	sub    $0x10,%rsp
 1c4:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
 1cb:	00 
 1cc:	eb 24                	jmp    1f2 <main+0x3a>
 1ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1d2:	48 8d 48 01          	lea    0x1(%rax),%rcx
 1d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1da:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
 1e1:	00 
 1e2:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 1e9 <main+0x31>
 1e9:	48 89 0c 02          	mov    %rcx,(%rdx,%rax,1)
 1ed:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
 1f2:	48 83 7d f0 07       	cmpq   $0x7,-0x10(%rbp)
 1f7:	7e d5                	jle    1ce <main+0x16>
 1f9:	ba 08 00 00 00       	mov    $0x8,%edx
 1fe:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 205 <main+0x4d>
 205:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 20c <main+0x54>
 20c:	e8 00 00 00 00       	callq  211 <main+0x59>
 211:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 215:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 219:	48 89 c6             	mov    %rax,%rsi
 21c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 223 <main+0x6b>
 223:	b8 00 00 00 00       	mov    $0x0,%eax
 228:	e8 00 00 00 00       	callq  22d <main+0x75>
 22d:	bf 00 00 00 00       	mov    $0x0,%edi
 232:	e8 00 00 00 00       	callq  237 <main+0x7f>
