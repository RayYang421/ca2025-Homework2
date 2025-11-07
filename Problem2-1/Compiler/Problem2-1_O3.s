
Problem2_O3.elf:     file format elf32-littleriscv


Disassembly of section .text:

00010000 <_start>:
   10000:	00001117          	auipc	sp,0x1
   10004:	47010113          	addi	sp,sp,1136 # 11470 <__stack_top>
   10008:	00000297          	auipc	t0,0x0
   1000c:	46328293          	addi	t0,t0,1123 # 1046b <__bss_end>
   10010:	00000317          	auipc	t1,0x0
   10014:	45b30313          	addi	t1,t1,1115 # 1046b <__bss_end>
   10018:	0062d863          	bge	t0,t1,10028 <_start+0x28>
   1001c:	0002a023          	sw	zero,0(t0)
   10020:	00428293          	addi	t0,t0,4
   10024:	ff5ff06f          	j	10018 <_start+0x18>
   10028:	0c0000ef          	jal	100e8 <main>
   1002c:	05d00893          	li	a7,93
   10030:	00000513          	li	a0,0
   10034:	00000073          	ecall
   10038:	0000006f          	j	10038 <_start+0x38>

0001003c <print_hex32>:
   1003c:	fe010113          	addi	sp,sp,-32
   10040:	00812c23          	sw	s0,24(sp)
   10044:	00912a23          	sw	s1,20(sp)
   10048:	01212823          	sw	s2,16(sp)
   1004c:	01312623          	sw	s3,12(sp)
   10050:	00112e23          	sw	ra,28(sp)
   10054:	00050493          	mv	s1,a0
   10058:	01c00413          	li	s0,28
   1005c:	00900993          	li	s3,9
   10060:	ffc00913          	li	s2,-4
   10064:	0084d7b3          	srl	a5,s1,s0
   10068:	00f7f713          	andi	a4,a5,15
   1006c:	05770513          	addi	a0,a4,87
   10070:	00e9e463          	bltu	s3,a4,10078 <print_hex32+0x3c>
   10074:	03070513          	addi	a0,a4,48
   10078:	ffc40413          	addi	s0,s0,-4
   1007c:	04c000ef          	jal	100c8 <my_putchar>
   10080:	ff2412e3          	bne	s0,s2,10064 <print_hex32+0x28>
   10084:	01c12083          	lw	ra,28(sp)
   10088:	01812403          	lw	s0,24(sp)
   1008c:	01412483          	lw	s1,20(sp)
   10090:	01012903          	lw	s2,16(sp)
   10094:	00c12983          	lw	s3,12(sp)
   10098:	02010113          	addi	sp,sp,32
   1009c:	00008067          	ret

000100a0 <get_cycles>:
   100a0:	c80025f3          	rdcycleh	a1
   100a4:	c0002573          	rdcycle	a0
   100a8:	c8002673          	rdcycleh	a2
   100ac:	fec59ae3          	bne	a1,a2,100a0 <get_cycles>
   100b0:	00008067          	ret

000100b4 <get_instret>:
   100b4:	c82025f3          	rdinstreth	a1
   100b8:	c0202573          	rdinstret	a0
   100bc:	c8202673          	rdinstreth	a2
   100c0:	fec59ae3          	bne	a1,a2,100b4 <get_instret>
   100c4:	00008067          	ret

000100c8 <my_putchar>:
   100c8:	04000893          	li	a7,64
   100cc:	00100513          	li	a0,1
   100d0:	00000597          	auipc	a1,0x0
   100d4:	39a58593          	addi	a1,a1,922 # 1046a <chbuf>
   100d8:	00a58023          	sb	a0,0(a1)
   100dc:	00100613          	li	a2,1
   100e0:	00000073          	ecall
   100e4:	00008067          	ret

Disassembly of section .text.startup:

000100e8 <main>:
   100e8:	000106b7          	lui	a3,0x10
   100ec:	00010737          	lui	a4,0x10
   100f0:	000107b7          	lui	a5,0x10
   100f4:	f9010113          	addi	sp,sp,-112
   100f8:	43868693          	addi	a3,a3,1080 # 10438 <main+0x350>
   100fc:	44470713          	addi	a4,a4,1092 # 10444 <main+0x35c>
   10100:	44c78793          	addi	a5,a5,1100 # 1044c <main+0x364>
   10104:	07212023          	sw	s2,96(sp)
   10108:	05312e23          	sw	s3,92(sp)
   1010c:	05412c23          	sw	s4,88(sp)
   10110:	05612823          	sw	s6,80(sp)
   10114:	05712623          	sw	s7,76(sp)
   10118:	05a12023          	sw	s10,64(sp)
   1011c:	06112623          	sw	ra,108(sp)
   10120:	06812423          	sw	s0,104(sp)
   10124:	06912223          	sw	s1,100(sp)
   10128:	05512a23          	sw	s5,84(sp)
   1012c:	05812423          	sw	s8,72(sp)
   10130:	05912223          	sw	s9,68(sp)
   10134:	03b12e23          	sw	s11,60(sp)
   10138:	02012223          	sw	zero,36(sp)
   1013c:	02012423          	sw	zero,40(sp)
   10140:	02012623          	sw	zero,44(sp)
   10144:	00d12a23          	sw	a3,20(sp)
   10148:	00e12c23          	sw	a4,24(sp)
   1014c:	00f12e23          	sw	a5,28(sp)
   10150:	00000993          	li	s3,0
   10154:	00100a13          	li	s4,1
   10158:	00000913          	li	s2,0
   1015c:	00000d13          	li	s10,0
   10160:	00000b93          	li	s7,0
   10164:	00012223          	sw	zero,4(sp)
   10168:	00000b13          	li	s6,0
   1016c:	00012023          	sw	zero,0(sp)
   10170:	f45ff0ef          	jal	100b4 <get_instret>
   10174:	401a5793          	srai	a5,s4,0x1
   10178:	fffa0713          	addi	a4,s4,-1
   1017c:	0147c7b3          	xor	a5,a5,s4
   10180:	00e7c7b3          	xor	a5,a5,a4
   10184:	40175713          	srai	a4,a4,0x1
   10188:	00e7c7b3          	xor	a5,a5,a4
   1018c:	0017f713          	andi	a4,a5,1
   10190:	00058493          	mv	s1,a1
   10194:	00050413          	mv	s0,a0
   10198:	16071a63          	bnez	a4,1030c <main+0x224>
   1019c:	0027f793          	andi	a5,a5,2
   101a0:	18078863          	beqz	a5,10330 <main+0x248>
   101a4:	03200793          	li	a5,50
   101a8:	00f12823          	sw	a5,16(sp)
   101ac:	00100a93          	li	s5,1
   101b0:	002a9a93          	slli	s5,s5,0x2
   101b4:	015107b3          	add	a5,sp,s5
   101b8:	0247a783          	lw	a5,36(a5)
   101bc:	00300713          	li	a4,3
   101c0:	40f70c33          	sub	s8,a4,a5
   101c4:	413c0c33          	sub	s8,s8,s3
   101c8:	041c0c93          	addi	s9,s8,65
   101cc:	00078993          	mv	s3,a5
   101d0:	0ffcf793          	zext.b	a5,s9
   101d4:	00f12623          	sw	a5,12(sp)
   101d8:	eddff0ef          	jal	100b4 <get_instret>
   101dc:	00012783          	lw	a5,0(sp)
   101e0:	408b0433          	sub	s0,s6,s0
   101e4:	008b3b33          	sltu	s6,s6,s0
   101e8:	409784b3          	sub	s1,a5,s1
   101ec:	416484b3          	sub	s1,s1,s6
   101f0:	00850433          	add	s0,a0,s0
   101f4:	00a43533          	sltu	a0,s0,a0
   101f8:	009585b3          	add	a1,a1,s1
   101fc:	00b504b3          	add	s1,a0,a1
   10200:	00912023          	sw	s1,0(sp)
   10204:	eb1ff0ef          	jal	100b4 <get_instret>
   10208:	01412d83          	lw	s11,20(sp)
   1020c:	04198993          	addi	s3,s3,65
   10210:	00050c93          	mv	s9,a0
   10214:	0ff9f993          	zext.b	s3,s3
   10218:	00040b13          	mv	s6,s0
   1021c:	00b12423          	sw	a1,8(sp)
   10220:	04d00513          	li	a0,77
   10224:	001d8d93          	addi	s11,s11,1
   10228:	ea1ff0ef          	jal	100c8 <my_putchar>
   1022c:	000dc503          	lbu	a0,0(s11)
   10230:	fe051ae3          	bnez	a0,10224 <main+0x13c>
   10234:	01012503          	lw	a0,16(sp)
   10238:	e91ff0ef          	jal	100c8 <my_putchar>
   1023c:	01812d83          	lw	s11,24(sp)
   10240:	02000513          	li	a0,32
   10244:	001d8d93          	addi	s11,s11,1
   10248:	e81ff0ef          	jal	100c8 <my_putchar>
   1024c:	000dc503          	lbu	a0,0(s11)
   10250:	fe051ae3          	bnez	a0,10244 <main+0x15c>
   10254:	00098513          	mv	a0,s3
   10258:	e71ff0ef          	jal	100c8 <my_putchar>
   1025c:	01c12983          	lw	s3,28(sp)
   10260:	02000513          	li	a0,32
   10264:	00198993          	addi	s3,s3,1
   10268:	e61ff0ef          	jal	100c8 <my_putchar>
   1026c:	0009c503          	lbu	a0,0(s3)
   10270:	fe051ae3          	bnez	a0,10264 <main+0x17c>
   10274:	00c12503          	lw	a0,12(sp)
   10278:	419b8cb3          	sub	s9,s7,s9
   1027c:	019bbbb3          	sltu	s7,s7,s9
   10280:	e49ff0ef          	jal	100c8 <my_putchar>
   10284:	00a00513          	li	a0,10
   10288:	e41ff0ef          	jal	100c8 <my_putchar>
   1028c:	e29ff0ef          	jal	100b4 <get_instret>
   10290:	00412783          	lw	a5,4(sp)
   10294:	00812703          	lw	a4,8(sp)
   10298:	01950cb3          	add	s9,a0,s9
   1029c:	00acb533          	sltu	a0,s9,a0
   102a0:	40e787b3          	sub	a5,a5,a4
   102a4:	417787b3          	sub	a5,a5,s7
   102a8:	00f585b3          	add	a1,a1,a5
   102ac:	00b509b3          	add	s3,a0,a1
   102b0:	01510ab3          	add	s5,sp,s5
   102b4:	01312223          	sw	s3,4(sp)
   102b8:	dfdff0ef          	jal	100b4 <get_instret>
   102bc:	00058d93          	mv	s11,a1
   102c0:	038aa223          	sw	s8,36(s5)
   102c4:	00050c13          	mv	s8,a0
   102c8:	dedff0ef          	jal	100b4 <get_instret>
   102cc:	01250933          	add	s2,a0,s2
   102d0:	00a93ab3          	sltu	s5,s2,a0
   102d4:	01a585b3          	add	a1,a1,s10
   102d8:	41890c33          	sub	s8,s2,s8
   102dc:	00ba8ab3          	add	s5,s5,a1
   102e0:	01893933          	sltu	s2,s2,s8
   102e4:	41ba8ab3          	sub	s5,s5,s11
   102e8:	412a8ab3          	sub	s5,s5,s2
   102ec:	001a0a13          	addi	s4,s4,1
   102f0:	00800793          	li	a5,8
   102f4:	000c8b93          	mv	s7,s9
   102f8:	000a8d13          	mv	s10,s5
   102fc:	000c0913          	mv	s2,s8
   10300:	04fa0063          	beq	s4,a5,10340 <main+0x258>
   10304:	02412983          	lw	s3,36(sp)
   10308:	e69ff06f          	j	10170 <main+0x88>
   1030c:	10098863          	beqz	s3,1041c <main+0x334>
   10310:	fff98c13          	addi	s8,s3,-1
   10314:	01803c33          	snez	s8,s8
   10318:	041c0793          	addi	a5,s8,65
   1031c:	00f12623          	sw	a5,12(sp)
   10320:	03100793          	li	a5,49
   10324:	00f12823          	sw	a5,16(sp)
   10328:	00000a93          	li	s5,0
   1032c:	eadff06f          	j	101d8 <main+0xf0>
   10330:	03300793          	li	a5,51
   10334:	00f12823          	sw	a5,16(sp)
   10338:	00200a93          	li	s5,2
   1033c:	e75ff06f          	j	101b0 <main+0xc8>
   10340:	00010937          	lui	s2,0x10
   10344:	45490913          	addi	s2,s2,1108 # 10454 <main+0x36c>
   10348:	04100513          	li	a0,65
   1034c:	00190913          	addi	s2,s2,1
   10350:	d79ff0ef          	jal	100c8 <my_putchar>
   10354:	00094503          	lbu	a0,0(s2)
   10358:	fe051ae3          	bnez	a0,1034c <main+0x264>
   1035c:	00048513          	mv	a0,s1
   10360:	cddff0ef          	jal	1003c <print_hex32>
   10364:	00040513          	mv	a0,s0
   10368:	cd5ff0ef          	jal	1003c <print_hex32>
   1036c:	00a00513          	li	a0,10
   10370:	d59ff0ef          	jal	100c8 <my_putchar>
   10374:	00010437          	lui	s0,0x10
   10378:	45c40413          	addi	s0,s0,1116 # 1045c <main+0x374>
   1037c:	04200513          	li	a0,66
   10380:	00140413          	addi	s0,s0,1
   10384:	d45ff0ef          	jal	100c8 <my_putchar>
   10388:	00044503          	lbu	a0,0(s0)
   1038c:	fe051ae3          	bnez	a0,10380 <main+0x298>
   10390:	00098513          	mv	a0,s3
   10394:	ca9ff0ef          	jal	1003c <print_hex32>
   10398:	000c8513          	mv	a0,s9
   1039c:	ca1ff0ef          	jal	1003c <print_hex32>
   103a0:	00a00513          	li	a0,10
   103a4:	d25ff0ef          	jal	100c8 <my_putchar>
   103a8:	00010437          	lui	s0,0x10
   103ac:	46440413          	addi	s0,s0,1124 # 10464 <main+0x37c>
   103b0:	04300513          	li	a0,67
   103b4:	00140413          	addi	s0,s0,1
   103b8:	d11ff0ef          	jal	100c8 <my_putchar>
   103bc:	00044503          	lbu	a0,0(s0)
   103c0:	fe051ae3          	bnez	a0,103b4 <main+0x2cc>
   103c4:	000a8513          	mv	a0,s5
   103c8:	c75ff0ef          	jal	1003c <print_hex32>
   103cc:	000c0513          	mv	a0,s8
   103d0:	c6dff0ef          	jal	1003c <print_hex32>
   103d4:	00a00513          	li	a0,10
   103d8:	cf1ff0ef          	jal	100c8 <my_putchar>
   103dc:	06c12083          	lw	ra,108(sp)
   103e0:	06812403          	lw	s0,104(sp)
   103e4:	06412483          	lw	s1,100(sp)
   103e8:	06012903          	lw	s2,96(sp)
   103ec:	05c12983          	lw	s3,92(sp)
   103f0:	05812a03          	lw	s4,88(sp)
   103f4:	05412a83          	lw	s5,84(sp)
   103f8:	05012b03          	lw	s6,80(sp)
   103fc:	04c12b83          	lw	s7,76(sp)
   10400:	04812c03          	lw	s8,72(sp)
   10404:	04412c83          	lw	s9,68(sp)
   10408:	04012d03          	lw	s10,64(sp)
   1040c:	03c12d83          	lw	s11,60(sp)
   10410:	00000513          	li	a0,0
   10414:	07010113          	addi	sp,sp,112
   10418:	00008067          	ret
   1041c:	04300793          	li	a5,67
   10420:	00f12623          	sw	a5,12(sp)
   10424:	03100793          	li	a5,49
   10428:	00f12823          	sw	a5,16(sp)
   1042c:	00200c13          	li	s8,2
   10430:	00000a93          	li	s5,0
   10434:	da5ff06f          	j	101d8 <main+0xf0>
