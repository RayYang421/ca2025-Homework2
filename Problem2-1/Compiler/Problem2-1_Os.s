
Problem2_Os.elf:     file format elf32-littleriscv


Disassembly of section .text:

00010000 <_start>:
   10000:	00001117          	auipc	sp,0x1
   10004:	43010113          	addi	sp,sp,1072 # 11430 <__stack_top>
   10008:	00000297          	auipc	t0,0x0
   1000c:	41f28293          	addi	t0,t0,1055 # 10427 <__bss_end>
   10010:	00000317          	auipc	t1,0x0
   10014:	41730313          	addi	t1,t1,1047 # 10427 <__bss_end>
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
   100d4:	35658593          	addi	a1,a1,854 # 10426 <chbuf>
   100d8:	00a58023          	sb	a0,0(a1)
   100dc:	00100613          	li	a2,1
   100e0:	00000073          	ecall
   100e4:	00008067          	ret

Disassembly of section .text.startup:

000100e8 <main>:
   100e8:	f9010113          	addi	sp,sp,-112
   100ec:	05312e23          	sw	s3,92(sp)
   100f0:	05612823          	sw	s6,80(sp)
   100f4:	05712623          	sw	s7,76(sp)
   100f8:	05812423          	sw	s8,72(sp)
   100fc:	05912223          	sw	s9,68(sp)
   10100:	05a12023          	sw	s10,64(sp)
   10104:	06112623          	sw	ra,108(sp)
   10108:	06812423          	sw	s0,104(sp)
   1010c:	06912223          	sw	s1,100(sp)
   10110:	07212023          	sw	s2,96(sp)
   10114:	05412c23          	sw	s4,88(sp)
   10118:	05512a23          	sw	s5,84(sp)
   1011c:	03b12e23          	sw	s11,60(sp)
   10120:	02012223          	sw	zero,36(sp)
   10124:	02012423          	sw	zero,40(sp)
   10128:	02012623          	sw	zero,44(sp)
   1012c:	00100993          	li	s3,1
   10130:	00012623          	sw	zero,12(sp)
   10134:	00012823          	sw	zero,16(sp)
   10138:	00000b13          	li	s6,0
   1013c:	00000c93          	li	s9,0
   10140:	00000b93          	li	s7,0
   10144:	00000d13          	li	s10,0
   10148:	02410c13          	addi	s8,sp,36
   1014c:	f69ff0ef          	jal	100b4 <get_instret>
   10150:	4019d413          	srai	s0,s3,0x1
   10154:	fff98793          	addi	a5,s3,-1
   10158:	01344433          	xor	s0,s0,s3
   1015c:	00f44433          	xor	s0,s0,a5
   10160:	4017d793          	srai	a5,a5,0x1
   10164:	00f44433          	xor	s0,s0,a5
   10168:	00147793          	andi	a5,s0,1
   1016c:	02412903          	lw	s2,36(sp)
   10170:	00050a93          	mv	s5,a0
   10174:	00058493          	mv	s1,a1
   10178:	16079463          	bnez	a5,102e0 <main+0x1f8>
   1017c:	00247413          	andi	s0,s0,2
   10180:	00143413          	seqz	s0,s0
   10184:	00140413          	addi	s0,s0,1
   10188:	00241793          	slli	a5,s0,0x2
   1018c:	018787b3          	add	a5,a5,s8
   10190:	0007a783          	lw	a5,0(a5)
   10194:	00300713          	li	a4,3
   10198:	40f70db3          	sub	s11,a4,a5
   1019c:	412d8db3          	sub	s11,s11,s2
   101a0:	00078913          	mv	s2,a5
   101a4:	04190913          	addi	s2,s2,65
   101a8:	0ff97793          	zext.b	a5,s2
   101ac:	041d8a13          	addi	s4,s11,65
   101b0:	00f12a23          	sw	a5,20(sp)
   101b4:	0ffa7793          	zext.b	a5,s4
   101b8:	00f12c23          	sw	a5,24(sp)
   101bc:	ef9ff0ef          	jal	100b4 <get_instret>
   101c0:	415b87b3          	sub	a5,s7,s5
   101c4:	00fbbbb3          	sltu	s7,s7,a5
   101c8:	409d04b3          	sub	s1,s10,s1
   101cc:	00a78ab3          	add	s5,a5,a0
   101d0:	41748bb3          	sub	s7,s1,s7
   101d4:	00bb8bb3          	add	s7,s7,a1
   101d8:	00fab4b3          	sltu	s1,s5,a5
   101dc:	ed9ff0ef          	jal	100b4 <get_instret>
   101e0:	017484b3          	add	s1,s1,s7
   101e4:	000107b7          	lui	a5,0x10
   101e8:	000a8b93          	mv	s7,s5
   101ec:	00048d13          	mv	s10,s1
   101f0:	00a12e23          	sw	a0,28(sp)
   101f4:	00058a13          	mv	s4,a1
   101f8:	3f478913          	addi	s2,a5,1012 # 103f4 <main+0x30c>
   101fc:	00094503          	lbu	a0,0(s2)
   10200:	10051063          	bnez	a0,10300 <main+0x218>
   10204:	03140513          	addi	a0,s0,49
   10208:	ec1ff0ef          	jal	100c8 <my_putchar>
   1020c:	000107b7          	lui	a5,0x10
   10210:	40078913          	addi	s2,a5,1024 # 10400 <main+0x318>
   10214:	00094503          	lbu	a0,0(s2)
   10218:	0e051a63          	bnez	a0,1030c <main+0x224>
   1021c:	01412503          	lw	a0,20(sp)
   10220:	ea9ff0ef          	jal	100c8 <my_putchar>
   10224:	000107b7          	lui	a5,0x10
   10228:	40878913          	addi	s2,a5,1032 # 10408 <main+0x320>
   1022c:	00094503          	lbu	a0,0(s2)
   10230:	0e051463          	bnez	a0,10318 <main+0x230>
   10234:	01812503          	lw	a0,24(sp)
   10238:	00241413          	slli	s0,s0,0x2
   1023c:	01840433          	add	s0,s0,s8
   10240:	e89ff0ef          	jal	100c8 <my_putchar>
   10244:	00a00513          	li	a0,10
   10248:	e81ff0ef          	jal	100c8 <my_putchar>
   1024c:	e69ff0ef          	jal	100b4 <get_instret>
   10250:	01c12783          	lw	a5,28(sp)
   10254:	00198993          	addi	s3,s3,1
   10258:	40fb0933          	sub	s2,s6,a5
   1025c:	012b3b33          	sltu	s6,s6,s2
   10260:	414c87b3          	sub	a5,s9,s4
   10264:	41678b33          	sub	s6,a5,s6
   10268:	00a90a33          	add	s4,s2,a0
   1026c:	00bb0b33          	add	s6,s6,a1
   10270:	e45ff0ef          	jal	100b4 <get_instret>
   10274:	00a12c23          	sw	a0,24(sp)
   10278:	01b42023          	sw	s11,0(s0)
   1027c:	00b12a23          	sw	a1,20(sp)
   10280:	e35ff0ef          	jal	100b4 <get_instret>
   10284:	01012703          	lw	a4,16(sp)
   10288:	00c12783          	lw	a5,12(sp)
   1028c:	01812683          	lw	a3,24(sp)
   10290:	00e585b3          	add	a1,a1,a4
   10294:	00f507b3          	add	a5,a0,a5
   10298:	01412703          	lw	a4,20(sp)
   1029c:	00a7b433          	sltu	s0,a5,a0
   102a0:	40d78db3          	sub	s11,a5,a3
   102a4:	00b40433          	add	s0,s0,a1
   102a8:	01b7b7b3          	sltu	a5,a5,s11
   102ac:	40e40433          	sub	s0,s0,a4
   102b0:	40f40433          	sub	s0,s0,a5
   102b4:	012a3933          	sltu	s2,s4,s2
   102b8:	01690933          	add	s2,s2,s6
   102bc:	01b12623          	sw	s11,12(sp)
   102c0:	00812823          	sw	s0,16(sp)
   102c4:	00800793          	li	a5,8
   102c8:	000a0b13          	mv	s6,s4
   102cc:	00090c93          	mv	s9,s2
   102d0:	e6f99ee3          	bne	s3,a5,1014c <main+0x64>
   102d4:	000109b7          	lui	s3,0x10
   102d8:	41098993          	addi	s3,s3,1040 # 10410 <main+0x328>
   102dc:	0500006f          	j	1032c <main+0x244>
   102e0:	00090a63          	beqz	s2,102f4 <main+0x20c>
   102e4:	fff90d93          	addi	s11,s2,-1
   102e8:	01b03db3          	snez	s11,s11
   102ec:	00000413          	li	s0,0
   102f0:	eb5ff06f          	j	101a4 <main+0xbc>
   102f4:	00000413          	li	s0,0
   102f8:	00200d93          	li	s11,2
   102fc:	ea9ff06f          	j	101a4 <main+0xbc>
   10300:	00190913          	addi	s2,s2,1
   10304:	dc5ff0ef          	jal	100c8 <my_putchar>
   10308:	ef5ff06f          	j	101fc <main+0x114>
   1030c:	00190913          	addi	s2,s2,1
   10310:	db9ff0ef          	jal	100c8 <my_putchar>
   10314:	f01ff06f          	j	10214 <main+0x12c>
   10318:	00190913          	addi	s2,s2,1
   1031c:	dadff0ef          	jal	100c8 <my_putchar>
   10320:	f0dff06f          	j	1022c <main+0x144>
   10324:	00198993          	addi	s3,s3,1
   10328:	da1ff0ef          	jal	100c8 <my_putchar>
   1032c:	0009c503          	lbu	a0,0(s3)
   10330:	fe051ae3          	bnez	a0,10324 <main+0x23c>
   10334:	00048513          	mv	a0,s1
   10338:	d05ff0ef          	jal	1003c <print_hex32>
   1033c:	000a8513          	mv	a0,s5
   10340:	cfdff0ef          	jal	1003c <print_hex32>
   10344:	00a00513          	li	a0,10
   10348:	000104b7          	lui	s1,0x10
   1034c:	d7dff0ef          	jal	100c8 <my_putchar>
   10350:	41848493          	addi	s1,s1,1048 # 10418 <main+0x330>
   10354:	0004c503          	lbu	a0,0(s1)
   10358:	08051263          	bnez	a0,103dc <main+0x2f4>
   1035c:	00090513          	mv	a0,s2
   10360:	cddff0ef          	jal	1003c <print_hex32>
   10364:	000a0513          	mv	a0,s4
   10368:	cd5ff0ef          	jal	1003c <print_hex32>
   1036c:	00a00513          	li	a0,10
   10370:	000104b7          	lui	s1,0x10
   10374:	d55ff0ef          	jal	100c8 <my_putchar>
   10378:	42048493          	addi	s1,s1,1056 # 10420 <main+0x338>
   1037c:	0004c503          	lbu	a0,0(s1)
   10380:	06051463          	bnez	a0,103e8 <main+0x300>
   10384:	00040513          	mv	a0,s0
   10388:	cb5ff0ef          	jal	1003c <print_hex32>
   1038c:	000d8513          	mv	a0,s11
   10390:	cadff0ef          	jal	1003c <print_hex32>
   10394:	00a00513          	li	a0,10
   10398:	d31ff0ef          	jal	100c8 <my_putchar>
   1039c:	06c12083          	lw	ra,108(sp)
   103a0:	06812403          	lw	s0,104(sp)
   103a4:	06412483          	lw	s1,100(sp)
   103a8:	06012903          	lw	s2,96(sp)
   103ac:	05c12983          	lw	s3,92(sp)
   103b0:	05812a03          	lw	s4,88(sp)
   103b4:	05412a83          	lw	s5,84(sp)
   103b8:	05012b03          	lw	s6,80(sp)
   103bc:	04c12b83          	lw	s7,76(sp)
   103c0:	04812c03          	lw	s8,72(sp)
   103c4:	04412c83          	lw	s9,68(sp)
   103c8:	04012d03          	lw	s10,64(sp)
   103cc:	03c12d83          	lw	s11,60(sp)
   103d0:	00000513          	li	a0,0
   103d4:	07010113          	addi	sp,sp,112
   103d8:	00008067          	ret
   103dc:	00148493          	addi	s1,s1,1
   103e0:	ce9ff0ef          	jal	100c8 <my_putchar>
   103e4:	f71ff06f          	j	10354 <main+0x26c>
   103e8:	00148493          	addi	s1,s1,1
   103ec:	cddff0ef          	jal	100c8 <my_putchar>
   103f0:	f8dff06f          	j	1037c <main+0x294>
