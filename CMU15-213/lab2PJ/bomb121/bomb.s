
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 3f 00 00 	mov    0x3fd9(%rip),%rax        # 4fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 c2 3e 00 00    	pushq  0x3ec2(%rip)        # 4ee8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 c3 3e 00 00 	bnd jmpq *0x3ec3(%rip)        # 4ef0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <.plt>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	pushq  $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmpq 1020 <.plt>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	pushq  $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmpq 1020 <.plt>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	pushq  $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmpq 1020 <.plt>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	pushq  $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmpq 1020 <.plt>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	pushq  $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmpq 1020 <.plt>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	pushq  $0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmpq 1020 <.plt>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	pushq  $0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmpq 1020 <.plt>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	pushq  $0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmpq 1020 <.plt>
    10df:	90                   	nop
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	68 0b 00 00 00       	pushq  $0xb
    10e9:	f2 e9 31 ff ff ff    	bnd jmpq 1020 <.plt>
    10ef:	90                   	nop
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	68 0c 00 00 00       	pushq  $0xc
    10f9:	f2 e9 21 ff ff ff    	bnd jmpq 1020 <.plt>
    10ff:	90                   	nop
    1100:	f3 0f 1e fa          	endbr64 
    1104:	68 0d 00 00 00       	pushq  $0xd
    1109:	f2 e9 11 ff ff ff    	bnd jmpq 1020 <.plt>
    110f:	90                   	nop
    1110:	f3 0f 1e fa          	endbr64 
    1114:	68 0e 00 00 00       	pushq  $0xe
    1119:	f2 e9 01 ff ff ff    	bnd jmpq 1020 <.plt>
    111f:	90                   	nop
    1120:	f3 0f 1e fa          	endbr64 
    1124:	68 0f 00 00 00       	pushq  $0xf
    1129:	f2 e9 f1 fe ff ff    	bnd jmpq 1020 <.plt>
    112f:	90                   	nop
    1130:	f3 0f 1e fa          	endbr64 
    1134:	68 10 00 00 00       	pushq  $0x10
    1139:	f2 e9 e1 fe ff ff    	bnd jmpq 1020 <.plt>
    113f:	90                   	nop
    1140:	f3 0f 1e fa          	endbr64 
    1144:	68 11 00 00 00       	pushq  $0x11
    1149:	f2 e9 d1 fe ff ff    	bnd jmpq 1020 <.plt>
    114f:	90                   	nop
    1150:	f3 0f 1e fa          	endbr64 
    1154:	68 12 00 00 00       	pushq  $0x12
    1159:	f2 e9 c1 fe ff ff    	bnd jmpq 1020 <.plt>
    115f:	90                   	nop
    1160:	f3 0f 1e fa          	endbr64 
    1164:	68 13 00 00 00       	pushq  $0x13
    1169:	f2 e9 b1 fe ff ff    	bnd jmpq 1020 <.plt>
    116f:	90                   	nop
    1170:	f3 0f 1e fa          	endbr64 
    1174:	68 14 00 00 00       	pushq  $0x14
    1179:	f2 e9 a1 fe ff ff    	bnd jmpq 1020 <.plt>
    117f:	90                   	nop
    1180:	f3 0f 1e fa          	endbr64 
    1184:	68 15 00 00 00       	pushq  $0x15
    1189:	f2 e9 91 fe ff ff    	bnd jmpq 1020 <.plt>
    118f:	90                   	nop
    1190:	f3 0f 1e fa          	endbr64 
    1194:	68 16 00 00 00       	pushq  $0x16
    1199:	f2 e9 81 fe ff ff    	bnd jmpq 1020 <.plt>
    119f:	90                   	nop
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	68 17 00 00 00       	pushq  $0x17
    11a9:	f2 e9 71 fe ff ff    	bnd jmpq 1020 <.plt>
    11af:	90                   	nop
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	68 18 00 00 00       	pushq  $0x18
    11b9:	f2 e9 61 fe ff ff    	bnd jmpq 1020 <.plt>
    11bf:	90                   	nop
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	68 19 00 00 00       	pushq  $0x19
    11c9:	f2 e9 51 fe ff ff    	bnd jmpq 1020 <.plt>
    11cf:	90                   	nop
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	68 1a 00 00 00       	pushq  $0x1a
    11d9:	f2 e9 41 fe ff ff    	bnd jmpq 1020 <.plt>
    11df:	90                   	nop
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	68 1b 00 00 00       	pushq  $0x1b
    11e9:	f2 e9 31 fe ff ff    	bnd jmpq 1020 <.plt>
    11ef:	90                   	nop

Disassembly of section .plt.got:

00000000000011f0 <__cxa_finalize@plt>:
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	f2 ff 25 fd 3d 00 00 	bnd jmpq *0x3dfd(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    11fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001200 <getenv@plt>:
    1200:	f3 0f 1e fa          	endbr64 
    1204:	f2 ff 25 ed 3c 00 00 	bnd jmpq *0x3ced(%rip)        # 4ef8 <getenv@GLIBC_2.2.5>
    120b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001210 <strcasecmp@plt>:
    1210:	f3 0f 1e fa          	endbr64 
    1214:	f2 ff 25 e5 3c 00 00 	bnd jmpq *0x3ce5(%rip)        # 4f00 <strcasecmp@GLIBC_2.2.5>
    121b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001220 <__errno_location@plt>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	f2 ff 25 dd 3c 00 00 	bnd jmpq *0x3cdd(%rip)        # 4f08 <__errno_location@GLIBC_2.2.5>
    122b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001230 <strcpy@plt>:
    1230:	f3 0f 1e fa          	endbr64 
    1234:	f2 ff 25 d5 3c 00 00 	bnd jmpq *0x3cd5(%rip)        # 4f10 <strcpy@GLIBC_2.2.5>
    123b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001240 <puts@plt>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	f2 ff 25 cd 3c 00 00 	bnd jmpq *0x3ccd(%rip)        # 4f18 <puts@GLIBC_2.2.5>
    124b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001250 <write@plt>:
    1250:	f3 0f 1e fa          	endbr64 
    1254:	f2 ff 25 c5 3c 00 00 	bnd jmpq *0x3cc5(%rip)        # 4f20 <write@GLIBC_2.2.5>
    125b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001260 <strlen@plt>:
    1260:	f3 0f 1e fa          	endbr64 
    1264:	f2 ff 25 bd 3c 00 00 	bnd jmpq *0x3cbd(%rip)        # 4f28 <strlen@GLIBC_2.2.5>
    126b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001270 <__stack_chk_fail@plt>:
    1270:	f3 0f 1e fa          	endbr64 
    1274:	f2 ff 25 b5 3c 00 00 	bnd jmpq *0x3cb5(%rip)        # 4f30 <__stack_chk_fail@GLIBC_2.4>
    127b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001280 <alarm@plt>:
    1280:	f3 0f 1e fa          	endbr64 
    1284:	f2 ff 25 ad 3c 00 00 	bnd jmpq *0x3cad(%rip)        # 4f38 <alarm@GLIBC_2.2.5>
    128b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001290 <close@plt>:
    1290:	f3 0f 1e fa          	endbr64 
    1294:	f2 ff 25 a5 3c 00 00 	bnd jmpq *0x3ca5(%rip)        # 4f40 <close@GLIBC_2.2.5>
    129b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012a0 <read@plt>:
    12a0:	f3 0f 1e fa          	endbr64 
    12a4:	f2 ff 25 9d 3c 00 00 	bnd jmpq *0x3c9d(%rip)        # 4f48 <read@GLIBC_2.2.5>
    12ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012b0 <fgets@plt>:
    12b0:	f3 0f 1e fa          	endbr64 
    12b4:	f2 ff 25 95 3c 00 00 	bnd jmpq *0x3c95(%rip)        # 4f50 <fgets@GLIBC_2.2.5>
    12bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012c0 <signal@plt>:
    12c0:	f3 0f 1e fa          	endbr64 
    12c4:	f2 ff 25 8d 3c 00 00 	bnd jmpq *0x3c8d(%rip)        # 4f58 <signal@GLIBC_2.2.5>
    12cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012d0 <gethostbyname@plt>:
    12d0:	f3 0f 1e fa          	endbr64 
    12d4:	f2 ff 25 85 3c 00 00 	bnd jmpq *0x3c85(%rip)        # 4f60 <gethostbyname@GLIBC_2.2.5>
    12db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012e0 <__memmove_chk@plt>:
    12e0:	f3 0f 1e fa          	endbr64 
    12e4:	f2 ff 25 7d 3c 00 00 	bnd jmpq *0x3c7d(%rip)        # 4f68 <__memmove_chk@GLIBC_2.3.4>
    12eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012f0 <strtol@plt>:
    12f0:	f3 0f 1e fa          	endbr64 
    12f4:	f2 ff 25 75 3c 00 00 	bnd jmpq *0x3c75(%rip)        # 4f70 <strtol@GLIBC_2.2.5>
    12fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001300 <fflush@plt>:
    1300:	f3 0f 1e fa          	endbr64 
    1304:	f2 ff 25 6d 3c 00 00 	bnd jmpq *0x3c6d(%rip)        # 4f78 <fflush@GLIBC_2.2.5>
    130b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001310 <__isoc99_sscanf@plt>:
    1310:	f3 0f 1e fa          	endbr64 
    1314:	f2 ff 25 65 3c 00 00 	bnd jmpq *0x3c65(%rip)        # 4f80 <__isoc99_sscanf@GLIBC_2.7>
    131b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001320 <__printf_chk@plt>:
    1320:	f3 0f 1e fa          	endbr64 
    1324:	f2 ff 25 5d 3c 00 00 	bnd jmpq *0x3c5d(%rip)        # 4f88 <__printf_chk@GLIBC_2.3.4>
    132b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001330 <fopen@plt>:
    1330:	f3 0f 1e fa          	endbr64 
    1334:	f2 ff 25 55 3c 00 00 	bnd jmpq *0x3c55(%rip)        # 4f90 <fopen@GLIBC_2.2.5>
    133b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001340 <gethostname@plt>:
    1340:	f3 0f 1e fa          	endbr64 
    1344:	f2 ff 25 4d 3c 00 00 	bnd jmpq *0x3c4d(%rip)        # 4f98 <gethostname@GLIBC_2.2.5>
    134b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001350 <exit@plt>:
    1350:	f3 0f 1e fa          	endbr64 
    1354:	f2 ff 25 45 3c 00 00 	bnd jmpq *0x3c45(%rip)        # 4fa0 <exit@GLIBC_2.2.5>
    135b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001360 <connect@plt>:
    1360:	f3 0f 1e fa          	endbr64 
    1364:	f2 ff 25 3d 3c 00 00 	bnd jmpq *0x3c3d(%rip)        # 4fa8 <connect@GLIBC_2.2.5>
    136b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001370 <__fprintf_chk@plt>:
    1370:	f3 0f 1e fa          	endbr64 
    1374:	f2 ff 25 35 3c 00 00 	bnd jmpq *0x3c35(%rip)        # 4fb0 <__fprintf_chk@GLIBC_2.3.4>
    137b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001380 <sleep@plt>:
    1380:	f3 0f 1e fa          	endbr64 
    1384:	f2 ff 25 2d 3c 00 00 	bnd jmpq *0x3c2d(%rip)        # 4fb8 <sleep@GLIBC_2.2.5>
    138b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001390 <__ctype_b_loc@plt>:
    1390:	f3 0f 1e fa          	endbr64 
    1394:	f2 ff 25 25 3c 00 00 	bnd jmpq *0x3c25(%rip)        # 4fc0 <__ctype_b_loc@GLIBC_2.3>
    139b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013a0 <__sprintf_chk@plt>:
    13a0:	f3 0f 1e fa          	endbr64 
    13a4:	f2 ff 25 1d 3c 00 00 	bnd jmpq *0x3c1d(%rip)        # 4fc8 <__sprintf_chk@GLIBC_2.3.4>
    13ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013b0 <socket@plt>:
    13b0:	f3 0f 1e fa          	endbr64 
    13b4:	f2 ff 25 15 3c 00 00 	bnd jmpq *0x3c15(%rip)        # 4fd0 <socket@GLIBC_2.2.5>
    13bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000013c0 <_start>:
    13c0:	f3 0f 1e fa          	endbr64 
    13c4:	31 ed                	xor    %ebp,%ebp
    13c6:	49 89 d1             	mov    %rdx,%r9
    13c9:	5e                   	pop    %rsi
    13ca:	48 89 e2             	mov    %rsp,%rdx
    13cd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    13d1:	50                   	push   %rax
    13d2:	54                   	push   %rsp
    13d3:	4c 8d 05 b6 18 00 00 	lea    0x18b6(%rip),%r8        # 2c90 <__libc_csu_fini>
    13da:	48 8d 0d 3f 18 00 00 	lea    0x183f(%rip),%rcx        # 2c20 <__libc_csu_init>
    13e1:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 14a9 <main>
    13e8:	ff 15 f2 3b 00 00    	callq  *0x3bf2(%rip)        # 4fe0 <__libc_start_main@GLIBC_2.2.5>
    13ee:	f4                   	hlt    
    13ef:	90                   	nop

00000000000013f0 <deregister_tm_clones>:
    13f0:	48 8d 3d 89 42 00 00 	lea    0x4289(%rip),%rdi        # 5680 <stdout@@GLIBC_2.2.5>
    13f7:	48 8d 05 82 42 00 00 	lea    0x4282(%rip),%rax        # 5680 <stdout@@GLIBC_2.2.5>
    13fe:	48 39 f8             	cmp    %rdi,%rax
    1401:	74 15                	je     1418 <deregister_tm_clones+0x28>
    1403:	48 8b 05 ce 3b 00 00 	mov    0x3bce(%rip),%rax        # 4fd8 <_ITM_deregisterTMCloneTable>
    140a:	48 85 c0             	test   %rax,%rax
    140d:	74 09                	je     1418 <deregister_tm_clones+0x28>
    140f:	ff e0                	jmpq   *%rax
    1411:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1418:	c3                   	retq   
    1419:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001420 <register_tm_clones>:
    1420:	48 8d 3d 59 42 00 00 	lea    0x4259(%rip),%rdi        # 5680 <stdout@@GLIBC_2.2.5>
    1427:	48 8d 35 52 42 00 00 	lea    0x4252(%rip),%rsi        # 5680 <stdout@@GLIBC_2.2.5>
    142e:	48 29 fe             	sub    %rdi,%rsi
    1431:	48 89 f0             	mov    %rsi,%rax
    1434:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1438:	48 c1 f8 03          	sar    $0x3,%rax
    143c:	48 01 c6             	add    %rax,%rsi
    143f:	48 d1 fe             	sar    %rsi
    1442:	74 14                	je     1458 <register_tm_clones+0x38>
    1444:	48 8b 05 a5 3b 00 00 	mov    0x3ba5(%rip),%rax        # 4ff0 <_ITM_registerTMCloneTable>
    144b:	48 85 c0             	test   %rax,%rax
    144e:	74 08                	je     1458 <register_tm_clones+0x38>
    1450:	ff e0                	jmpq   *%rax
    1452:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1458:	c3                   	retq   
    1459:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001460 <__do_global_dtors_aux>:
    1460:	f3 0f 1e fa          	endbr64 
    1464:	80 3d 3d 42 00 00 00 	cmpb   $0x0,0x423d(%rip)        # 56a8 <completed.0>
    146b:	75 2b                	jne    1498 <__do_global_dtors_aux+0x38>
    146d:	55                   	push   %rbp
    146e:	48 83 3d 82 3b 00 00 	cmpq   $0x0,0x3b82(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    1475:	00 
    1476:	48 89 e5             	mov    %rsp,%rbp
    1479:	74 0c                	je     1487 <__do_global_dtors_aux+0x27>
    147b:	48 8b 3d 86 3b 00 00 	mov    0x3b86(%rip),%rdi        # 5008 <__dso_handle>
    1482:	e8 69 fd ff ff       	callq  11f0 <__cxa_finalize@plt>
    1487:	e8 64 ff ff ff       	callq  13f0 <deregister_tm_clones>
    148c:	c6 05 15 42 00 00 01 	movb   $0x1,0x4215(%rip)        # 56a8 <completed.0>
    1493:	5d                   	pop    %rbp
    1494:	c3                   	retq   
    1495:	0f 1f 00             	nopl   (%rax)
    1498:	c3                   	retq   
    1499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014a0 <frame_dummy>:
    14a0:	f3 0f 1e fa          	endbr64 
    14a4:	e9 77 ff ff ff       	jmpq   1420 <register_tm_clones>

00000000000014a9 <main>:
    14a9:	f3 0f 1e fa          	endbr64 
    14ad:	53                   	push   %rbx
    14ae:	83 ff 01             	cmp    $0x1,%edi
    14b1:	0f 84 f8 00 00 00    	je     15af <main+0x106>
    14b7:	48 89 f3             	mov    %rsi,%rbx
    14ba:	83 ff 02             	cmp    $0x2,%edi
    14bd:	0f 85 21 01 00 00    	jne    15e4 <main+0x13b>
    14c3:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    14c7:	48 8d 35 36 1b 00 00 	lea    0x1b36(%rip),%rsi        # 3004 <_IO_stdin_used+0x4>
    14ce:	e8 5d fe ff ff       	callq  1330 <fopen@plt>
    14d3:	48 89 05 d6 41 00 00 	mov    %rax,0x41d6(%rip)        # 56b0 <infile>
    14da:	48 85 c0             	test   %rax,%rax
    14dd:	0f 84 df 00 00 00    	je     15c2 <main+0x119>
    14e3:	e8 7c 06 00 00       	callq  1b64 <initialize_bomb>
    14e8:	48 8d 3d 99 1b 00 00 	lea    0x1b99(%rip),%rdi        # 3088 <_IO_stdin_used+0x88>
    14ef:	e8 4c fd ff ff       	callq  1240 <puts@plt>
    14f4:	48 8d 3d cd 1b 00 00 	lea    0x1bcd(%rip),%rdi        # 30c8 <_IO_stdin_used+0xc8>
    14fb:	e8 40 fd ff ff       	callq  1240 <puts@plt>
    1500:	e8 5f 09 00 00       	callq  1e64 <read_line>
    1505:	48 89 c7             	mov    %rax,%rdi
    1508:	e8 fa 00 00 00       	callq  1607 <phase_1>
    150d:	e8 8d 0a 00 00       	callq  1f9f <phase_defused>
    1512:	48 8d 3d df 1b 00 00 	lea    0x1bdf(%rip),%rdi        # 30f8 <_IO_stdin_used+0xf8>
    1519:	e8 22 fd ff ff       	callq  1240 <puts@plt>
    151e:	e8 41 09 00 00       	callq  1e64 <read_line>
    1523:	48 89 c7             	mov    %rax,%rdi
    1526:	e8 00 01 00 00       	callq  162b <phase_2>
    152b:	e8 6f 0a 00 00       	callq  1f9f <phase_defused>
    1530:	48 8d 3d 06 1b 00 00 	lea    0x1b06(%rip),%rdi        # 303d <_IO_stdin_used+0x3d>
    1537:	e8 04 fd ff ff       	callq  1240 <puts@plt>
    153c:	e8 23 09 00 00       	callq  1e64 <read_line>
    1541:	48 89 c7             	mov    %rax,%rdi
    1544:	e8 56 01 00 00       	callq  169f <phase_3>
    1549:	e8 51 0a 00 00       	callq  1f9f <phase_defused>
    154e:	48 8d 3d 06 1b 00 00 	lea    0x1b06(%rip),%rdi        # 305b <_IO_stdin_used+0x5b>
    1555:	e8 e6 fc ff ff       	callq  1240 <puts@plt>
    155a:	e8 05 09 00 00       	callq  1e64 <read_line>
    155f:	48 89 c7             	mov    %rax,%rdi
    1562:	e8 29 02 00 00       	callq  1790 <phase_4>
    1567:	e8 33 0a 00 00       	callq  1f9f <phase_defused>
    156c:	48 8d 3d b5 1b 00 00 	lea    0x1bb5(%rip),%rdi        # 3128 <_IO_stdin_used+0x128>
    1573:	e8 c8 fc ff ff       	callq  1240 <puts@plt>
    1578:	e8 e7 08 00 00       	callq  1e64 <read_line>
    157d:	48 89 c7             	mov    %rax,%rdi
    1580:	e8 84 02 00 00       	callq  1809 <phase_5>
    1585:	e8 15 0a 00 00       	callq  1f9f <phase_defused>
    158a:	48 8d 3d d9 1a 00 00 	lea    0x1ad9(%rip),%rdi        # 306a <_IO_stdin_used+0x6a>
    1591:	e8 aa fc ff ff       	callq  1240 <puts@plt>
    1596:	e8 c9 08 00 00       	callq  1e64 <read_line>
    159b:	48 89 c7             	mov    %rax,%rdi
    159e:	e8 b2 02 00 00       	callq  1855 <phase_6>
    15a3:	e8 f7 09 00 00       	callq  1f9f <phase_defused>
    15a8:	b8 00 00 00 00       	mov    $0x0,%eax
    15ad:	5b                   	pop    %rbx
    15ae:	c3                   	retq   
    15af:	48 8b 05 da 40 00 00 	mov    0x40da(%rip),%rax        # 5690 <stdin@@GLIBC_2.2.5>
    15b6:	48 89 05 f3 40 00 00 	mov    %rax,0x40f3(%rip)        # 56b0 <infile>
    15bd:	e9 21 ff ff ff       	jmpq   14e3 <main+0x3a>
    15c2:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
    15c6:	48 8b 13             	mov    (%rbx),%rdx
    15c9:	48 8d 35 36 1a 00 00 	lea    0x1a36(%rip),%rsi        # 3006 <_IO_stdin_used+0x6>
    15d0:	bf 01 00 00 00       	mov    $0x1,%edi
    15d5:	e8 46 fd ff ff       	callq  1320 <__printf_chk@plt>
    15da:	bf 08 00 00 00       	mov    $0x8,%edi
    15df:	e8 6c fd ff ff       	callq  1350 <exit@plt>
    15e4:	48 8b 16             	mov    (%rsi),%rdx
    15e7:	48 8d 35 35 1a 00 00 	lea    0x1a35(%rip),%rsi        # 3023 <_IO_stdin_used+0x23>
    15ee:	bf 01 00 00 00       	mov    $0x1,%edi
    15f3:	b8 00 00 00 00       	mov    $0x0,%eax
    15f8:	e8 23 fd ff ff       	callq  1320 <__printf_chk@plt>
    15fd:	bf 08 00 00 00       	mov    $0x8,%edi
    1602:	e8 49 fd ff ff       	callq  1350 <exit@plt>

0000000000001607 <phase_1>:
    1607:	f3 0f 1e fa          	endbr64 
    160b:	48 83 ec 08          	sub    $0x8,%rsp
    160f:	48 8d 35 3a 1b 00 00 	lea    0x1b3a(%rip),%rsi        # 3150 <_IO_stdin_used+0x150>
    1616:	e8 e9 04 00 00       	callq  1b04 <strings_not_equal>
    161b:	85 c0                	test   %eax,%eax
    161d:	75 05                	jne    1624 <phase_1+0x1d>
    161f:	48 83 c4 08          	add    $0x8,%rsp
    1623:	c3                   	retq   
    1624:	e8 b4 07 00 00       	callq  1ddd <explode_bomb>
    1629:	eb f4                	jmp    161f <phase_1+0x18>

000000000000162b <phase_2>:
    162b:	f3 0f 1e fa          	endbr64 
    162f:	55                   	push   %rbp
    1630:	53                   	push   %rbx
    1631:	48 83 ec 28          	sub    $0x28,%rsp
    1635:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    163c:	00 00 
    163e:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1643:	31 c0                	xor    %eax,%eax
    1645:	48 89 e6             	mov    %rsp,%rsi
    1648:	e8 d2 07 00 00       	callq  1e1f <read_six_numbers>
    164d:	83 3c 24 00          	cmpl   $0x0,(%rsp)
    1651:	75 07                	jne    165a <phase_2+0x2f>
    1653:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
    1658:	74 05                	je     165f <phase_2+0x34>
    165a:	e8 7e 07 00 00       	callq  1ddd <explode_bomb>
    165f:	48 89 e3             	mov    %rsp,%rbx
    1662:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
    1667:	eb 09                	jmp    1672 <phase_2+0x47>
    1669:	48 83 c3 04          	add    $0x4,%rbx
    166d:	48 39 eb             	cmp    %rbp,%rbx
    1670:	74 11                	je     1683 <phase_2+0x58>
    1672:	8b 43 04             	mov    0x4(%rbx),%eax
    1675:	03 03                	add    (%rbx),%eax
    1677:	39 43 08             	cmp    %eax,0x8(%rbx)
    167a:	74 ed                	je     1669 <phase_2+0x3e>
    167c:	e8 5c 07 00 00       	callq  1ddd <explode_bomb>
    1681:	eb e6                	jmp    1669 <phase_2+0x3e>
    1683:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    1688:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    168f:	00 00 
    1691:	75 07                	jne    169a <phase_2+0x6f>
    1693:	48 83 c4 28          	add    $0x28,%rsp
    1697:	5b                   	pop    %rbx
    1698:	5d                   	pop    %rbp
    1699:	c3                   	retq   
    169a:	e8 d1 fb ff ff       	callq  1270 <__stack_chk_fail@plt>

000000000000169f <phase_3>:
    169f:	f3 0f 1e fa          	endbr64 
    16a3:	48 83 ec 18          	sub    $0x18,%rsp
    16a7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    16ae:	00 00 
    16b0:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    16b5:	31 c0                	xor    %eax,%eax
    16b7:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
    16bc:	48 89 e2             	mov    %rsp,%rdx
    16bf:	48 8d 35 27 1d 00 00 	lea    0x1d27(%rip),%rsi        # 33ed <array.0+0x22d>
    16c6:	e8 45 fc ff ff       	callq  1310 <__isoc99_sscanf@plt>
    16cb:	83 f8 01             	cmp    $0x1,%eax
    16ce:	7e 1a                	jle    16ea <phase_3+0x4b>
    16d0:	83 3c 24 07          	cmpl   $0x7,(%rsp)
    16d4:	77 65                	ja     173b <phase_3+0x9c>
    16d6:	8b 04 24             	mov    (%rsp),%eax
    16d9:	48 8d 15 c0 1a 00 00 	lea    0x1ac0(%rip),%rdx        # 31a0 <_IO_stdin_used+0x1a0>
    16e0:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    16e4:	48 01 d0             	add    %rdx,%rax
    16e7:	3e ff e0             	notrack jmpq *%rax
    16ea:	e8 ee 06 00 00       	callq  1ddd <explode_bomb>
    16ef:	eb df                	jmp    16d0 <phase_3+0x31>
    16f1:	b8 9a 02 00 00       	mov    $0x29a,%eax
    16f6:	39 44 24 04          	cmp    %eax,0x4(%rsp)
    16fa:	75 52                	jne    174e <phase_3+0xaf>
    16fc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1701:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    1708:	00 00 
    170a:	75 49                	jne    1755 <phase_3+0xb6>
    170c:	48 83 c4 18          	add    $0x18,%rsp
    1710:	c3                   	retq   
    1711:	b8 d4 03 00 00       	mov    $0x3d4,%eax
    1716:	eb de                	jmp    16f6 <phase_3+0x57>
    1718:	b8 ea 01 00 00       	mov    $0x1ea,%eax
    171d:	eb d7                	jmp    16f6 <phase_3+0x57>
    171f:	b8 84 03 00 00       	mov    $0x384,%eax
    1724:	eb d0                	jmp    16f6 <phase_3+0x57>
    1726:	b8 3e 01 00 00       	mov    $0x13e,%eax
    172b:	eb c9                	jmp    16f6 <phase_3+0x57>
    172d:	b8 8a 01 00 00       	mov    $0x18a,%eax
    1732:	eb c2                	jmp    16f6 <phase_3+0x57>
    1734:	b8 bb 03 00 00       	mov    $0x3bb,%eax
    1739:	eb bb                	jmp    16f6 <phase_3+0x57>
    173b:	e8 9d 06 00 00       	callq  1ddd <explode_bomb>
    1740:	b8 00 00 00 00       	mov    $0x0,%eax
    1745:	eb af                	jmp    16f6 <phase_3+0x57>
    1747:	b8 bf 01 00 00       	mov    $0x1bf,%eax
    174c:	eb a8                	jmp    16f6 <phase_3+0x57>
    174e:	e8 8a 06 00 00       	callq  1ddd <explode_bomb>
    1753:	eb a7                	jmp    16fc <phase_3+0x5d>
    1755:	e8 16 fb ff ff       	callq  1270 <__stack_chk_fail@plt>

000000000000175a <func4>:
    175a:	f3 0f 1e fa          	endbr64 
    175e:	53                   	push   %rbx
    175f:	89 d0                	mov    %edx,%eax
    1761:	29 f0                	sub    %esi,%eax
    1763:	89 c3                	mov    %eax,%ebx
    1765:	c1 eb 1f             	shr    $0x1f,%ebx
    1768:	01 c3                	add    %eax,%ebx
    176a:	d1 fb                	sar    %ebx
    176c:	01 f3                	add    %esi,%ebx
    176e:	39 fb                	cmp    %edi,%ebx
    1770:	7f 06                	jg     1778 <func4+0x1e>
    1772:	7c 10                	jl     1784 <func4+0x2a>
    1774:	89 d8                	mov    %ebx,%eax
    1776:	5b                   	pop    %rbx
    1777:	c3                   	retq   
    1778:	8d 53 ff             	lea    -0x1(%rbx),%edx
    177b:	e8 da ff ff ff       	callq  175a <func4>
    1780:	01 c3                	add    %eax,%ebx
    1782:	eb f0                	jmp    1774 <func4+0x1a>
    1784:	8d 73 01             	lea    0x1(%rbx),%esi
    1787:	e8 ce ff ff ff       	callq  175a <func4>
    178c:	01 c3                	add    %eax,%ebx
    178e:	eb e4                	jmp    1774 <func4+0x1a>

0000000000001790 <phase_4>:
    1790:	f3 0f 1e fa          	endbr64 
    1794:	48 83 ec 18          	sub    $0x18,%rsp
    1798:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    179f:	00 00 
    17a1:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    17a6:	31 c0                	xor    %eax,%eax
    17a8:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
    17ad:	48 89 e2             	mov    %rsp,%rdx
    17b0:	48 8d 35 36 1c 00 00 	lea    0x1c36(%rip),%rsi        # 33ed <array.0+0x22d>
    17b7:	e8 54 fb ff ff       	callq  1310 <__isoc99_sscanf@plt>
    17bc:	83 f8 02             	cmp    $0x2,%eax
    17bf:	75 06                	jne    17c7 <phase_4+0x37>
    17c1:	83 3c 24 0e          	cmpl   $0xe,(%rsp)
    17c5:	76 05                	jbe    17cc <phase_4+0x3c>
    17c7:	e8 11 06 00 00       	callq  1ddd <explode_bomb>
    17cc:	ba 0e 00 00 00       	mov    $0xe,%edx
    17d1:	be 00 00 00 00       	mov    $0x0,%esi
    17d6:	8b 3c 24             	mov    (%rsp),%edi
    17d9:	e8 7c ff ff ff       	callq  175a <func4>
    17de:	83 f8 13             	cmp    $0x13,%eax
    17e1:	75 07                	jne    17ea <phase_4+0x5a>
    17e3:	83 7c 24 04 13       	cmpl   $0x13,0x4(%rsp)
    17e8:	74 05                	je     17ef <phase_4+0x5f>
    17ea:	e8 ee 05 00 00       	callq  1ddd <explode_bomb>
    17ef:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    17f4:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    17fb:	00 00 
    17fd:	75 05                	jne    1804 <phase_4+0x74>
    17ff:	48 83 c4 18          	add    $0x18,%rsp
    1803:	c3                   	retq   
    1804:	e8 67 fa ff ff       	callq  1270 <__stack_chk_fail@plt>

0000000000001809 <phase_5>:
    1809:	f3 0f 1e fa          	endbr64 
    180d:	53                   	push   %rbx
    180e:	48 89 fb             	mov    %rdi,%rbx
    1811:	e8 cd 02 00 00       	callq  1ae3 <string_length>
    1816:	83 f8 06             	cmp    $0x6,%eax
    1819:	75 2c                	jne    1847 <phase_5+0x3e>
    181b:	48 89 d8             	mov    %rbx,%rax
    181e:	48 8d 7b 06          	lea    0x6(%rbx),%rdi
    1822:	b9 00 00 00 00       	mov    $0x0,%ecx
    1827:	48 8d 35 92 19 00 00 	lea    0x1992(%rip),%rsi        # 31c0 <array.0>
    182e:	0f b6 10             	movzbl (%rax),%edx
    1831:	83 e2 0f             	and    $0xf,%edx
    1834:	03 0c 96             	add    (%rsi,%rdx,4),%ecx
    1837:	48 83 c0 01          	add    $0x1,%rax
    183b:	48 39 f8             	cmp    %rdi,%rax
    183e:	75 ee                	jne    182e <phase_5+0x25>
    1840:	83 f9 3d             	cmp    $0x3d,%ecx
    1843:	75 09                	jne    184e <phase_5+0x45>
    1845:	5b                   	pop    %rbx
    1846:	c3                   	retq   
    1847:	e8 91 05 00 00       	callq  1ddd <explode_bomb>
    184c:	eb cd                	jmp    181b <phase_5+0x12>
    184e:	e8 8a 05 00 00       	callq  1ddd <explode_bomb>
    1853:	eb f0                	jmp    1845 <phase_5+0x3c>

0000000000001855 <phase_6>:
    1855:	f3 0f 1e fa          	endbr64 
    1859:	41 57                	push   %r15
    185b:	41 56                	push   %r14
    185d:	41 55                	push   %r13
    185f:	41 54                	push   %r12
    1861:	55                   	push   %rbp
    1862:	53                   	push   %rbx
    1863:	48 83 ec 68          	sub    $0x68,%rsp
    1867:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    186e:	00 00 
    1870:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    1875:	31 c0                	xor    %eax,%eax
    1877:	49 89 e6             	mov    %rsp,%r14
    187a:	4c 89 f6             	mov    %r14,%rsi
    187d:	e8 9d 05 00 00       	callq  1e1f <read_six_numbers>
    1882:	4d 89 f4             	mov    %r14,%r12
    1885:	41 bf 01 00 00 00    	mov    $0x1,%r15d
    188b:	49 89 e5             	mov    %rsp,%r13
    188e:	e9 c1 00 00 00       	jmpq   1954 <phase_6+0xff>
    1893:	e8 45 05 00 00       	callq  1ddd <explode_bomb>
    1898:	e9 c9 00 00 00       	jmpq   1966 <phase_6+0x111>
    189d:	48 83 c3 01          	add    $0x1,%rbx
    18a1:	83 fb 05             	cmp    $0x5,%ebx
    18a4:	0f 8f a2 00 00 00    	jg     194c <phase_6+0xf7>
    18aa:	41 8b 44 9d 00       	mov    0x0(%r13,%rbx,4),%eax
    18af:	39 45 00             	cmp    %eax,0x0(%rbp)
    18b2:	75 e9                	jne    189d <phase_6+0x48>
    18b4:	e8 24 05 00 00       	callq  1ddd <explode_bomb>
    18b9:	eb e2                	jmp    189d <phase_6+0x48>
    18bb:	49 8d 4c 24 18       	lea    0x18(%r12),%rcx
    18c0:	ba 07 00 00 00       	mov    $0x7,%edx
    18c5:	89 d0                	mov    %edx,%eax
    18c7:	41 2b 04 24          	sub    (%r12),%eax
    18cb:	41 89 04 24          	mov    %eax,(%r12)
    18cf:	49 83 c4 04          	add    $0x4,%r12
    18d3:	4c 39 e1             	cmp    %r12,%rcx
    18d6:	75 ed                	jne    18c5 <phase_6+0x70>
    18d8:	be 00 00 00 00       	mov    $0x0,%esi
    18dd:	8b 0c b4             	mov    (%rsp,%rsi,4),%ecx
    18e0:	b8 01 00 00 00       	mov    $0x1,%eax
    18e5:	48 8d 15 44 39 00 00 	lea    0x3944(%rip),%rdx        # 5230 <node1>
    18ec:	83 f9 01             	cmp    $0x1,%ecx
    18ef:	7e 0b                	jle    18fc <phase_6+0xa7>
    18f1:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    18f5:	83 c0 01             	add    $0x1,%eax
    18f8:	39 c8                	cmp    %ecx,%eax
    18fa:	75 f5                	jne    18f1 <phase_6+0x9c>
    18fc:	48 89 54 f4 20       	mov    %rdx,0x20(%rsp,%rsi,8)
    1901:	48 83 c6 01          	add    $0x1,%rsi
    1905:	48 83 fe 06          	cmp    $0x6,%rsi
    1909:	75 d2                	jne    18dd <phase_6+0x88>
    190b:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
    1910:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    1915:	48 89 43 08          	mov    %rax,0x8(%rbx)
    1919:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    191e:	48 89 50 08          	mov    %rdx,0x8(%rax)
    1922:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    1927:	48 89 42 08          	mov    %rax,0x8(%rdx)
    192b:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
    1930:	48 89 50 08          	mov    %rdx,0x8(%rax)
    1934:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    1939:	48 89 42 08          	mov    %rax,0x8(%rdx)
    193d:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    1944:	00 
    1945:	bd 05 00 00 00       	mov    $0x5,%ebp
    194a:	eb 35                	jmp    1981 <phase_6+0x12c>
    194c:	49 83 c7 01          	add    $0x1,%r15
    1950:	49 83 c6 04          	add    $0x4,%r14
    1954:	4c 89 f5             	mov    %r14,%rbp
    1957:	41 8b 06             	mov    (%r14),%eax
    195a:	83 e8 01             	sub    $0x1,%eax
    195d:	83 f8 05             	cmp    $0x5,%eax
    1960:	0f 87 2d ff ff ff    	ja     1893 <phase_6+0x3e>
    1966:	41 83 ff 05          	cmp    $0x5,%r15d
    196a:	0f 8f 4b ff ff ff    	jg     18bb <phase_6+0x66>
    1970:	4c 89 fb             	mov    %r15,%rbx
    1973:	e9 32 ff ff ff       	jmpq   18aa <phase_6+0x55>
    1978:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
    197c:	83 ed 01             	sub    $0x1,%ebp
    197f:	74 11                	je     1992 <phase_6+0x13d>
    1981:	48 8b 43 08          	mov    0x8(%rbx),%rax
    1985:	8b 00                	mov    (%rax),%eax
    1987:	39 03                	cmp    %eax,(%rbx)
    1989:	7d ed                	jge    1978 <phase_6+0x123>
    198b:	e8 4d 04 00 00       	callq  1ddd <explode_bomb>
    1990:	eb e6                	jmp    1978 <phase_6+0x123>
    1992:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
    1997:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    199e:	00 00 
    19a0:	75 0f                	jne    19b1 <phase_6+0x15c>
    19a2:	48 83 c4 68          	add    $0x68,%rsp
    19a6:	5b                   	pop    %rbx
    19a7:	5d                   	pop    %rbp
    19a8:	41 5c                	pop    %r12
    19aa:	41 5d                	pop    %r13
    19ac:	41 5e                	pop    %r14
    19ae:	41 5f                	pop    %r15
    19b0:	c3                   	retq   
    19b1:	e8 ba f8 ff ff       	callq  1270 <__stack_chk_fail@plt>

00000000000019b6 <fun7>:
    19b6:	f3 0f 1e fa          	endbr64 
    19ba:	48 85 ff             	test   %rdi,%rdi
    19bd:	74 32                	je     19f1 <fun7+0x3b>
    19bf:	48 83 ec 08          	sub    $0x8,%rsp
    19c3:	8b 17                	mov    (%rdi),%edx
    19c5:	39 f2                	cmp    %esi,%edx
    19c7:	7f 0c                	jg     19d5 <fun7+0x1f>
    19c9:	b8 00 00 00 00       	mov    $0x0,%eax
    19ce:	75 12                	jne    19e2 <fun7+0x2c>
    19d0:	48 83 c4 08          	add    $0x8,%rsp
    19d4:	c3                   	retq   
    19d5:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    19d9:	e8 d8 ff ff ff       	callq  19b6 <fun7>
    19de:	01 c0                	add    %eax,%eax
    19e0:	eb ee                	jmp    19d0 <fun7+0x1a>
    19e2:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
    19e6:	e8 cb ff ff ff       	callq  19b6 <fun7>
    19eb:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
    19ef:	eb df                	jmp    19d0 <fun7+0x1a>
    19f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    19f6:	c3                   	retq   

00000000000019f7 <secret_phase>:
    19f7:	f3 0f 1e fa          	endbr64 
    19fb:	53                   	push   %rbx
    19fc:	e8 63 04 00 00       	callq  1e64 <read_line>
    1a01:	48 89 c7             	mov    %rax,%rdi
    1a04:	ba 0a 00 00 00       	mov    $0xa,%edx
    1a09:	be 00 00 00 00       	mov    $0x0,%esi
    1a0e:	e8 dd f8 ff ff       	callq  12f0 <strtol@plt>
    1a13:	48 89 c3             	mov    %rax,%rbx
    1a16:	8d 40 ff             	lea    -0x1(%rax),%eax
    1a19:	3d e8 03 00 00       	cmp    $0x3e8,%eax
    1a1e:	77 26                	ja     1a46 <secret_phase+0x4f>
    1a20:	89 de                	mov    %ebx,%esi
    1a22:	48 8d 3d 27 37 00 00 	lea    0x3727(%rip),%rdi        # 5150 <n1>
    1a29:	e8 88 ff ff ff       	callq  19b6 <fun7>
    1a2e:	83 f8 06             	cmp    $0x6,%eax
    1a31:	75 1a                	jne    1a4d <secret_phase+0x56>
    1a33:	48 8d 3d 36 17 00 00 	lea    0x1736(%rip),%rdi        # 3170 <_IO_stdin_used+0x170>
    1a3a:	e8 01 f8 ff ff       	callq  1240 <puts@plt>
    1a3f:	e8 5b 05 00 00       	callq  1f9f <phase_defused>
    1a44:	5b                   	pop    %rbx
    1a45:	c3                   	retq   
    1a46:	e8 92 03 00 00       	callq  1ddd <explode_bomb>
    1a4b:	eb d3                	jmp    1a20 <secret_phase+0x29>
    1a4d:	e8 8b 03 00 00       	callq  1ddd <explode_bomb>
    1a52:	eb df                	jmp    1a33 <secret_phase+0x3c>

0000000000001a54 <sig_handler>:
    1a54:	f3 0f 1e fa          	endbr64 
    1a58:	50                   	push   %rax
    1a59:	58                   	pop    %rax
    1a5a:	48 83 ec 08          	sub    $0x8,%rsp
    1a5e:	48 8d 3d 9b 17 00 00 	lea    0x179b(%rip),%rdi        # 3200 <array.0+0x40>
    1a65:	e8 d6 f7 ff ff       	callq  1240 <puts@plt>
    1a6a:	bf 03 00 00 00       	mov    $0x3,%edi
    1a6f:	e8 0c f9 ff ff       	callq  1380 <sleep@plt>
    1a74:	48 8d 35 ee 18 00 00 	lea    0x18ee(%rip),%rsi        # 3369 <array.0+0x1a9>
    1a7b:	bf 01 00 00 00       	mov    $0x1,%edi
    1a80:	b8 00 00 00 00       	mov    $0x0,%eax
    1a85:	e8 96 f8 ff ff       	callq  1320 <__printf_chk@plt>
    1a8a:	48 8b 3d ef 3b 00 00 	mov    0x3bef(%rip),%rdi        # 5680 <stdout@@GLIBC_2.2.5>
    1a91:	e8 6a f8 ff ff       	callq  1300 <fflush@plt>
    1a96:	bf 01 00 00 00       	mov    $0x1,%edi
    1a9b:	e8 e0 f8 ff ff       	callq  1380 <sleep@plt>
    1aa0:	48 8d 3d ca 18 00 00 	lea    0x18ca(%rip),%rdi        # 3371 <array.0+0x1b1>
    1aa7:	e8 94 f7 ff ff       	callq  1240 <puts@plt>
    1aac:	bf 10 00 00 00       	mov    $0x10,%edi
    1ab1:	e8 9a f8 ff ff       	callq  1350 <exit@plt>

0000000000001ab6 <invalid_phase>:
    1ab6:	f3 0f 1e fa          	endbr64 
    1aba:	50                   	push   %rax
    1abb:	58                   	pop    %rax
    1abc:	48 83 ec 08          	sub    $0x8,%rsp
    1ac0:	48 89 fa             	mov    %rdi,%rdx
    1ac3:	48 8d 35 af 18 00 00 	lea    0x18af(%rip),%rsi        # 3379 <array.0+0x1b9>
    1aca:	bf 01 00 00 00       	mov    $0x1,%edi
    1acf:	b8 00 00 00 00       	mov    $0x0,%eax
    1ad4:	e8 47 f8 ff ff       	callq  1320 <__printf_chk@plt>
    1ad9:	bf 08 00 00 00       	mov    $0x8,%edi
    1ade:	e8 6d f8 ff ff       	callq  1350 <exit@plt>

0000000000001ae3 <string_length>:
    1ae3:	f3 0f 1e fa          	endbr64 
    1ae7:	80 3f 00             	cmpb   $0x0,(%rdi)
    1aea:	74 12                	je     1afe <string_length+0x1b>
    1aec:	b8 00 00 00 00       	mov    $0x0,%eax
    1af1:	48 83 c7 01          	add    $0x1,%rdi
    1af5:	83 c0 01             	add    $0x1,%eax
    1af8:	80 3f 00             	cmpb   $0x0,(%rdi)
    1afb:	75 f4                	jne    1af1 <string_length+0xe>
    1afd:	c3                   	retq   
    1afe:	b8 00 00 00 00       	mov    $0x0,%eax
    1b03:	c3                   	retq   

0000000000001b04 <strings_not_equal>:
    1b04:	f3 0f 1e fa          	endbr64 
    1b08:	41 54                	push   %r12
    1b0a:	55                   	push   %rbp
    1b0b:	53                   	push   %rbx
    1b0c:	48 89 fb             	mov    %rdi,%rbx
    1b0f:	48 89 f5             	mov    %rsi,%rbp
    1b12:	e8 cc ff ff ff       	callq  1ae3 <string_length>
    1b17:	41 89 c4             	mov    %eax,%r12d
    1b1a:	48 89 ef             	mov    %rbp,%rdi
    1b1d:	e8 c1 ff ff ff       	callq  1ae3 <string_length>
    1b22:	89 c2                	mov    %eax,%edx
    1b24:	b8 01 00 00 00       	mov    $0x1,%eax
    1b29:	41 39 d4             	cmp    %edx,%r12d
    1b2c:	75 31                	jne    1b5f <strings_not_equal+0x5b>
    1b2e:	0f b6 13             	movzbl (%rbx),%edx
    1b31:	84 d2                	test   %dl,%dl
    1b33:	74 1e                	je     1b53 <strings_not_equal+0x4f>
    1b35:	b8 00 00 00 00       	mov    $0x0,%eax
    1b3a:	38 54 05 00          	cmp    %dl,0x0(%rbp,%rax,1)
    1b3e:	75 1a                	jne    1b5a <strings_not_equal+0x56>
    1b40:	48 83 c0 01          	add    $0x1,%rax
    1b44:	0f b6 14 03          	movzbl (%rbx,%rax,1),%edx
    1b48:	84 d2                	test   %dl,%dl
    1b4a:	75 ee                	jne    1b3a <strings_not_equal+0x36>
    1b4c:	b8 00 00 00 00       	mov    $0x0,%eax
    1b51:	eb 0c                	jmp    1b5f <strings_not_equal+0x5b>
    1b53:	b8 00 00 00 00       	mov    $0x0,%eax
    1b58:	eb 05                	jmp    1b5f <strings_not_equal+0x5b>
    1b5a:	b8 01 00 00 00       	mov    $0x1,%eax
    1b5f:	5b                   	pop    %rbx
    1b60:	5d                   	pop    %rbp
    1b61:	41 5c                	pop    %r12
    1b63:	c3                   	retq   

0000000000001b64 <initialize_bomb>:
    1b64:	f3 0f 1e fa          	endbr64 
    1b68:	55                   	push   %rbp
    1b69:	53                   	push   %rbx
    1b6a:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1b71:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1b76:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1b7d:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1b82:	48 83 ec 58          	sub    $0x58,%rsp
    1b86:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1b8d:	00 00 
    1b8f:	48 89 84 24 48 20 00 	mov    %rax,0x2048(%rsp)
    1b96:	00 
    1b97:	31 c0                	xor    %eax,%eax
    1b99:	48 8d 35 b4 fe ff ff 	lea    -0x14c(%rip),%rsi        # 1a54 <sig_handler>
    1ba0:	bf 02 00 00 00       	mov    $0x2,%edi
    1ba5:	e8 16 f7 ff ff       	callq  12c0 <signal@plt>
    1baa:	48 89 e7             	mov    %rsp,%rdi
    1bad:	be 40 00 00 00       	mov    $0x40,%esi
    1bb2:	e8 89 f7 ff ff       	callq  1340 <gethostname@plt>
    1bb7:	85 c0                	test   %eax,%eax
    1bb9:	75 5a                	jne    1c15 <initialize_bomb+0xb1>
    1bbb:	48 8b 3d be 36 00 00 	mov    0x36be(%rip),%rdi        # 5280 <host_table>
    1bc2:	48 8d 1d bf 36 00 00 	lea    0x36bf(%rip),%rbx        # 5288 <host_table+0x8>
    1bc9:	48 89 e5             	mov    %rsp,%rbp
    1bcc:	48 85 ff             	test   %rdi,%rdi
    1bcf:	74 19                	je     1bea <initialize_bomb+0x86>
    1bd1:	48 89 ee             	mov    %rbp,%rsi
    1bd4:	e8 37 f6 ff ff       	callq  1210 <strcasecmp@plt>
    1bd9:	85 c0                	test   %eax,%eax
    1bdb:	74 0d                	je     1bea <initialize_bomb+0x86>
    1bdd:	48 83 c3 08          	add    $0x8,%rbx
    1be1:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
    1be5:	48 85 ff             	test   %rdi,%rdi
    1be8:	75 e7                	jne    1bd1 <initialize_bomb+0x6d>
    1bea:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    1bef:	e8 b2 0d 00 00       	callq  29a6 <init_driver>
    1bf4:	85 c0                	test   %eax,%eax
    1bf6:	78 33                	js     1c2b <initialize_bomb+0xc7>
    1bf8:	48 8b 84 24 48 20 00 	mov    0x2048(%rsp),%rax
    1bff:	00 
    1c00:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    1c07:	00 00 
    1c09:	75 45                	jne    1c50 <initialize_bomb+0xec>
    1c0b:	48 81 c4 58 20 00 00 	add    $0x2058,%rsp
    1c12:	5b                   	pop    %rbx
    1c13:	5d                   	pop    %rbp
    1c14:	c3                   	retq   
    1c15:	48 8d 3d 1c 16 00 00 	lea    0x161c(%rip),%rdi        # 3238 <array.0+0x78>
    1c1c:	e8 1f f6 ff ff       	callq  1240 <puts@plt>
    1c21:	bf 08 00 00 00       	mov    $0x8,%edi
    1c26:	e8 25 f7 ff ff       	callq  1350 <exit@plt>
    1c2b:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
    1c30:	48 8d 35 53 17 00 00 	lea    0x1753(%rip),%rsi        # 338a <array.0+0x1ca>
    1c37:	bf 01 00 00 00       	mov    $0x1,%edi
    1c3c:	b8 00 00 00 00       	mov    $0x0,%eax
    1c41:	e8 da f6 ff ff       	callq  1320 <__printf_chk@plt>
    1c46:	bf 08 00 00 00       	mov    $0x8,%edi
    1c4b:	e8 00 f7 ff ff       	callq  1350 <exit@plt>
    1c50:	e8 1b f6 ff ff       	callq  1270 <__stack_chk_fail@plt>

0000000000001c55 <initialize_bomb_solve>:
    1c55:	f3 0f 1e fa          	endbr64 
    1c59:	c3                   	retq   

0000000000001c5a <blank_line>:
    1c5a:	f3 0f 1e fa          	endbr64 
    1c5e:	55                   	push   %rbp
    1c5f:	53                   	push   %rbx
    1c60:	48 83 ec 08          	sub    $0x8,%rsp
    1c64:	48 89 fd             	mov    %rdi,%rbp
    1c67:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    1c6b:	84 db                	test   %bl,%bl
    1c6d:	74 1e                	je     1c8d <blank_line+0x33>
    1c6f:	e8 1c f7 ff ff       	callq  1390 <__ctype_b_loc@plt>
    1c74:	48 83 c5 01          	add    $0x1,%rbp
    1c78:	48 0f be db          	movsbq %bl,%rbx
    1c7c:	48 8b 00             	mov    (%rax),%rax
    1c7f:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
    1c84:	75 e1                	jne    1c67 <blank_line+0xd>
    1c86:	b8 00 00 00 00       	mov    $0x0,%eax
    1c8b:	eb 05                	jmp    1c92 <blank_line+0x38>
    1c8d:	b8 01 00 00 00       	mov    $0x1,%eax
    1c92:	48 83 c4 08          	add    $0x8,%rsp
    1c96:	5b                   	pop    %rbx
    1c97:	5d                   	pop    %rbp
    1c98:	c3                   	retq   

0000000000001c99 <skip>:
    1c99:	f3 0f 1e fa          	endbr64 
    1c9d:	55                   	push   %rbp
    1c9e:	53                   	push   %rbx
    1c9f:	48 83 ec 08          	sub    $0x8,%rsp
    1ca3:	48 8d 2d 76 3a 00 00 	lea    0x3a76(%rip),%rbp        # 5720 <input_strings>
    1caa:	48 63 05 5f 3a 00 00 	movslq 0x3a5f(%rip),%rax        # 5710 <num_input_strings>
    1cb1:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
    1cb5:	48 c1 e7 04          	shl    $0x4,%rdi
    1cb9:	48 01 ef             	add    %rbp,%rdi
    1cbc:	48 8b 15 ed 39 00 00 	mov    0x39ed(%rip),%rdx        # 56b0 <infile>
    1cc3:	be 50 00 00 00       	mov    $0x50,%esi
    1cc8:	e8 e3 f5 ff ff       	callq  12b0 <fgets@plt>
    1ccd:	48 89 c3             	mov    %rax,%rbx
    1cd0:	48 85 c0             	test   %rax,%rax
    1cd3:	74 0c                	je     1ce1 <skip+0x48>
    1cd5:	48 89 c7             	mov    %rax,%rdi
    1cd8:	e8 7d ff ff ff       	callq  1c5a <blank_line>
    1cdd:	85 c0                	test   %eax,%eax
    1cdf:	75 c9                	jne    1caa <skip+0x11>
    1ce1:	48 89 d8             	mov    %rbx,%rax
    1ce4:	48 83 c4 08          	add    $0x8,%rsp
    1ce8:	5b                   	pop    %rbx
    1ce9:	5d                   	pop    %rbp
    1cea:	c3                   	retq   

0000000000001ceb <send_msg>:
    1ceb:	f3 0f 1e fa          	endbr64 
    1cef:	53                   	push   %rbx
    1cf0:	4c 8d 9c 24 00 c0 ff 	lea    -0x4000(%rsp),%r11
    1cf7:	ff 
    1cf8:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1cff:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1d04:	4c 39 dc             	cmp    %r11,%rsp
    1d07:	75 ef                	jne    1cf8 <send_msg+0xd>
    1d09:	48 83 ec 10          	sub    $0x10,%rsp
    1d0d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1d14:	00 00 
    1d16:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
    1d1d:	00 
    1d1e:	31 c0                	xor    %eax,%eax
    1d20:	8b 15 ea 39 00 00    	mov    0x39ea(%rip),%edx        # 5710 <num_input_strings>
    1d26:	8d 42 ff             	lea    -0x1(%rdx),%eax
    1d29:	48 98                	cltq   
    1d2b:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    1d2f:	48 c1 e0 04          	shl    $0x4,%rax
    1d33:	48 8d 0d e6 39 00 00 	lea    0x39e6(%rip),%rcx        # 5720 <input_strings>
    1d3a:	48 01 c8             	add    %rcx,%rax
    1d3d:	85 ff                	test   %edi,%edi
    1d3f:	4c 8d 0d 5e 16 00 00 	lea    0x165e(%rip),%r9        # 33a4 <array.0+0x1e4>
    1d46:	48 8d 0d 5f 16 00 00 	lea    0x165f(%rip),%rcx        # 33ac <array.0+0x1ec>
    1d4d:	4c 0f 44 c9          	cmove  %rcx,%r9
    1d51:	48 89 e3             	mov    %rsp,%rbx
    1d54:	50                   	push   %rax
    1d55:	52                   	push   %rdx
    1d56:	44 8b 05 e7 33 00 00 	mov    0x33e7(%rip),%r8d        # 5144 <bomb_id>
    1d5d:	48 8d 0d 51 16 00 00 	lea    0x1651(%rip),%rcx        # 33b5 <array.0+0x1f5>
    1d64:	ba 00 20 00 00       	mov    $0x2000,%edx
    1d69:	be 01 00 00 00       	mov    $0x1,%esi
    1d6e:	48 89 df             	mov    %rbx,%rdi
    1d71:	b8 00 00 00 00       	mov    $0x0,%eax
    1d76:	e8 25 f6 ff ff       	callq  13a0 <__sprintf_chk@plt>
    1d7b:	4c 8d 84 24 10 20 00 	lea    0x2010(%rsp),%r8
    1d82:	00 
    1d83:	b9 00 00 00 00       	mov    $0x0,%ecx
    1d88:	48 89 da             	mov    %rbx,%rdx
    1d8b:	48 8d 35 8e 33 00 00 	lea    0x338e(%rip),%rsi        # 5120 <user_password>
    1d92:	48 8d 3d 9f 33 00 00 	lea    0x339f(%rip),%rdi        # 5138 <userid>
    1d99:	e8 fd 0d 00 00       	callq  2b9b <driver_post>
    1d9e:	48 89 dc             	mov    %rbx,%rsp
    1da1:	85 c0                	test   %eax,%eax
    1da3:	78 1c                	js     1dc1 <send_msg+0xd6>
    1da5:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
    1dac:	00 
    1dad:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    1db4:	00 00 
    1db6:	75 20                	jne    1dd8 <send_msg+0xed>
    1db8:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
    1dbf:	5b                   	pop    %rbx
    1dc0:	c3                   	retq   
    1dc1:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
    1dc8:	00 
    1dc9:	e8 72 f4 ff ff       	callq  1240 <puts@plt>
    1dce:	bf 00 00 00 00       	mov    $0x0,%edi
    1dd3:	e8 78 f5 ff ff       	callq  1350 <exit@plt>
    1dd8:	e8 93 f4 ff ff       	callq  1270 <__stack_chk_fail@plt>

0000000000001ddd <explode_bomb>:
    1ddd:	f3 0f 1e fa          	endbr64 
    1de1:	50                   	push   %rax
    1de2:	58                   	pop    %rax
    1de3:	48 83 ec 08          	sub    $0x8,%rsp
    1de7:	48 8d 3d d3 15 00 00 	lea    0x15d3(%rip),%rdi        # 33c1 <array.0+0x201>
    1dee:	e8 4d f4 ff ff       	callq  1240 <puts@plt>
    1df3:	48 8d 3d d0 15 00 00 	lea    0x15d0(%rip),%rdi        # 33ca <array.0+0x20a>
    1dfa:	e8 41 f4 ff ff       	callq  1240 <puts@plt>
    1dff:	bf 00 00 00 00       	mov    $0x0,%edi
    1e04:	e8 e2 fe ff ff       	callq  1ceb <send_msg>
    1e09:	48 8d 3d 60 14 00 00 	lea    0x1460(%rip),%rdi        # 3270 <array.0+0xb0>
    1e10:	e8 2b f4 ff ff       	callq  1240 <puts@plt>
    1e15:	bf 08 00 00 00       	mov    $0x8,%edi
    1e1a:	e8 31 f5 ff ff       	callq  1350 <exit@plt>

0000000000001e1f <read_six_numbers>:
    1e1f:	f3 0f 1e fa          	endbr64 
    1e23:	48 83 ec 08          	sub    $0x8,%rsp
    1e27:	48 89 f2             	mov    %rsi,%rdx
    1e2a:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
    1e2e:	48 8d 46 14          	lea    0x14(%rsi),%rax
    1e32:	50                   	push   %rax
    1e33:	48 8d 46 10          	lea    0x10(%rsi),%rax
    1e37:	50                   	push   %rax
    1e38:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
    1e3c:	4c 8d 46 08          	lea    0x8(%rsi),%r8
    1e40:	48 8d 35 9a 15 00 00 	lea    0x159a(%rip),%rsi        # 33e1 <array.0+0x221>
    1e47:	b8 00 00 00 00       	mov    $0x0,%eax
    1e4c:	e8 bf f4 ff ff       	callq  1310 <__isoc99_sscanf@plt>
    1e51:	48 83 c4 10          	add    $0x10,%rsp
    1e55:	83 f8 05             	cmp    $0x5,%eax
    1e58:	7e 05                	jle    1e5f <read_six_numbers+0x40>
    1e5a:	48 83 c4 08          	add    $0x8,%rsp
    1e5e:	c3                   	retq   
    1e5f:	e8 79 ff ff ff       	callq  1ddd <explode_bomb>

0000000000001e64 <read_line>:
    1e64:	f3 0f 1e fa          	endbr64 
    1e68:	55                   	push   %rbp
    1e69:	53                   	push   %rbx
    1e6a:	48 83 ec 08          	sub    $0x8,%rsp
    1e6e:	b8 00 00 00 00       	mov    $0x0,%eax
    1e73:	e8 21 fe ff ff       	callq  1c99 <skip>
    1e78:	48 85 c0             	test   %rax,%rax
    1e7b:	74 60                	je     1edd <read_line+0x79>
    1e7d:	8b 2d 8d 38 00 00    	mov    0x388d(%rip),%ebp        # 5710 <num_input_strings>
    1e83:	48 63 c5             	movslq %ebp,%rax
    1e86:	48 8d 1c 80          	lea    (%rax,%rax,4),%rbx
    1e8a:	48 c1 e3 04          	shl    $0x4,%rbx
    1e8e:	48 8d 05 8b 38 00 00 	lea    0x388b(%rip),%rax        # 5720 <input_strings>
    1e95:	48 01 c3             	add    %rax,%rbx
    1e98:	48 89 df             	mov    %rbx,%rdi
    1e9b:	e8 c0 f3 ff ff       	callq  1260 <strlen@plt>
    1ea0:	83 f8 4e             	cmp    $0x4e,%eax
    1ea3:	0f 8f ac 00 00 00    	jg     1f55 <read_line+0xf1>
    1ea9:	83 e8 01             	sub    $0x1,%eax
    1eac:	48 98                	cltq   
    1eae:	48 63 d5             	movslq %ebp,%rdx
    1eb1:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    1eb5:	48 89 d1             	mov    %rdx,%rcx
    1eb8:	48 c1 e1 04          	shl    $0x4,%rcx
    1ebc:	48 8d 15 5d 38 00 00 	lea    0x385d(%rip),%rdx        # 5720 <input_strings>
    1ec3:	48 01 ca             	add    %rcx,%rdx
    1ec6:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
    1eca:	83 c5 01             	add    $0x1,%ebp
    1ecd:	89 2d 3d 38 00 00    	mov    %ebp,0x383d(%rip)        # 5710 <num_input_strings>
    1ed3:	48 89 d8             	mov    %rbx,%rax
    1ed6:	48 83 c4 08          	add    $0x8,%rsp
    1eda:	5b                   	pop    %rbx
    1edb:	5d                   	pop    %rbp
    1edc:	c3                   	retq   
    1edd:	48 8b 05 ac 37 00 00 	mov    0x37ac(%rip),%rax        # 5690 <stdin@@GLIBC_2.2.5>
    1ee4:	48 39 05 c5 37 00 00 	cmp    %rax,0x37c5(%rip)        # 56b0 <infile>
    1eeb:	74 1b                	je     1f08 <read_line+0xa4>
    1eed:	48 8d 3d 1d 15 00 00 	lea    0x151d(%rip),%rdi        # 3411 <array.0+0x251>
    1ef4:	e8 07 f3 ff ff       	callq  1200 <getenv@plt>
    1ef9:	48 85 c0             	test   %rax,%rax
    1efc:	74 20                	je     1f1e <read_line+0xba>
    1efe:	bf 00 00 00 00       	mov    $0x0,%edi
    1f03:	e8 48 f4 ff ff       	callq  1350 <exit@plt>
    1f08:	48 8d 3d e4 14 00 00 	lea    0x14e4(%rip),%rdi        # 33f3 <array.0+0x233>
    1f0f:	e8 2c f3 ff ff       	callq  1240 <puts@plt>
    1f14:	bf 08 00 00 00       	mov    $0x8,%edi
    1f19:	e8 32 f4 ff ff       	callq  1350 <exit@plt>
    1f1e:	48 8b 05 6b 37 00 00 	mov    0x376b(%rip),%rax        # 5690 <stdin@@GLIBC_2.2.5>
    1f25:	48 89 05 84 37 00 00 	mov    %rax,0x3784(%rip)        # 56b0 <infile>
    1f2c:	b8 00 00 00 00       	mov    $0x0,%eax
    1f31:	e8 63 fd ff ff       	callq  1c99 <skip>
    1f36:	48 85 c0             	test   %rax,%rax
    1f39:	0f 85 3e ff ff ff    	jne    1e7d <read_line+0x19>
    1f3f:	48 8d 3d ad 14 00 00 	lea    0x14ad(%rip),%rdi        # 33f3 <array.0+0x233>
    1f46:	e8 f5 f2 ff ff       	callq  1240 <puts@plt>
    1f4b:	bf 00 00 00 00       	mov    $0x0,%edi
    1f50:	e8 fb f3 ff ff       	callq  1350 <exit@plt>
    1f55:	48 8d 3d c0 14 00 00 	lea    0x14c0(%rip),%rdi        # 341c <array.0+0x25c>
    1f5c:	e8 df f2 ff ff       	callq  1240 <puts@plt>
    1f61:	8b 05 a9 37 00 00    	mov    0x37a9(%rip),%eax        # 5710 <num_input_strings>
    1f67:	8d 50 01             	lea    0x1(%rax),%edx
    1f6a:	89 15 a0 37 00 00    	mov    %edx,0x37a0(%rip)        # 5710 <num_input_strings>
    1f70:	48 98                	cltq   
    1f72:	48 6b c0 50          	imul   $0x50,%rax,%rax
    1f76:	48 8d 15 a3 37 00 00 	lea    0x37a3(%rip),%rdx        # 5720 <input_strings>
    1f7d:	48 be 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rsi
    1f84:	75 6e 63 
    1f87:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
    1f8e:	2a 2a 00 
    1f91:	48 89 34 02          	mov    %rsi,(%rdx,%rax,1)
    1f95:	48 89 7c 02 08       	mov    %rdi,0x8(%rdx,%rax,1)
    1f9a:	e8 3e fe ff ff       	callq  1ddd <explode_bomb>

0000000000001f9f <phase_defused>:
    1f9f:	f3 0f 1e fa          	endbr64 
    1fa3:	48 83 ec 78          	sub    $0x78,%rsp
    1fa7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1fae:	00 00 
    1fb0:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
    1fb5:	31 c0                	xor    %eax,%eax
    1fb7:	bf 01 00 00 00       	mov    $0x1,%edi
    1fbc:	e8 2a fd ff ff       	callq  1ceb <send_msg>
    1fc1:	83 3d 48 37 00 00 06 	cmpl   $0x6,0x3748(%rip)        # 5710 <num_input_strings>
    1fc8:	74 19                	je     1fe3 <phase_defused+0x44>
    1fca:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    1fcf:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    1fd6:	00 00 
    1fd8:	0f 85 84 00 00 00    	jne    2062 <phase_defused+0xc3>
    1fde:	48 83 c4 78          	add    $0x78,%rsp
    1fe2:	c3                   	retq   
    1fe3:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
    1fe8:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    1fed:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
    1ff2:	48 8d 35 3e 14 00 00 	lea    0x143e(%rip),%rsi        # 3437 <array.0+0x277>
    1ff9:	48 8d 3d 10 38 00 00 	lea    0x3810(%rip),%rdi        # 5810 <input_strings+0xf0>
    2000:	b8 00 00 00 00       	mov    $0x0,%eax
    2005:	e8 06 f3 ff ff       	callq  1310 <__isoc99_sscanf@plt>
    200a:	83 f8 03             	cmp    $0x3,%eax
    200d:	74 1a                	je     2029 <phase_defused+0x8a>
    200f:	48 8d 3d e2 12 00 00 	lea    0x12e2(%rip),%rdi        # 32f8 <array.0+0x138>
    2016:	e8 25 f2 ff ff       	callq  1240 <puts@plt>
    201b:	48 8d 3d 06 13 00 00 	lea    0x1306(%rip),%rdi        # 3328 <array.0+0x168>
    2022:	e8 19 f2 ff ff       	callq  1240 <puts@plt>
    2027:	eb a1                	jmp    1fca <phase_defused+0x2b>
    2029:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    202e:	48 8d 35 0b 14 00 00 	lea    0x140b(%rip),%rsi        # 3440 <array.0+0x280>
    2035:	e8 ca fa ff ff       	callq  1b04 <strings_not_equal>
    203a:	85 c0                	test   %eax,%eax
    203c:	75 d1                	jne    200f <phase_defused+0x70>
    203e:	48 8d 3d 53 12 00 00 	lea    0x1253(%rip),%rdi        # 3298 <array.0+0xd8>
    2045:	e8 f6 f1 ff ff       	callq  1240 <puts@plt>
    204a:	48 8d 3d 6f 12 00 00 	lea    0x126f(%rip),%rdi        # 32c0 <array.0+0x100>
    2051:	e8 ea f1 ff ff       	callq  1240 <puts@plt>
    2056:	b8 00 00 00 00       	mov    $0x0,%eax
    205b:	e8 97 f9 ff ff       	callq  19f7 <secret_phase>
    2060:	eb ad                	jmp    200f <phase_defused+0x70>
    2062:	e8 09 f2 ff ff       	callq  1270 <__stack_chk_fail@plt>

0000000000002067 <sigalrm_handler>:
    2067:	f3 0f 1e fa          	endbr64 
    206b:	50                   	push   %rax
    206c:	58                   	pop    %rax
    206d:	48 83 ec 08          	sub    $0x8,%rsp
    2071:	b9 00 00 00 00       	mov    $0x0,%ecx
    2076:	48 8d 15 db 13 00 00 	lea    0x13db(%rip),%rdx        # 3458 <array.0+0x298>
    207d:	be 01 00 00 00       	mov    $0x1,%esi
    2082:	48 8b 3d 17 36 00 00 	mov    0x3617(%rip),%rdi        # 56a0 <stderr@@GLIBC_2.2.5>
    2089:	b8 00 00 00 00       	mov    $0x0,%eax
    208e:	e8 dd f2 ff ff       	callq  1370 <__fprintf_chk@plt>
    2093:	bf 01 00 00 00       	mov    $0x1,%edi
    2098:	e8 b3 f2 ff ff       	callq  1350 <exit@plt>

000000000000209d <rio_readlineb>:
    209d:	41 56                	push   %r14
    209f:	41 55                	push   %r13
    20a1:	41 54                	push   %r12
    20a3:	55                   	push   %rbp
    20a4:	53                   	push   %rbx
    20a5:	49 89 f4             	mov    %rsi,%r12
    20a8:	48 83 fa 01          	cmp    $0x1,%rdx
    20ac:	0f 86 92 00 00 00    	jbe    2144 <rio_readlineb+0xa7>
    20b2:	48 89 fb             	mov    %rdi,%rbx
    20b5:	4c 8d 74 16 ff       	lea    -0x1(%rsi,%rdx,1),%r14
    20ba:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    20c0:	48 8d 6f 10          	lea    0x10(%rdi),%rbp
    20c4:	eb 56                	jmp    211c <rio_readlineb+0x7f>
    20c6:	e8 55 f1 ff ff       	callq  1220 <__errno_location@plt>
    20cb:	83 38 04             	cmpl   $0x4,(%rax)
    20ce:	75 55                	jne    2125 <rio_readlineb+0x88>
    20d0:	ba 00 20 00 00       	mov    $0x2000,%edx
    20d5:	48 89 ee             	mov    %rbp,%rsi
    20d8:	8b 3b                	mov    (%rbx),%edi
    20da:	e8 c1 f1 ff ff       	callq  12a0 <read@plt>
    20df:	89 c2                	mov    %eax,%edx
    20e1:	89 43 04             	mov    %eax,0x4(%rbx)
    20e4:	85 c0                	test   %eax,%eax
    20e6:	78 de                	js     20c6 <rio_readlineb+0x29>
    20e8:	85 c0                	test   %eax,%eax
    20ea:	74 42                	je     212e <rio_readlineb+0x91>
    20ec:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    20f0:	48 8b 43 08          	mov    0x8(%rbx),%rax
    20f4:	0f b6 08             	movzbl (%rax),%ecx
    20f7:	48 83 c0 01          	add    $0x1,%rax
    20fb:	48 89 43 08          	mov    %rax,0x8(%rbx)
    20ff:	83 ea 01             	sub    $0x1,%edx
    2102:	89 53 04             	mov    %edx,0x4(%rbx)
    2105:	49 83 c4 01          	add    $0x1,%r12
    2109:	41 88 4c 24 ff       	mov    %cl,-0x1(%r12)
    210e:	80 f9 0a             	cmp    $0xa,%cl
    2111:	74 3c                	je     214f <rio_readlineb+0xb2>
    2113:	41 83 c5 01          	add    $0x1,%r13d
    2117:	4d 39 f4             	cmp    %r14,%r12
    211a:	74 30                	je     214c <rio_readlineb+0xaf>
    211c:	8b 53 04             	mov    0x4(%rbx),%edx
    211f:	85 d2                	test   %edx,%edx
    2121:	7e ad                	jle    20d0 <rio_readlineb+0x33>
    2123:	eb cb                	jmp    20f0 <rio_readlineb+0x53>
    2125:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    212c:	eb 05                	jmp    2133 <rio_readlineb+0x96>
    212e:	b8 00 00 00 00       	mov    $0x0,%eax
    2133:	85 c0                	test   %eax,%eax
    2135:	75 29                	jne    2160 <rio_readlineb+0xc3>
    2137:	b8 00 00 00 00       	mov    $0x0,%eax
    213c:	41 83 fd 01          	cmp    $0x1,%r13d
    2140:	75 0d                	jne    214f <rio_readlineb+0xb2>
    2142:	eb 13                	jmp    2157 <rio_readlineb+0xba>
    2144:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    214a:	eb 03                	jmp    214f <rio_readlineb+0xb2>
    214c:	4d 89 f4             	mov    %r14,%r12
    214f:	41 c6 04 24 00       	movb   $0x0,(%r12)
    2154:	49 63 c5             	movslq %r13d,%rax
    2157:	5b                   	pop    %rbx
    2158:	5d                   	pop    %rbp
    2159:	41 5c                	pop    %r12
    215b:	41 5d                	pop    %r13
    215d:	41 5e                	pop    %r14
    215f:	c3                   	retq   
    2160:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    2167:	eb ee                	jmp    2157 <rio_readlineb+0xba>

0000000000002169 <submitr>:
    2169:	f3 0f 1e fa          	endbr64 
    216d:	41 57                	push   %r15
    216f:	41 56                	push   %r14
    2171:	41 55                	push   %r13
    2173:	41 54                	push   %r12
    2175:	55                   	push   %rbp
    2176:	53                   	push   %rbx
    2177:	4c 8d 9c 24 00 60 ff 	lea    -0xa000(%rsp),%r11
    217e:	ff 
    217f:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    2186:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    218b:	4c 39 dc             	cmp    %r11,%rsp
    218e:	75 ef                	jne    217f <submitr+0x16>
    2190:	48 83 ec 68          	sub    $0x68,%rsp
    2194:	49 89 fd             	mov    %rdi,%r13
    2197:	89 f5                	mov    %esi,%ebp
    2199:	48 89 14 24          	mov    %rdx,(%rsp)
    219d:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    21a2:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
    21a7:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
    21ac:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
    21b3:	00 
    21b4:	4c 8b bc 24 a8 a0 00 	mov    0xa0a8(%rsp),%r15
    21bb:	00 
    21bc:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    21c3:	00 00 
    21c5:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
    21cc:	00 
    21cd:	31 c0                	xor    %eax,%eax
    21cf:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
    21d6:	00 
    21d7:	ba 00 00 00 00       	mov    $0x0,%edx
    21dc:	be 01 00 00 00       	mov    $0x1,%esi
    21e1:	bf 02 00 00 00       	mov    $0x2,%edi
    21e6:	e8 c5 f1 ff ff       	callq  13b0 <socket@plt>
    21eb:	85 c0                	test   %eax,%eax
    21ed:	0f 88 04 01 00 00    	js     22f7 <submitr+0x18e>
    21f3:	41 89 c4             	mov    %eax,%r12d
    21f6:	4c 89 ef             	mov    %r13,%rdi
    21f9:	e8 d2 f0 ff ff       	callq  12d0 <gethostbyname@plt>
    21fe:	48 85 c0             	test   %rax,%rax
    2201:	0f 84 40 01 00 00    	je     2347 <submitr+0x1de>
    2207:	4c 8d 6c 24 30       	lea    0x30(%rsp),%r13
    220c:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
    2213:	00 00 
    2215:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    221c:	00 00 
    221e:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
    2225:	48 63 50 14          	movslq 0x14(%rax),%rdx
    2229:	48 8b 40 18          	mov    0x18(%rax),%rax
    222d:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
    2232:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2237:	48 8b 30             	mov    (%rax),%rsi
    223a:	e8 a1 f0 ff ff       	callq  12e0 <__memmove_chk@plt>
    223f:	66 c1 c5 08          	rol    $0x8,%bp
    2243:	66 89 6c 24 32       	mov    %bp,0x32(%rsp)
    2248:	ba 10 00 00 00       	mov    $0x10,%edx
    224d:	4c 89 ee             	mov    %r13,%rsi
    2250:	44 89 e7             	mov    %r12d,%edi
    2253:	e8 08 f1 ff ff       	callq  1360 <connect@plt>
    2258:	85 c0                	test   %eax,%eax
    225a:	0f 88 52 01 00 00    	js     23b2 <submitr+0x249>
    2260:	48 89 df             	mov    %rbx,%rdi
    2263:	e8 f8 ef ff ff       	callq  1260 <strlen@plt>
    2268:	48 89 c5             	mov    %rax,%rbp
    226b:	48 8b 3c 24          	mov    (%rsp),%rdi
    226f:	e8 ec ef ff ff       	callq  1260 <strlen@plt>
    2274:	49 89 c6             	mov    %rax,%r14
    2277:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    227c:	e8 df ef ff ff       	callq  1260 <strlen@plt>
    2281:	49 89 c5             	mov    %rax,%r13
    2284:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    2289:	e8 d2 ef ff ff       	callq  1260 <strlen@plt>
    228e:	48 89 c2             	mov    %rax,%rdx
    2291:	4b 8d 84 2e 80 00 00 	lea    0x80(%r14,%r13,1),%rax
    2298:	00 
    2299:	48 01 d0             	add    %rdx,%rax
    229c:	48 8d 54 6d 00       	lea    0x0(%rbp,%rbp,2),%rdx
    22a1:	48 01 d0             	add    %rdx,%rax
    22a4:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    22aa:	0f 87 5f 01 00 00    	ja     240f <submitr+0x2a6>
    22b0:	48 8d 94 24 50 40 00 	lea    0x4050(%rsp),%rdx
    22b7:	00 
    22b8:	b9 00 04 00 00       	mov    $0x400,%ecx
    22bd:	b8 00 00 00 00       	mov    $0x0,%eax
    22c2:	48 89 d7             	mov    %rdx,%rdi
    22c5:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    22c8:	48 89 df             	mov    %rbx,%rdi
    22cb:	e8 90 ef ff ff       	callq  1260 <strlen@plt>
    22d0:	85 c0                	test   %eax,%eax
    22d2:	0f 84 0d 05 00 00    	je     27e5 <submitr+0x67c>
    22d8:	8d 40 ff             	lea    -0x1(%rax),%eax
    22db:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
    22e0:	48 8d ac 24 50 40 00 	lea    0x4050(%rsp),%rbp
    22e7:	00 
    22e8:	49 be d9 ff 00 00 00 	movabs $0x2000000000ffd9,%r14
    22ef:	00 20 00 
    22f2:	e9 a6 01 00 00       	jmpq   249d <submitr+0x334>
    22f7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    22fe:	3a 20 43 
    2301:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2308:	20 75 6e 
    230b:	49 89 07             	mov    %rax,(%r15)
    230e:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2312:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2319:	74 6f 20 
    231c:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2323:	65 20 73 
    2326:	49 89 47 10          	mov    %rax,0x10(%r15)
    232a:	49 89 57 18          	mov    %rdx,0x18(%r15)
    232e:	41 c7 47 20 6f 63 6b 	movl   $0x656b636f,0x20(%r15)
    2335:	65 
    2336:	66 41 c7 47 24 74 00 	movw   $0x74,0x24(%r15)
    233d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2342:	e9 16 03 00 00       	jmpq   265d <submitr+0x4f4>
    2347:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    234e:	3a 20 44 
    2351:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    2358:	20 75 6e 
    235b:	49 89 07             	mov    %rax,(%r15)
    235e:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2362:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2369:	74 6f 20 
    236c:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    2373:	76 65 20 
    2376:	49 89 47 10          	mov    %rax,0x10(%r15)
    237a:	49 89 57 18          	mov    %rdx,0x18(%r15)
    237e:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    2385:	72 20 61 
    2388:	49 89 47 20          	mov    %rax,0x20(%r15)
    238c:	41 c7 47 28 64 64 72 	movl   $0x65726464,0x28(%r15)
    2393:	65 
    2394:	66 41 c7 47 2c 73 73 	movw   $0x7373,0x2c(%r15)
    239b:	41 c6 47 2e 00       	movb   $0x0,0x2e(%r15)
    23a0:	44 89 e7             	mov    %r12d,%edi
    23a3:	e8 e8 ee ff ff       	callq  1290 <close@plt>
    23a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    23ad:	e9 ab 02 00 00       	jmpq   265d <submitr+0x4f4>
    23b2:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    23b9:	3a 20 55 
    23bc:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    23c3:	20 74 6f 
    23c6:	49 89 07             	mov    %rax,(%r15)
    23c9:	49 89 57 08          	mov    %rdx,0x8(%r15)
    23cd:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    23d4:	65 63 74 
    23d7:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
    23de:	68 65 20 
    23e1:	49 89 47 10          	mov    %rax,0x10(%r15)
    23e5:	49 89 57 18          	mov    %rdx,0x18(%r15)
    23e9:	41 c7 47 20 73 65 72 	movl   $0x76726573,0x20(%r15)
    23f0:	76 
    23f1:	66 41 c7 47 24 65 72 	movw   $0x7265,0x24(%r15)
    23f8:	41 c6 47 26 00       	movb   $0x0,0x26(%r15)
    23fd:	44 89 e7             	mov    %r12d,%edi
    2400:	e8 8b ee ff ff       	callq  1290 <close@plt>
    2405:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    240a:	e9 4e 02 00 00       	jmpq   265d <submitr+0x4f4>
    240f:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    2416:	3a 20 52 
    2419:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    2420:	20 73 74 
    2423:	49 89 07             	mov    %rax,(%r15)
    2426:	49 89 57 08          	mov    %rdx,0x8(%r15)
    242a:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    2431:	74 6f 6f 
    2434:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
    243b:	65 2e 20 
    243e:	49 89 47 10          	mov    %rax,0x10(%r15)
    2442:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2446:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    244d:	61 73 65 
    2450:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
    2457:	49 54 52 
    245a:	49 89 47 20          	mov    %rax,0x20(%r15)
    245e:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2462:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    2469:	55 46 00 
    246c:	49 89 47 30          	mov    %rax,0x30(%r15)
    2470:	44 89 e7             	mov    %r12d,%edi
    2473:	e8 18 ee ff ff       	callq  1290 <close@plt>
    2478:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    247d:	e9 db 01 00 00       	jmpq   265d <submitr+0x4f4>
    2482:	49 0f a3 c6          	bt     %rax,%r14
    2486:	73 21                	jae    24a9 <submitr+0x340>
    2488:	44 88 45 00          	mov    %r8b,0x0(%rbp)
    248c:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    2490:	48 83 c3 01          	add    $0x1,%rbx
    2494:	4c 39 eb             	cmp    %r13,%rbx
    2497:	0f 84 48 03 00 00    	je     27e5 <submitr+0x67c>
    249d:	44 0f b6 03          	movzbl (%rbx),%r8d
    24a1:	41 8d 40 d6          	lea    -0x2a(%r8),%eax
    24a5:	3c 35                	cmp    $0x35,%al
    24a7:	76 d9                	jbe    2482 <submitr+0x319>
    24a9:	44 89 c0             	mov    %r8d,%eax
    24ac:	83 e0 df             	and    $0xffffffdf,%eax
    24af:	83 e8 41             	sub    $0x41,%eax
    24b2:	3c 19                	cmp    $0x19,%al
    24b4:	76 d2                	jbe    2488 <submitr+0x31f>
    24b6:	41 80 f8 20          	cmp    $0x20,%r8b
    24ba:	74 63                	je     251f <submitr+0x3b6>
    24bc:	41 8d 40 e0          	lea    -0x20(%r8),%eax
    24c0:	3c 5f                	cmp    $0x5f,%al
    24c2:	76 0a                	jbe    24ce <submitr+0x365>
    24c4:	41 80 f8 09          	cmp    $0x9,%r8b
    24c8:	0f 85 8a 02 00 00    	jne    2758 <submitr+0x5ef>
    24ce:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
    24d5:	00 
    24d6:	45 0f b6 c0          	movzbl %r8b,%r8d
    24da:	48 8d 0d 4d 10 00 00 	lea    0x104d(%rip),%rcx        # 352e <array.0+0x36e>
    24e1:	ba 08 00 00 00       	mov    $0x8,%edx
    24e6:	be 01 00 00 00       	mov    $0x1,%esi
    24eb:	b8 00 00 00 00       	mov    $0x0,%eax
    24f0:	e8 ab ee ff ff       	callq  13a0 <__sprintf_chk@plt>
    24f5:	0f b6 84 24 50 80 00 	movzbl 0x8050(%rsp),%eax
    24fc:	00 
    24fd:	88 45 00             	mov    %al,0x0(%rbp)
    2500:	0f b6 84 24 51 80 00 	movzbl 0x8051(%rsp),%eax
    2507:	00 
    2508:	88 45 01             	mov    %al,0x1(%rbp)
    250b:	0f b6 84 24 52 80 00 	movzbl 0x8052(%rsp),%eax
    2512:	00 
    2513:	88 45 02             	mov    %al,0x2(%rbp)
    2516:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    251a:	e9 71 ff ff ff       	jmpq   2490 <submitr+0x327>
    251f:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    2523:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    2527:	e9 64 ff ff ff       	jmpq   2490 <submitr+0x327>
    252c:	48 01 c5             	add    %rax,%rbp
    252f:	48 29 c3             	sub    %rax,%rbx
    2532:	0f 84 18 03 00 00    	je     2850 <submitr+0x6e7>
    2538:	48 89 da             	mov    %rbx,%rdx
    253b:	48 89 ee             	mov    %rbp,%rsi
    253e:	44 89 e7             	mov    %r12d,%edi
    2541:	e8 0a ed ff ff       	callq  1250 <write@plt>
    2546:	48 85 c0             	test   %rax,%rax
    2549:	7f e1                	jg     252c <submitr+0x3c3>
    254b:	e8 d0 ec ff ff       	callq  1220 <__errno_location@plt>
    2550:	83 38 04             	cmpl   $0x4,(%rax)
    2553:	0f 85 a0 01 00 00    	jne    26f9 <submitr+0x590>
    2559:	4c 89 e8             	mov    %r13,%rax
    255c:	eb ce                	jmp    252c <submitr+0x3c3>
    255e:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2565:	3a 20 43 
    2568:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    256f:	20 75 6e 
    2572:	49 89 07             	mov    %rax,(%r15)
    2575:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2579:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2580:	74 6f 20 
    2583:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
    258a:	66 69 72 
    258d:	49 89 47 10          	mov    %rax,0x10(%r15)
    2591:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2595:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    259c:	61 64 65 
    259f:	48 ba 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rdx
    25a6:	6d 20 73 
    25a9:	49 89 47 20          	mov    %rax,0x20(%r15)
    25ad:	49 89 57 28          	mov    %rdx,0x28(%r15)
    25b1:	41 c7 47 30 65 72 76 	movl   $0x65767265,0x30(%r15)
    25b8:	65 
    25b9:	66 41 c7 47 34 72 00 	movw   $0x72,0x34(%r15)
    25c0:	44 89 e7             	mov    %r12d,%edi
    25c3:	e8 c8 ec ff ff       	callq  1290 <close@plt>
    25c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    25cd:	e9 8b 00 00 00       	jmpq   265d <submitr+0x4f4>
    25d2:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
    25d9:	00 
    25da:	48 8d 0d 9f 0e 00 00 	lea    0xe9f(%rip),%rcx        # 3480 <array.0+0x2c0>
    25e1:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    25e8:	be 01 00 00 00       	mov    $0x1,%esi
    25ed:	4c 89 ff             	mov    %r15,%rdi
    25f0:	b8 00 00 00 00       	mov    $0x0,%eax
    25f5:	e8 a6 ed ff ff       	callq  13a0 <__sprintf_chk@plt>
    25fa:	44 89 e7             	mov    %r12d,%edi
    25fd:	e8 8e ec ff ff       	callq  1290 <close@plt>
    2602:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2607:	eb 54                	jmp    265d <submitr+0x4f4>
    2609:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2610:	00 
    2611:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    2616:	ba 00 20 00 00       	mov    $0x2000,%edx
    261b:	e8 7d fa ff ff       	callq  209d <rio_readlineb>
    2620:	48 85 c0             	test   %rax,%rax
    2623:	7e 61                	jle    2686 <submitr+0x51d>
    2625:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    262c:	00 
    262d:	4c 89 ff             	mov    %r15,%rdi
    2630:	e8 fb eb ff ff       	callq  1230 <strcpy@plt>
    2635:	44 89 e7             	mov    %r12d,%edi
    2638:	e8 53 ec ff ff       	callq  1290 <close@plt>
    263d:	b9 03 00 00 00       	mov    $0x3,%ecx
    2642:	48 8d 3d 00 0f 00 00 	lea    0xf00(%rip),%rdi        # 3549 <array.0+0x389>
    2649:	4c 89 fe             	mov    %r15,%rsi
    264c:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    264e:	0f 97 c0             	seta   %al
    2651:	1c 00                	sbb    $0x0,%al
    2653:	84 c0                	test   %al,%al
    2655:	0f 95 c0             	setne  %al
    2658:	0f b6 c0             	movzbl %al,%eax
    265b:	f7 d8                	neg    %eax
    265d:	48 8b 8c 24 58 a0 00 	mov    0xa058(%rsp),%rcx
    2664:	00 
    2665:	64 48 2b 0c 25 28 00 	sub    %fs:0x28,%rcx
    266c:	00 00 
    266e:	0f 85 ff 02 00 00    	jne    2973 <submitr+0x80a>
    2674:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
    267b:	5b                   	pop    %rbx
    267c:	5d                   	pop    %rbp
    267d:	41 5c                	pop    %r12
    267f:	41 5d                	pop    %r13
    2681:	41 5e                	pop    %r14
    2683:	41 5f                	pop    %r15
    2685:	c3                   	retq   
    2686:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    268d:	3a 20 43 
    2690:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2697:	20 75 6e 
    269a:	49 89 07             	mov    %rax,(%r15)
    269d:	49 89 57 08          	mov    %rdx,0x8(%r15)
    26a1:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    26a8:	74 6f 20 
    26ab:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
    26b2:	73 74 61 
    26b5:	49 89 47 10          	mov    %rax,0x10(%r15)
    26b9:	49 89 57 18          	mov    %rdx,0x18(%r15)
    26bd:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    26c4:	65 73 73 
    26c7:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
    26ce:	72 6f 6d 
    26d1:	49 89 47 20          	mov    %rax,0x20(%r15)
    26d5:	49 89 57 28          	mov    %rdx,0x28(%r15)
    26d9:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
    26e0:	65 72 00 
    26e3:	49 89 47 30          	mov    %rax,0x30(%r15)
    26e7:	44 89 e7             	mov    %r12d,%edi
    26ea:	e8 a1 eb ff ff       	callq  1290 <close@plt>
    26ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    26f4:	e9 64 ff ff ff       	jmpq   265d <submitr+0x4f4>
    26f9:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2700:	3a 20 43 
    2703:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    270a:	20 75 6e 
    270d:	49 89 07             	mov    %rax,(%r15)
    2710:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2714:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    271b:	74 6f 20 
    271e:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
    2725:	20 74 6f 
    2728:	49 89 47 10          	mov    %rax,0x10(%r15)
    272c:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2730:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
    2737:	73 65 72 
    273a:	49 89 47 20          	mov    %rax,0x20(%r15)
    273e:	41 c7 47 28 76 65 72 	movl   $0x726576,0x28(%r15)
    2745:	00 
    2746:	44 89 e7             	mov    %r12d,%edi
    2749:	e8 42 eb ff ff       	callq  1290 <close@plt>
    274e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2753:	e9 05 ff ff ff       	jmpq   265d <submitr+0x4f4>
    2758:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    275f:	3a 20 52 
    2762:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    2769:	20 73 74 
    276c:	49 89 07             	mov    %rax,(%r15)
    276f:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2773:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    277a:	63 6f 6e 
    277d:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
    2784:	20 61 6e 
    2787:	49 89 47 10          	mov    %rax,0x10(%r15)
    278b:	49 89 57 18          	mov    %rdx,0x18(%r15)
    278f:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    2796:	67 61 6c 
    2799:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
    27a0:	6e 70 72 
    27a3:	49 89 47 20          	mov    %rax,0x20(%r15)
    27a7:	49 89 57 28          	mov    %rdx,0x28(%r15)
    27ab:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    27b2:	6c 65 20 
    27b5:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
    27bc:	63 74 65 
    27bf:	49 89 47 30          	mov    %rax,0x30(%r15)
    27c3:	49 89 57 38          	mov    %rdx,0x38(%r15)
    27c7:	66 41 c7 47 40 72 2e 	movw   $0x2e72,0x40(%r15)
    27ce:	41 c6 47 42 00       	movb   $0x0,0x42(%r15)
    27d3:	44 89 e7             	mov    %r12d,%edi
    27d6:	e8 b5 ea ff ff       	callq  1290 <close@plt>
    27db:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    27e0:	e9 78 fe ff ff       	jmpq   265d <submitr+0x4f4>
    27e5:	48 8d 9c 24 50 20 00 	lea    0x2050(%rsp),%rbx
    27ec:	00 
    27ed:	48 83 ec 08          	sub    $0x8,%rsp
    27f1:	48 8d 84 24 58 40 00 	lea    0x4058(%rsp),%rax
    27f8:	00 
    27f9:	50                   	push   %rax
    27fa:	ff 74 24 20          	pushq  0x20(%rsp)
    27fe:	ff 74 24 30          	pushq  0x30(%rsp)
    2802:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    2807:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    280c:	48 8d 0d 9d 0c 00 00 	lea    0xc9d(%rip),%rcx        # 34b0 <array.0+0x2f0>
    2813:	ba 00 20 00 00       	mov    $0x2000,%edx
    2818:	be 01 00 00 00       	mov    $0x1,%esi
    281d:	48 89 df             	mov    %rbx,%rdi
    2820:	b8 00 00 00 00       	mov    $0x0,%eax
    2825:	e8 76 eb ff ff       	callq  13a0 <__sprintf_chk@plt>
    282a:	48 83 c4 20          	add    $0x20,%rsp
    282e:	48 89 df             	mov    %rbx,%rdi
    2831:	e8 2a ea ff ff       	callq  1260 <strlen@plt>
    2836:	48 89 c3             	mov    %rax,%rbx
    2839:	48 8d ac 24 50 20 00 	lea    0x2050(%rsp),%rbp
    2840:	00 
    2841:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    2847:	48 85 c0             	test   %rax,%rax
    284a:	0f 85 e8 fc ff ff    	jne    2538 <submitr+0x3cf>
    2850:	44 89 64 24 40       	mov    %r12d,0x40(%rsp)
    2855:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%rsp)
    285c:	00 
    285d:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    2862:	48 8d 44 24 50       	lea    0x50(%rsp),%rax
    2867:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    286c:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2873:	00 
    2874:	ba 00 20 00 00       	mov    $0x2000,%edx
    2879:	e8 1f f8 ff ff       	callq  209d <rio_readlineb>
    287e:	48 85 c0             	test   %rax,%rax
    2881:	0f 8e d7 fc ff ff    	jle    255e <submitr+0x3f5>
    2887:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
    288c:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
    2893:	00 
    2894:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
    289b:	00 
    289c:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
    28a3:	00 
    28a4:	48 8d 35 8a 0c 00 00 	lea    0xc8a(%rip),%rsi        # 3535 <array.0+0x375>
    28ab:	b8 00 00 00 00       	mov    $0x0,%eax
    28b0:	e8 5b ea ff ff       	callq  1310 <__isoc99_sscanf@plt>
    28b5:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
    28ba:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
    28c1:	0f 85 0b fd ff ff    	jne    25d2 <submitr+0x469>
    28c7:	48 8d 1d 78 0c 00 00 	lea    0xc78(%rip),%rbx        # 3546 <array.0+0x386>
    28ce:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    28d5:	00 
    28d6:	b9 03 00 00 00       	mov    $0x3,%ecx
    28db:	48 89 df             	mov    %rbx,%rdi
    28de:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    28e0:	0f 97 c0             	seta   %al
    28e3:	1c 00                	sbb    $0x0,%al
    28e5:	84 c0                	test   %al,%al
    28e7:	0f 84 1c fd ff ff    	je     2609 <submitr+0x4a0>
    28ed:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    28f4:	00 
    28f5:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    28fa:	ba 00 20 00 00       	mov    $0x2000,%edx
    28ff:	e8 99 f7 ff ff       	callq  209d <rio_readlineb>
    2904:	48 85 c0             	test   %rax,%rax
    2907:	7f c5                	jg     28ce <submitr+0x765>
    2909:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2910:	3a 20 43 
    2913:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    291a:	20 75 6e 
    291d:	49 89 07             	mov    %rax,(%r15)
    2920:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2924:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    292b:	74 6f 20 
    292e:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
    2935:	68 65 61 
    2938:	49 89 47 10          	mov    %rax,0x10(%r15)
    293c:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2940:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    2947:	66 72 6f 
    294a:	48 ba 6d 20 73 65 72 	movabs $0x726576726573206d,%rdx
    2951:	76 65 72 
    2954:	49 89 47 20          	mov    %rax,0x20(%r15)
    2958:	49 89 57 28          	mov    %rdx,0x28(%r15)
    295c:	41 c6 47 30 00       	movb   $0x0,0x30(%r15)
    2961:	44 89 e7             	mov    %r12d,%edi
    2964:	e8 27 e9 ff ff       	callq  1290 <close@plt>
    2969:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    296e:	e9 ea fc ff ff       	jmpq   265d <submitr+0x4f4>
    2973:	e8 f8 e8 ff ff       	callq  1270 <__stack_chk_fail@plt>

0000000000002978 <init_timeout>:
    2978:	f3 0f 1e fa          	endbr64 
    297c:	85 ff                	test   %edi,%edi
    297e:	75 01                	jne    2981 <init_timeout+0x9>
    2980:	c3                   	retq   
    2981:	53                   	push   %rbx
    2982:	89 fb                	mov    %edi,%ebx
    2984:	48 8d 35 dc f6 ff ff 	lea    -0x924(%rip),%rsi        # 2067 <sigalrm_handler>
    298b:	bf 0e 00 00 00       	mov    $0xe,%edi
    2990:	e8 2b e9 ff ff       	callq  12c0 <signal@plt>
    2995:	85 db                	test   %ebx,%ebx
    2997:	bf 00 00 00 00       	mov    $0x0,%edi
    299c:	0f 49 fb             	cmovns %ebx,%edi
    299f:	e8 dc e8 ff ff       	callq  1280 <alarm@plt>
    29a4:	5b                   	pop    %rbx
    29a5:	c3                   	retq   

00000000000029a6 <init_driver>:
    29a6:	f3 0f 1e fa          	endbr64 
    29aa:	41 54                	push   %r12
    29ac:	55                   	push   %rbp
    29ad:	53                   	push   %rbx
    29ae:	48 83 ec 20          	sub    $0x20,%rsp
    29b2:	48 89 fd             	mov    %rdi,%rbp
    29b5:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    29bc:	00 00 
    29be:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    29c3:	31 c0                	xor    %eax,%eax
    29c5:	be 01 00 00 00       	mov    $0x1,%esi
    29ca:	bf 0d 00 00 00       	mov    $0xd,%edi
    29cf:	e8 ec e8 ff ff       	callq  12c0 <signal@plt>
    29d4:	be 01 00 00 00       	mov    $0x1,%esi
    29d9:	bf 1d 00 00 00       	mov    $0x1d,%edi
    29de:	e8 dd e8 ff ff       	callq  12c0 <signal@plt>
    29e3:	be 01 00 00 00       	mov    $0x1,%esi
    29e8:	bf 1d 00 00 00       	mov    $0x1d,%edi
    29ed:	e8 ce e8 ff ff       	callq  12c0 <signal@plt>
    29f2:	ba 00 00 00 00       	mov    $0x0,%edx
    29f7:	be 01 00 00 00       	mov    $0x1,%esi
    29fc:	bf 02 00 00 00       	mov    $0x2,%edi
    2a01:	e8 aa e9 ff ff       	callq  13b0 <socket@plt>
    2a06:	85 c0                	test   %eax,%eax
    2a08:	0f 88 9c 00 00 00    	js     2aaa <init_driver+0x104>
    2a0e:	89 c3                	mov    %eax,%ebx
    2a10:	48 8d 3d 30 0a 00 00 	lea    0xa30(%rip),%rdi        # 3447 <array.0+0x287>
    2a17:	e8 b4 e8 ff ff       	callq  12d0 <gethostbyname@plt>
    2a1c:	48 85 c0             	test   %rax,%rax
    2a1f:	0f 84 d1 00 00 00    	je     2af6 <init_driver+0x150>
    2a25:	49 89 e4             	mov    %rsp,%r12
    2a28:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    2a2f:	00 
    2a30:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    2a37:	00 00 
    2a39:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    2a3f:	48 63 50 14          	movslq 0x14(%rax),%rdx
    2a43:	48 8b 40 18          	mov    0x18(%rax),%rax
    2a47:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    2a4c:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2a51:	48 8b 30             	mov    (%rax),%rsi
    2a54:	e8 87 e8 ff ff       	callq  12e0 <__memmove_chk@plt>
    2a59:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
    2a60:	ba 10 00 00 00       	mov    $0x10,%edx
    2a65:	4c 89 e6             	mov    %r12,%rsi
    2a68:	89 df                	mov    %ebx,%edi
    2a6a:	e8 f1 e8 ff ff       	callq  1360 <connect@plt>
    2a6f:	85 c0                	test   %eax,%eax
    2a71:	0f 88 e7 00 00 00    	js     2b5e <init_driver+0x1b8>
    2a77:	89 df                	mov    %ebx,%edi
    2a79:	e8 12 e8 ff ff       	callq  1290 <close@plt>
    2a7e:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
    2a84:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
    2a88:	b8 00 00 00 00       	mov    $0x0,%eax
    2a8d:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    2a92:	64 48 2b 0c 25 28 00 	sub    %fs:0x28,%rcx
    2a99:	00 00 
    2a9b:	0f 85 f5 00 00 00    	jne    2b96 <init_driver+0x1f0>
    2aa1:	48 83 c4 20          	add    $0x20,%rsp
    2aa5:	5b                   	pop    %rbx
    2aa6:	5d                   	pop    %rbp
    2aa7:	41 5c                	pop    %r12
    2aa9:	c3                   	retq   
    2aaa:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2ab1:	3a 20 43 
    2ab4:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2abb:	20 75 6e 
    2abe:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2ac2:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2ac6:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2acd:	74 6f 20 
    2ad0:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2ad7:	65 20 73 
    2ada:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2ade:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2ae2:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    2ae9:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    2aef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2af4:	eb 97                	jmp    2a8d <init_driver+0xe7>
    2af6:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    2afd:	3a 20 44 
    2b00:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    2b07:	20 75 6e 
    2b0a:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2b0e:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2b12:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2b19:	74 6f 20 
    2b1c:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    2b23:	76 65 20 
    2b26:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2b2a:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2b2e:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    2b35:	72 20 61 
    2b38:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2b3c:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    2b43:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    2b49:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    2b4d:	89 df                	mov    %ebx,%edi
    2b4f:	e8 3c e7 ff ff       	callq  1290 <close@plt>
    2b54:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2b59:	e9 2f ff ff ff       	jmpq   2a8d <init_driver+0xe7>
    2b5e:	4c 8d 05 e2 08 00 00 	lea    0x8e2(%rip),%r8        # 3447 <array.0+0x287>
    2b65:	48 8d 0d 9c 09 00 00 	lea    0x99c(%rip),%rcx        # 3508 <array.0+0x348>
    2b6c:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    2b73:	be 01 00 00 00       	mov    $0x1,%esi
    2b78:	48 89 ef             	mov    %rbp,%rdi
    2b7b:	b8 00 00 00 00       	mov    $0x0,%eax
    2b80:	e8 1b e8 ff ff       	callq  13a0 <__sprintf_chk@plt>
    2b85:	89 df                	mov    %ebx,%edi
    2b87:	e8 04 e7 ff ff       	callq  1290 <close@plt>
    2b8c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2b91:	e9 f7 fe ff ff       	jmpq   2a8d <init_driver+0xe7>
    2b96:	e8 d5 e6 ff ff       	callq  1270 <__stack_chk_fail@plt>

0000000000002b9b <driver_post>:
    2b9b:	f3 0f 1e fa          	endbr64 
    2b9f:	53                   	push   %rbx
    2ba0:	4c 89 c3             	mov    %r8,%rbx
    2ba3:	85 c9                	test   %ecx,%ecx
    2ba5:	75 17                	jne    2bbe <driver_post+0x23>
    2ba7:	48 85 ff             	test   %rdi,%rdi
    2baa:	74 05                	je     2bb1 <driver_post+0x16>
    2bac:	80 3f 00             	cmpb   $0x0,(%rdi)
    2baf:	75 33                	jne    2be4 <driver_post+0x49>
    2bb1:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    2bb6:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    2bba:	89 c8                	mov    %ecx,%eax
    2bbc:	5b                   	pop    %rbx
    2bbd:	c3                   	retq   
    2bbe:	48 8d 35 87 09 00 00 	lea    0x987(%rip),%rsi        # 354c <array.0+0x38c>
    2bc5:	bf 01 00 00 00       	mov    $0x1,%edi
    2bca:	b8 00 00 00 00       	mov    $0x0,%eax
    2bcf:	e8 4c e7 ff ff       	callq  1320 <__printf_chk@plt>
    2bd4:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    2bd9:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    2bdd:	b8 00 00 00 00       	mov    $0x0,%eax
    2be2:	eb d8                	jmp    2bbc <driver_post+0x21>
    2be4:	41 50                	push   %r8
    2be6:	52                   	push   %rdx
    2be7:	4c 8d 0d 75 09 00 00 	lea    0x975(%rip),%r9        # 3563 <array.0+0x3a3>
    2bee:	49 89 f0             	mov    %rsi,%r8
    2bf1:	48 89 f9             	mov    %rdi,%rcx
    2bf4:	48 8d 15 7c 09 00 00 	lea    0x97c(%rip),%rdx        # 3577 <array.0+0x3b7>
    2bfb:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
    2c00:	48 8d 3d 40 08 00 00 	lea    0x840(%rip),%rdi        # 3447 <array.0+0x287>
    2c07:	e8 5d f5 ff ff       	callq  2169 <submitr>
    2c0c:	48 83 c4 10          	add    $0x10,%rsp
    2c10:	eb aa                	jmp    2bbc <driver_post+0x21>
    2c12:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2c19:	00 00 00 
    2c1c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002c20 <__libc_csu_init>:
    2c20:	f3 0f 1e fa          	endbr64 
    2c24:	41 57                	push   %r15
    2c26:	4c 8d 3d b3 20 00 00 	lea    0x20b3(%rip),%r15        # 4ce0 <__frame_dummy_init_array_entry>
    2c2d:	41 56                	push   %r14
    2c2f:	49 89 d6             	mov    %rdx,%r14
    2c32:	41 55                	push   %r13
    2c34:	49 89 f5             	mov    %rsi,%r13
    2c37:	41 54                	push   %r12
    2c39:	41 89 fc             	mov    %edi,%r12d
    2c3c:	55                   	push   %rbp
    2c3d:	48 8d 2d a4 20 00 00 	lea    0x20a4(%rip),%rbp        # 4ce8 <__do_global_dtors_aux_fini_array_entry>
    2c44:	53                   	push   %rbx
    2c45:	4c 29 fd             	sub    %r15,%rbp
    2c48:	48 83 ec 08          	sub    $0x8,%rsp
    2c4c:	e8 af e3 ff ff       	callq  1000 <_init>
    2c51:	48 c1 fd 03          	sar    $0x3,%rbp
    2c55:	74 1f                	je     2c76 <__libc_csu_init+0x56>
    2c57:	31 db                	xor    %ebx,%ebx
    2c59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2c60:	4c 89 f2             	mov    %r14,%rdx
    2c63:	4c 89 ee             	mov    %r13,%rsi
    2c66:	44 89 e7             	mov    %r12d,%edi
    2c69:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    2c6d:	48 83 c3 01          	add    $0x1,%rbx
    2c71:	48 39 dd             	cmp    %rbx,%rbp
    2c74:	75 ea                	jne    2c60 <__libc_csu_init+0x40>
    2c76:	48 83 c4 08          	add    $0x8,%rsp
    2c7a:	5b                   	pop    %rbx
    2c7b:	5d                   	pop    %rbp
    2c7c:	41 5c                	pop    %r12
    2c7e:	41 5d                	pop    %r13
    2c80:	41 5e                	pop    %r14
    2c82:	41 5f                	pop    %r15
    2c84:	c3                   	retq   
    2c85:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    2c8c:	00 00 00 00 

0000000000002c90 <__libc_csu_fini>:
    2c90:	f3 0f 1e fa          	endbr64 
    2c94:	c3                   	retq   

Disassembly of section .fini:

0000000000002c98 <_fini>:
    2c98:	f3 0f 1e fa          	endbr64 
    2c9c:	48 83 ec 08          	sub    $0x8,%rsp
    2ca0:	48 83 c4 08          	add    $0x8,%rsp
    2ca4:	c3                   	retq   
