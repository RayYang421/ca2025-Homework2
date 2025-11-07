
Problem2_O0.elf:     file format elf32-littleriscv


Disassembly of section .text:

00010000 <_start>:
   10000:	00001117          	auipc	sp,0x1
   10004:	69010113          	addi	sp,sp,1680 # 11690 <__stack_top>
   10008:	00000297          	auipc	t0,0x0
   1000c:	68328293          	addi	t0,t0,1667 # 1068b <__bss_end>
   10010:	00000317          	auipc	t1,0x0
   10014:	67b30313          	addi	t1,t1,1659 # 1068b <__bss_end>
   10018:	0062d863          	bge	t0,t1,10028 <_start+0x28>
   1001c:	0002a023          	sw	zero,0(t0)
   10020:	00428293          	addi	t0,t0,4
   10024:	ff5ff06f          	j	10018 <_start+0x18>
   10028:	108000ef          	jal	10130 <main>
   1002c:	05d00893          	li	a7,93
   10030:	00000513          	li	a0,0
   10034:	00000073          	ecall
   10038:	0000006f          	j	10038 <_start+0x38>

0001003c <print_hex32>:
   1003c:	fd010113          	addi	sp,sp,-48
   10040:	02112623          	sw	ra,44(sp)
   10044:	02812423          	sw	s0,40(sp)
   10048:	03010413          	addi	s0,sp,48
   1004c:	fca42e23          	sw	a0,-36(s0)
   10050:	00700793          	li	a5,7
   10054:	fef42623          	sw	a5,-20(s0)
   10058:	0680006f          	j	100c0 <print_hex32+0x84>
   1005c:	fec42783          	lw	a5,-20(s0)
   10060:	00279793          	slli	a5,a5,0x2
   10064:	fdc42703          	lw	a4,-36(s0)
   10068:	00f757b3          	srl	a5,a4,a5
   1006c:	00f7f793          	andi	a5,a5,15
   10070:	fef42423          	sw	a5,-24(s0)
   10074:	fe842703          	lw	a4,-24(s0)
   10078:	00900793          	li	a5,9
   1007c:	00e7ec63          	bltu	a5,a4,10094 <print_hex32+0x58>
   10080:	fe842783          	lw	a5,-24(s0)
   10084:	0ff7f793          	zext.b	a5,a5
   10088:	03078793          	addi	a5,a5,48
   1008c:	0ff7f793          	zext.b	a5,a5
   10090:	0140006f          	j	100a4 <print_hex32+0x68>
   10094:	fe842783          	lw	a5,-24(s0)
   10098:	0ff7f793          	zext.b	a5,a5
   1009c:	05778793          	addi	a5,a5,87
   100a0:	0ff7f793          	zext.b	a5,a5
   100a4:	fef403a3          	sb	a5,-25(s0)
   100a8:	fe744783          	lbu	a5,-25(s0)
   100ac:	00078513          	mv	a0,a5
   100b0:	588000ef          	jal	10638 <my_putchar>
   100b4:	fec42783          	lw	a5,-20(s0)
   100b8:	fff78793          	addi	a5,a5,-1
   100bc:	fef42623          	sw	a5,-20(s0)
   100c0:	fec42783          	lw	a5,-20(s0)
   100c4:	f807dce3          	bgez	a5,1005c <print_hex32+0x20>
   100c8:	00000013          	nop
   100cc:	00000013          	nop
   100d0:	02c12083          	lw	ra,44(sp)
   100d4:	02812403          	lw	s0,40(sp)
   100d8:	03010113          	addi	sp,sp,48
   100dc:	00008067          	ret

000100e0 <next_pos_mod3>:
   100e0:	fe010113          	addi	sp,sp,-32
   100e4:	00112e23          	sw	ra,28(sp)
   100e8:	00812c23          	sw	s0,24(sp)
   100ec:	02010413          	addi	s0,sp,32
   100f0:	fea42623          	sw	a0,-20(s0)
   100f4:	fec42783          	lw	a5,-20(s0)
   100f8:	00079663          	bnez	a5,10104 <next_pos_mod3+0x24>
   100fc:	00200793          	li	a5,2
   10100:	01c0006f          	j	1011c <next_pos_mod3+0x3c>
   10104:	fec42703          	lw	a4,-20(s0)
   10108:	00100793          	li	a5,1
   1010c:	00f71663          	bne	a4,a5,10118 <next_pos_mod3+0x38>
   10110:	00000793          	li	a5,0
   10114:	0080006f          	j	1011c <next_pos_mod3+0x3c>
   10118:	00100793          	li	a5,1
   1011c:	00078513          	mv	a0,a5
   10120:	01c12083          	lw	ra,28(sp)
   10124:	01812403          	lw	s0,24(sp)
   10128:	02010113          	addi	sp,sp,32
   1012c:	00008067          	ret

00010130 <main>:
   10130:	f7010113          	addi	sp,sp,-144
   10134:	08112623          	sw	ra,140(sp)
   10138:	08812423          	sw	s0,136(sp)
   1013c:	09212223          	sw	s2,132(sp)
   10140:	09312023          	sw	s3,128(sp)
   10144:	07412e23          	sw	s4,124(sp)
   10148:	07512c23          	sw	s5,120(sp)
   1014c:	07612a23          	sw	s6,116(sp)
   10150:	07712823          	sw	s7,112(sp)
   10154:	09010413          	addi	s0,sp,144
   10158:	f6042a23          	sw	zero,-140(s0)
   1015c:	f6042c23          	sw	zero,-136(s0)
   10160:	f6042e23          	sw	zero,-132(s0)
   10164:	00000793          	li	a5,0
   10168:	00000813          	li	a6,0
   1016c:	fcf42c23          	sw	a5,-40(s0)
   10170:	fd042e23          	sw	a6,-36(s0)
   10174:	fcf42823          	sw	a5,-48(s0)
   10178:	fd042a23          	sw	a6,-44(s0)
   1017c:	fcf42423          	sw	a5,-56(s0)
   10180:	fd042623          	sw	a6,-52(s0)
   10184:	00100793          	li	a5,1
   10188:	fcf42223          	sw	a5,-60(s0)
   1018c:	fc442703          	lw	a4,-60(s0)
   10190:	00800793          	li	a5,8
   10194:	32f70463          	beq	a4,a5,104bc <main+0x38c>
   10198:	48c000ef          	jal	10624 <get_instret>
   1019c:	faa42023          	sw	a0,-96(s0)
   101a0:	fab42223          	sw	a1,-92(s0)
   101a4:	fc442783          	lw	a5,-60(s0)
   101a8:	4017d793          	srai	a5,a5,0x1
   101ac:	fc442703          	lw	a4,-60(s0)
   101b0:	00f747b3          	xor	a5,a4,a5
   101b4:	f8f42e23          	sw	a5,-100(s0)
   101b8:	fc442783          	lw	a5,-60(s0)
   101bc:	fff78713          	addi	a4,a5,-1
   101c0:	fc442783          	lw	a5,-60(s0)
   101c4:	fff78793          	addi	a5,a5,-1
   101c8:	4017d793          	srai	a5,a5,0x1
   101cc:	00f747b3          	xor	a5,a4,a5
   101d0:	f8f42c23          	sw	a5,-104(s0)
   101d4:	f9c42703          	lw	a4,-100(s0)
   101d8:	f9842783          	lw	a5,-104(s0)
   101dc:	00f747b3          	xor	a5,a4,a5
   101e0:	f8f42a23          	sw	a5,-108(s0)
   101e4:	f9442783          	lw	a5,-108(s0)
   101e8:	0017f793          	andi	a5,a5,1
   101ec:	02079063          	bnez	a5,1020c <main+0xdc>
   101f0:	f9442783          	lw	a5,-108(s0)
   101f4:	0027f793          	andi	a5,a5,2
   101f8:	00078663          	beqz	a5,10204 <main+0xd4>
   101fc:	00100793          	li	a5,1
   10200:	0100006f          	j	10210 <main+0xe0>
   10204:	00200793          	li	a5,2
   10208:	0080006f          	j	10210 <main+0xe0>
   1020c:	00000793          	li	a5,0
   10210:	f8f42823          	sw	a5,-112(s0)
   10214:	f9042703          	lw	a4,-112(s0)
   10218:	f7440793          	addi	a5,s0,-140
   1021c:	00271713          	slli	a4,a4,0x2
   10220:	00f707b3          	add	a5,a4,a5
   10224:	0007a783          	lw	a5,0(a5)
   10228:	f8f42623          	sw	a5,-116(s0)
   1022c:	f9042783          	lw	a5,-112(s0)
   10230:	00079a63          	bnez	a5,10244 <main+0x114>
   10234:	f8c42503          	lw	a0,-116(s0)
   10238:	ea9ff0ef          	jal	100e0 <next_pos_mod3>
   1023c:	fca42023          	sw	a0,-64(s0)
   10240:	01c0006f          	j	1025c <main+0x12c>
   10244:	00300713          	li	a4,3
   10248:	f8c42783          	lw	a5,-116(s0)
   1024c:	40f70733          	sub	a4,a4,a5
   10250:	f7442783          	lw	a5,-140(s0)
   10254:	40f707b3          	sub	a5,a4,a5
   10258:	fcf42023          	sw	a5,-64(s0)
   1025c:	f8c42783          	lw	a5,-116(s0)
   10260:	0ff7f793          	zext.b	a5,a5
   10264:	04178793          	addi	a5,a5,65
   10268:	f8f405a3          	sb	a5,-117(s0)
   1026c:	fc042783          	lw	a5,-64(s0)
   10270:	0ff7f793          	zext.b	a5,a5
   10274:	04178793          	addi	a5,a5,65
   10278:	f8f40523          	sb	a5,-118(s0)
   1027c:	3a8000ef          	jal	10624 <get_instret>
   10280:	f8a42023          	sw	a0,-128(s0)
   10284:	f8b42223          	sw	a1,-124(s0)
   10288:	f8042703          	lw	a4,-128(s0)
   1028c:	f8442783          	lw	a5,-124(s0)
   10290:	fa042503          	lw	a0,-96(s0)
   10294:	fa442583          	lw	a1,-92(s0)
   10298:	40a70633          	sub	a2,a4,a0
   1029c:	00060813          	mv	a6,a2
   102a0:	01073833          	sltu	a6,a4,a6
   102a4:	40b786b3          	sub	a3,a5,a1
   102a8:	410687b3          	sub	a5,a3,a6
   102ac:	00078693          	mv	a3,a5
   102b0:	00060513          	mv	a0,a2
   102b4:	00068593          	mv	a1,a3
   102b8:	fd842603          	lw	a2,-40(s0)
   102bc:	fdc42683          	lw	a3,-36(s0)
   102c0:	00a60733          	add	a4,a2,a0
   102c4:	00070813          	mv	a6,a4
   102c8:	00c83833          	sltu	a6,a6,a2
   102cc:	00b687b3          	add	a5,a3,a1
   102d0:	00f806b3          	add	a3,a6,a5
   102d4:	00068793          	mv	a5,a3
   102d8:	fce42c23          	sw	a4,-40(s0)
   102dc:	fcf42e23          	sw	a5,-36(s0)
   102e0:	344000ef          	jal	10624 <get_instret>
   102e4:	faa42023          	sw	a0,-96(s0)
   102e8:	fab42223          	sw	a1,-92(s0)
   102ec:	000107b7          	lui	a5,0x10
   102f0:	65878793          	addi	a5,a5,1624 # 10658 <my_putchar+0x20>
   102f4:	faf42e23          	sw	a5,-68(s0)
   102f8:	01c0006f          	j	10314 <main+0x1e4>
   102fc:	fbc42783          	lw	a5,-68(s0)
   10300:	00178713          	addi	a4,a5,1
   10304:	fae42e23          	sw	a4,-68(s0)
   10308:	0007c783          	lbu	a5,0(a5)
   1030c:	00078513          	mv	a0,a5
   10310:	328000ef          	jal	10638 <my_putchar>
   10314:	fbc42783          	lw	a5,-68(s0)
   10318:	0007c783          	lbu	a5,0(a5)
   1031c:	fe0790e3          	bnez	a5,102fc <main+0x1cc>
   10320:	f9042783          	lw	a5,-112(s0)
   10324:	0ff7f793          	zext.b	a5,a5
   10328:	03178793          	addi	a5,a5,49
   1032c:	0ff7f793          	zext.b	a5,a5
   10330:	00078513          	mv	a0,a5
   10334:	304000ef          	jal	10638 <my_putchar>
   10338:	000107b7          	lui	a5,0x10
   1033c:	66478793          	addi	a5,a5,1636 # 10664 <my_putchar+0x2c>
   10340:	faf42c23          	sw	a5,-72(s0)
   10344:	01c0006f          	j	10360 <main+0x230>
   10348:	fb842783          	lw	a5,-72(s0)
   1034c:	00178713          	addi	a4,a5,1
   10350:	fae42c23          	sw	a4,-72(s0)
   10354:	0007c783          	lbu	a5,0(a5)
   10358:	00078513          	mv	a0,a5
   1035c:	2dc000ef          	jal	10638 <my_putchar>
   10360:	fb842783          	lw	a5,-72(s0)
   10364:	0007c783          	lbu	a5,0(a5)
   10368:	fe0790e3          	bnez	a5,10348 <main+0x218>
   1036c:	f8b44783          	lbu	a5,-117(s0)
   10370:	00078513          	mv	a0,a5
   10374:	2c4000ef          	jal	10638 <my_putchar>
   10378:	000107b7          	lui	a5,0x10
   1037c:	66c78793          	addi	a5,a5,1644 # 1066c <my_putchar+0x34>
   10380:	faf42a23          	sw	a5,-76(s0)
   10384:	01c0006f          	j	103a0 <main+0x270>
   10388:	fb442783          	lw	a5,-76(s0)
   1038c:	00178713          	addi	a4,a5,1
   10390:	fae42a23          	sw	a4,-76(s0)
   10394:	0007c783          	lbu	a5,0(a5)
   10398:	00078513          	mv	a0,a5
   1039c:	29c000ef          	jal	10638 <my_putchar>
   103a0:	fb442783          	lw	a5,-76(s0)
   103a4:	0007c783          	lbu	a5,0(a5)
   103a8:	fe0790e3          	bnez	a5,10388 <main+0x258>
   103ac:	f8a44783          	lbu	a5,-118(s0)
   103b0:	00078513          	mv	a0,a5
   103b4:	284000ef          	jal	10638 <my_putchar>
   103b8:	00a00513          	li	a0,10
   103bc:	27c000ef          	jal	10638 <my_putchar>
   103c0:	264000ef          	jal	10624 <get_instret>
   103c4:	f8a42023          	sw	a0,-128(s0)
   103c8:	f8b42223          	sw	a1,-124(s0)
   103cc:	f8042703          	lw	a4,-128(s0)
   103d0:	f8442783          	lw	a5,-124(s0)
   103d4:	fa042503          	lw	a0,-96(s0)
   103d8:	fa442583          	lw	a1,-92(s0)
   103dc:	40a70633          	sub	a2,a4,a0
   103e0:	00060813          	mv	a6,a2
   103e4:	01073833          	sltu	a6,a4,a6
   103e8:	40b786b3          	sub	a3,a5,a1
   103ec:	410687b3          	sub	a5,a3,a6
   103f0:	00078693          	mv	a3,a5
   103f4:	00060513          	mv	a0,a2
   103f8:	00068593          	mv	a1,a3
   103fc:	fd042603          	lw	a2,-48(s0)
   10400:	fd442683          	lw	a3,-44(s0)
   10404:	00a60733          	add	a4,a2,a0
   10408:	00070813          	mv	a6,a4
   1040c:	00c83833          	sltu	a6,a6,a2
   10410:	00b687b3          	add	a5,a3,a1
   10414:	00f806b3          	add	a3,a6,a5
   10418:	00068793          	mv	a5,a3
   1041c:	fce42823          	sw	a4,-48(s0)
   10420:	fcf42a23          	sw	a5,-44(s0)
   10424:	200000ef          	jal	10624 <get_instret>
   10428:	faa42023          	sw	a0,-96(s0)
   1042c:	fab42223          	sw	a1,-92(s0)
   10430:	f9042703          	lw	a4,-112(s0)
   10434:	f7440793          	addi	a5,s0,-140
   10438:	00271713          	slli	a4,a4,0x2
   1043c:	00f707b3          	add	a5,a4,a5
   10440:	fc042703          	lw	a4,-64(s0)
   10444:	00e7a023          	sw	a4,0(a5)
   10448:	fc442783          	lw	a5,-60(s0)
   1044c:	00178793          	addi	a5,a5,1
   10450:	fcf42223          	sw	a5,-60(s0)
   10454:	1d0000ef          	jal	10624 <get_instret>
   10458:	f8a42023          	sw	a0,-128(s0)
   1045c:	f8b42223          	sw	a1,-124(s0)
   10460:	f8042703          	lw	a4,-128(s0)
   10464:	f8442783          	lw	a5,-124(s0)
   10468:	fa042503          	lw	a0,-96(s0)
   1046c:	fa442583          	lw	a1,-92(s0)
   10470:	40a70633          	sub	a2,a4,a0
   10474:	00060813          	mv	a6,a2
   10478:	01073833          	sltu	a6,a4,a6
   1047c:	40b786b3          	sub	a3,a5,a1
   10480:	410687b3          	sub	a5,a3,a6
   10484:	00078693          	mv	a3,a5
   10488:	00060513          	mv	a0,a2
   1048c:	00068593          	mv	a1,a3
   10490:	fc842603          	lw	a2,-56(s0)
   10494:	fcc42683          	lw	a3,-52(s0)
   10498:	00a60733          	add	a4,a2,a0
   1049c:	00070813          	mv	a6,a4
   104a0:	00c83833          	sltu	a6,a6,a2
   104a4:	00b687b3          	add	a5,a3,a1
   104a8:	00f806b3          	add	a3,a6,a5
   104ac:	00068793          	mv	a5,a3
   104b0:	fce42423          	sw	a4,-56(s0)
   104b4:	fcf42623          	sw	a5,-52(s0)
   104b8:	cd5ff06f          	j	1018c <main+0x5c>
   104bc:	00000013          	nop
   104c0:	000107b7          	lui	a5,0x10
   104c4:	67478793          	addi	a5,a5,1652 # 10674 <my_putchar+0x3c>
   104c8:	faf42823          	sw	a5,-80(s0)
   104cc:	01c0006f          	j	104e8 <main+0x3b8>
   104d0:	fb042783          	lw	a5,-80(s0)
   104d4:	00178713          	addi	a4,a5,1
   104d8:	fae42823          	sw	a4,-80(s0)
   104dc:	0007c783          	lbu	a5,0(a5)
   104e0:	00078513          	mv	a0,a5
   104e4:	154000ef          	jal	10638 <my_putchar>
   104e8:	fb042783          	lw	a5,-80(s0)
   104ec:	0007c783          	lbu	a5,0(a5)
   104f0:	fe0790e3          	bnez	a5,104d0 <main+0x3a0>
   104f4:	fdc42783          	lw	a5,-36(s0)
   104f8:	0007db13          	srli	s6,a5,0x0
   104fc:	00000b93          	li	s7,0
   10500:	000b0793          	mv	a5,s6
   10504:	00078513          	mv	a0,a5
   10508:	b35ff0ef          	jal	1003c <print_hex32>
   1050c:	fd842783          	lw	a5,-40(s0)
   10510:	00078513          	mv	a0,a5
   10514:	b29ff0ef          	jal	1003c <print_hex32>
   10518:	00a00513          	li	a0,10
   1051c:	11c000ef          	jal	10638 <my_putchar>
   10520:	000107b7          	lui	a5,0x10
   10524:	67c78793          	addi	a5,a5,1660 # 1067c <my_putchar+0x44>
   10528:	faf42623          	sw	a5,-84(s0)
   1052c:	01c0006f          	j	10548 <main+0x418>
   10530:	fac42783          	lw	a5,-84(s0)
   10534:	00178713          	addi	a4,a5,1
   10538:	fae42623          	sw	a4,-84(s0)
   1053c:	0007c783          	lbu	a5,0(a5)
   10540:	00078513          	mv	a0,a5
   10544:	0f4000ef          	jal	10638 <my_putchar>
   10548:	fac42783          	lw	a5,-84(s0)
   1054c:	0007c783          	lbu	a5,0(a5)
   10550:	fe0790e3          	bnez	a5,10530 <main+0x400>
   10554:	fd442783          	lw	a5,-44(s0)
   10558:	0007da13          	srli	s4,a5,0x0
   1055c:	00000a93          	li	s5,0
   10560:	000a0793          	mv	a5,s4
   10564:	00078513          	mv	a0,a5
   10568:	ad5ff0ef          	jal	1003c <print_hex32>
   1056c:	fd042783          	lw	a5,-48(s0)
   10570:	00078513          	mv	a0,a5
   10574:	ac9ff0ef          	jal	1003c <print_hex32>
   10578:	00a00513          	li	a0,10
   1057c:	0bc000ef          	jal	10638 <my_putchar>
   10580:	000107b7          	lui	a5,0x10
   10584:	68478793          	addi	a5,a5,1668 # 10684 <my_putchar+0x4c>
   10588:	faf42423          	sw	a5,-88(s0)
   1058c:	01c0006f          	j	105a8 <main+0x478>
   10590:	fa842783          	lw	a5,-88(s0)
   10594:	00178713          	addi	a4,a5,1
   10598:	fae42423          	sw	a4,-88(s0)
   1059c:	0007c783          	lbu	a5,0(a5)
   105a0:	00078513          	mv	a0,a5
   105a4:	094000ef          	jal	10638 <my_putchar>
   105a8:	fa842783          	lw	a5,-88(s0)
   105ac:	0007c783          	lbu	a5,0(a5)
   105b0:	fe0790e3          	bnez	a5,10590 <main+0x460>
   105b4:	fcc42783          	lw	a5,-52(s0)
   105b8:	0007d913          	srli	s2,a5,0x0
   105bc:	00000993          	li	s3,0
   105c0:	00090793          	mv	a5,s2
   105c4:	00078513          	mv	a0,a5
   105c8:	a75ff0ef          	jal	1003c <print_hex32>
   105cc:	fc842783          	lw	a5,-56(s0)
   105d0:	00078513          	mv	a0,a5
   105d4:	a69ff0ef          	jal	1003c <print_hex32>
   105d8:	00a00513          	li	a0,10
   105dc:	05c000ef          	jal	10638 <my_putchar>
   105e0:	00000793          	li	a5,0
   105e4:	00078513          	mv	a0,a5
   105e8:	08c12083          	lw	ra,140(sp)
   105ec:	08812403          	lw	s0,136(sp)
   105f0:	08412903          	lw	s2,132(sp)
   105f4:	08012983          	lw	s3,128(sp)
   105f8:	07c12a03          	lw	s4,124(sp)
   105fc:	07812a83          	lw	s5,120(sp)
   10600:	07412b03          	lw	s6,116(sp)
   10604:	07012b83          	lw	s7,112(sp)
   10608:	09010113          	addi	sp,sp,144
   1060c:	00008067          	ret

00010610 <get_cycles>:
   10610:	c80025f3          	rdcycleh	a1
   10614:	c0002573          	rdcycle	a0
   10618:	c8002673          	rdcycleh	a2
   1061c:	fec59ae3          	bne	a1,a2,10610 <get_cycles>
   10620:	00008067          	ret

00010624 <get_instret>:
   10624:	c82025f3          	rdinstreth	a1
   10628:	c0202573          	rdinstret	a0
   1062c:	c8202673          	rdinstreth	a2
   10630:	fec59ae3          	bne	a1,a2,10624 <get_instret>
   10634:	00008067          	ret

00010638 <my_putchar>:
   10638:	04000893          	li	a7,64
   1063c:	00100513          	li	a0,1
   10640:	00000597          	auipc	a1,0x0
   10644:	04a58593          	addi	a1,a1,74 # 1068a <chbuf>
   10648:	00a58023          	sb	a0,0(a1)
   1064c:	00100613          	li	a2,1
   10650:	00000073          	ecall
   10654:	00008067          	ret
