
build/briey.elf:     file format elf32-littleriscv


Disassembly of section .vector:

80000000 <crtStart>:
.global crtStart
.global main
.global irqCallback

crtStart:
  j crtInit
80000000:	0b40006f          	j	800000b4 <crtInit>
  nop
80000004:	00000013          	nop
  nop
80000008:	00000013          	nop
  nop
8000000c:	00000013          	nop
  nop
80000010:	00000013          	nop
  nop
80000014:	00000013          	nop
  nop
80000018:	00000013          	nop
  nop
8000001c:	00000013          	nop

80000020 <trap_entry>:

.global  trap_entry
trap_entry:
  sw x1,  - 1*4(sp)
80000020:	fe112e23          	sw	ra,-4(sp)
  sw x5,  - 2*4(sp)
80000024:	fe512c23          	sw	t0,-8(sp)
  sw x6,  - 3*4(sp)
80000028:	fe612a23          	sw	t1,-12(sp)
  sw x7,  - 4*4(sp)
8000002c:	fe712823          	sw	t2,-16(sp)
  sw x10, - 5*4(sp)
80000030:	fea12623          	sw	a0,-20(sp)
  sw x11, - 6*4(sp)
80000034:	feb12423          	sw	a1,-24(sp)
  sw x12, - 7*4(sp)
80000038:	fec12223          	sw	a2,-28(sp)
  sw x13, - 8*4(sp)
8000003c:	fed12023          	sw	a3,-32(sp)
  sw x14, - 9*4(sp)
80000040:	fce12e23          	sw	a4,-36(sp)
  sw x15, -10*4(sp)
80000044:	fcf12c23          	sw	a5,-40(sp)
  sw x16, -11*4(sp)
80000048:	fd012a23          	sw	a6,-44(sp)
  sw x17, -12*4(sp)
8000004c:	fd112823          	sw	a7,-48(sp)
  sw x28, -13*4(sp)
80000050:	fdc12623          	sw	t3,-52(sp)
  sw x29, -14*4(sp)
80000054:	fdd12423          	sw	t4,-56(sp)
  sw x30, -15*4(sp)
80000058:	fde12223          	sw	t5,-60(sp)
  sw x31, -16*4(sp)
8000005c:	fdf12023          	sw	t6,-64(sp)
  addi sp,sp,-16*4
80000060:	fc010113          	addi	sp,sp,-64
  call irqCallback
80000064:	c0000097          	auipc	ra,0xc0000
80000068:	548080e7          	jalr	1352(ra) # 400005ac <irqCallback>
  lw x1 , 15*4(sp)
8000006c:	03c12083          	lw	ra,60(sp)
  lw x5,  14*4(sp)
80000070:	03812283          	lw	t0,56(sp)
  lw x6,  13*4(sp)
80000074:	03412303          	lw	t1,52(sp)
  lw x7,  12*4(sp)
80000078:	03012383          	lw	t2,48(sp)
  lw x10, 11*4(sp)
8000007c:	02c12503          	lw	a0,44(sp)
  lw x11, 10*4(sp)
80000080:	02812583          	lw	a1,40(sp)
  lw x12,  9*4(sp)
80000084:	02412603          	lw	a2,36(sp)
  lw x13,  8*4(sp)
80000088:	02012683          	lw	a3,32(sp)
  lw x14,  7*4(sp)
8000008c:	01c12703          	lw	a4,28(sp)
  lw x15,  6*4(sp)
80000090:	01812783          	lw	a5,24(sp)
  lw x16,  5*4(sp)
80000094:	01412803          	lw	a6,20(sp)
  lw x17,  4*4(sp)
80000098:	01012883          	lw	a7,16(sp)
  lw x28,  3*4(sp)
8000009c:	00c12e03          	lw	t3,12(sp)
  lw x29,  2*4(sp)
800000a0:	00812e83          	lw	t4,8(sp)
  lw x30,  1*4(sp)
800000a4:	00412f03          	lw	t5,4(sp)
  lw x31,  0*4(sp)
800000a8:	00012f83          	lw	t6,0(sp)
  addi sp,sp,16*4
800000ac:	04010113          	addi	sp,sp,64
  mret
800000b0:	30200073          	mret

800000b4 <crtInit>:


crtInit:
  .option push
  .option norelax
  la gp, __global_pointer$
800000b4:	c0001197          	auipc	gp,0xc0001
800000b8:	e4418193          	addi	gp,gp,-444 # 40000ef8 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0000517          	auipc	a0,0xc0000
800000c8:	63450513          	addi	a0,a0,1588 # 400006f8 <data>
  la a1, _bss_end
800000cc:	80818593          	addi	a1,gp,-2040 # 40000700 <_bss_end>

800000d0 <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
800000d0:	00b50863          	beq	a0,a1,800000e0 <bss_done>
  sw zero,0(a0)
800000d4:	00052023          	sw	zero,0(a0)
  add a0,a0,4
800000d8:	00450513          	addi	a0,a0,4
  j bss_loop
800000dc:	ff5ff06f          	j	800000d0 <bss_loop>

800000e0 <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000e0:	c0000517          	auipc	a0,0xc0000
800000e4:	61450513          	addi	a0,a0,1556 # 400006f4 <_ctors_end>
  addi sp,sp,-4
800000e8:	ffc10113          	addi	sp,sp,-4

800000ec <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000ec:	c0000597          	auipc	a1,0xc0000
800000f0:	60858593          	addi	a1,a1,1544 # 400006f4 <_ctors_end>
  beq a0,a1,ctors_done
800000f4:	00b50e63          	beq	a0,a1,80000110 <ctors_done>
  lw a3,0(a0)
800000f8:	00052683          	lw	a3,0(a0)
  add a0,a0,4
800000fc:	00450513          	addi	a0,a0,4
  sw a0,0(sp)
80000100:	00a12023          	sw	a0,0(sp)
  jalr  a3
80000104:	000680e7          	jalr	a3
  lw a0,0(sp)
80000108:	00012503          	lw	a0,0(sp)
  j ctors_loop
8000010c:	fe1ff06f          	j	800000ec <ctors_loop>

80000110 <ctors_done>:
ctors_done:
  addi sp,sp,4
80000110:	00410113          	addi	sp,sp,4


  li a0, 0x880     //880 enable timer + external interrupts
80000114:	00001537          	lui	a0,0x1
80000118:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x80>
  csrw mie,a0
8000011c:	30451073          	csrw	mie,a0
  li a0, 0x1808     //1808 enable interrupts
80000120:	00002537          	lui	a0,0x2
80000124:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1008>
  csrw mstatus,a0
80000128:	30051073          	csrw	mstatus,a0

  call main
8000012c:	c0000097          	auipc	ra,0xc0000
80000130:	270080e7          	jalr	624(ra) # 4000039c <main>

80000134 <infinitLoop>:
infinitLoop:
  j infinitLoop
80000134:	0000006f          	j	80000134 <infinitLoop>

Disassembly of section .memory:

40000000 <timer_init>:
  volatile uint32_t CLEARS_TICKS;
  volatile uint32_t LIMIT;
  volatile uint32_t VALUE;
} Timer_Reg;

static void timer_init(Timer_Reg *reg){
40000000:	fe010113          	addi	sp,sp,-32
40000004:	00812e23          	sw	s0,28(sp)
40000008:	02010413          	addi	s0,sp,32
4000000c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000010:	fec42783          	lw	a5,-20(s0)
40000014:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000018:	fec42783          	lw	a5,-20(s0)
4000001c:	0007a423          	sw	zero,8(a5)
}
40000020:	00000013          	nop
40000024:	01c12403          	lw	s0,28(sp)
40000028:	02010113          	addi	sp,sp,32
4000002c:	00008067          	ret

40000030 <prescaler_init>:
typedef struct
{
  volatile uint32_t LIMIT;
} Prescaler_Reg;

static void prescaler_init(Prescaler_Reg* reg){
40000030:	fe010113          	addi	sp,sp,-32
40000034:	00812e23          	sw	s0,28(sp)
40000038:	02010413          	addi	s0,sp,32
4000003c:	fea42623          	sw	a0,-20(s0)

}
40000040:	00000013          	nop
40000044:	01c12403          	lw	s0,28(sp)
40000048:	02010113          	addi	sp,sp,32
4000004c:	00008067          	ret

40000050 <interruptCtrl_init>:
{
  volatile uint32_t PENDINGS;
  volatile uint32_t MASKS;
} InterruptCtrl_Reg;

static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000050:	fe010113          	addi	sp,sp,-32
40000054:	00812e23          	sw	s0,28(sp)
40000058:	02010413          	addi	s0,sp,32
4000005c:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000060:	fec42783          	lw	a5,-20(s0)
40000064:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000068:	fec42783          	lw	a5,-20(s0)
4000006c:	fff00713          	li	a4,-1
40000070:	00e7a023          	sw	a4,0(a5)
}
40000074:	00000013          	nop
40000078:	01c12403          	lw	s0,28(sp)
4000007c:	02010113          	addi	sp,sp,32
40000080:	00008067          	ret

40000084 <uart_writeAvailability>:
	enum UartParity parity;
	enum UartStop stop;
	uint32_t clockDivider;
} Uart_Config;

static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000084:	fe010113          	addi	sp,sp,-32
40000088:	00812e23          	sw	s0,28(sp)
4000008c:	02010413          	addi	s0,sp,32
40000090:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000094:	fec42783          	lw	a5,-20(s0)
40000098:	0047a783          	lw	a5,4(a5)
4000009c:	0107d793          	srli	a5,a5,0x10
400000a0:	0ff7f793          	zext.b	a5,a5
}
400000a4:	00078513          	mv	a0,a5
400000a8:	01c12403          	lw	s0,28(sp)
400000ac:	02010113          	addi	sp,sp,32
400000b0:	00008067          	ret

400000b4 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400000b4:	fe010113          	addi	sp,sp,-32
400000b8:	00812e23          	sw	s0,28(sp)
400000bc:	02010413          	addi	s0,sp,32
400000c0:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400000c4:	fec42783          	lw	a5,-20(s0)
400000c8:	0047a783          	lw	a5,4(a5)
400000cc:	0187d793          	srli	a5,a5,0x18
}
400000d0:	00078513          	mv	a0,a5
400000d4:	01c12403          	lw	s0,28(sp)
400000d8:	02010113          	addi	sp,sp,32
400000dc:	00008067          	ret

400000e0 <uart_write>:

static void uart_write(Uart_Reg *reg, uint32_t data){
400000e0:	fe010113          	addi	sp,sp,-32
400000e4:	00112e23          	sw	ra,28(sp)
400000e8:	00812c23          	sw	s0,24(sp)
400000ec:	02010413          	addi	s0,sp,32
400000f0:	fea42623          	sw	a0,-20(s0)
400000f4:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400000f8:	00000013          	nop
400000fc:	fec42503          	lw	a0,-20(s0)
40000100:	f85ff0ef          	jal	ra,40000084 <uart_writeAvailability>
40000104:	00050793          	mv	a5,a0
40000108:	fe078ae3          	beqz	a5,400000fc <uart_write+0x1c>
	reg->DATA = data;
4000010c:	fec42783          	lw	a5,-20(s0)
40000110:	fe842703          	lw	a4,-24(s0)
40000114:	00e7a023          	sw	a4,0(a5)
}
40000118:	00000013          	nop
4000011c:	01c12083          	lw	ra,28(sp)
40000120:	01812403          	lw	s0,24(sp)
40000124:	02010113          	addi	sp,sp,32
40000128:	00008067          	ret

4000012c <uart_applyConfig>:

static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
4000012c:	fe010113          	addi	sp,sp,-32
40000130:	00812e23          	sw	s0,28(sp)
40000134:	02010413          	addi	s0,sp,32
40000138:	fea42623          	sw	a0,-20(s0)
4000013c:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000140:	fe842783          	lw	a5,-24(s0)
40000144:	00c7a703          	lw	a4,12(a5)
40000148:	fec42783          	lw	a5,-20(s0)
4000014c:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000150:	fe842783          	lw	a5,-24(s0)
40000154:	0007a783          	lw	a5,0(a5)
40000158:	fff78713          	addi	a4,a5,-1
4000015c:	fe842783          	lw	a5,-24(s0)
40000160:	0047a783          	lw	a5,4(a5)
40000164:	00879793          	slli	a5,a5,0x8
40000168:	00f76733          	or	a4,a4,a5
4000016c:	fe842783          	lw	a5,-24(s0)
40000170:	0087a783          	lw	a5,8(a5)
40000174:	01079793          	slli	a5,a5,0x10
40000178:	00f76733          	or	a4,a4,a5
4000017c:	fec42783          	lw	a5,-20(s0)
40000180:	00e7a623          	sw	a4,12(a5)
}
40000184:	00000013          	nop
40000188:	01c12403          	lw	s0,28(sp)
4000018c:	02010113          	addi	sp,sp,32
40000190:	00008067          	ret

40000194 <vga_isBusy>:
  volatile uint32_t  FRAME_BASE;
  volatile uint32_t  DUMMY0[13];
  volatile Vga_Timing TIMING;
} Vga_Reg;

static uint32_t vga_isBusy(Vga_Reg *reg){
40000194:	fe010113          	addi	sp,sp,-32
40000198:	00812e23          	sw	s0,28(sp)
4000019c:	02010413          	addi	s0,sp,32
400001a0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400001a4:	fec42783          	lw	a5,-20(s0)
400001a8:	0007a783          	lw	a5,0(a5)
400001ac:	0027f793          	andi	a5,a5,2
400001b0:	00f037b3          	snez	a5,a5
400001b4:	0ff7f793          	zext.b	a5,a5
}
400001b8:	00078513          	mv	a0,a5
400001bc:	01c12403          	lw	s0,28(sp)
400001c0:	02010113          	addi	sp,sp,32
400001c4:	00008067          	ret

400001c8 <vga_run>:

static void vga_run(Vga_Reg *reg){
400001c8:	fe010113          	addi	sp,sp,-32
400001cc:	00812e23          	sw	s0,28(sp)
400001d0:	02010413          	addi	s0,sp,32
400001d4:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400001d8:	fec42783          	lw	a5,-20(s0)
400001dc:	00100713          	li	a4,1
400001e0:	00e7a023          	sw	a4,0(a5)
}
400001e4:	00000013          	nop
400001e8:	01c12403          	lw	s0,28(sp)
400001ec:	02010113          	addi	sp,sp,32
400001f0:	00008067          	ret

400001f4 <vga_stop>:

static void vga_stop(Vga_Reg *reg){
400001f4:	fe010113          	addi	sp,sp,-32
400001f8:	00112e23          	sw	ra,28(sp)
400001fc:	00812c23          	sw	s0,24(sp)
40000200:	02010413          	addi	s0,sp,32
40000204:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000208:	fec42783          	lw	a5,-20(s0)
4000020c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000210:	00000013          	nop
40000214:	fec42503          	lw	a0,-20(s0)
40000218:	f7dff0ef          	jal	ra,40000194 <vga_isBusy>
4000021c:	00050793          	mv	a5,a0
40000220:	fe079ae3          	bnez	a5,40000214 <vga_stop+0x20>
}
40000224:	00000013          	nop
40000228:	00000013          	nop
4000022c:	01c12083          	lw	ra,28(sp)
40000230:	01812403          	lw	s0,24(sp)
40000234:	02010113          	addi	sp,sp,32
40000238:	00008067          	ret

4000023c <gpio_write>:
#define DATA_BASE_ADDRESS 0x10
#define DATA_READY_ADDRESS 0x14
#define RESET_EXTERNAL_ADDRESS 0x18

void gpio_write(int iData, int iAddress)
{
4000023c:	fe010113          	addi	sp,sp,-32
40000240:	00812e23          	sw	s0,28(sp)
40000244:	02010413          	addi	s0,sp,32
40000248:	fea42623          	sw	a0,-20(s0)
4000024c:	feb42423          	sw	a1,-24(s0)
	GPIO_ADDRESS_BASE ->OUTPUT=iAddress;
40000250:	f00057b7          	lui	a5,0xf0005
40000254:	fe842703          	lw	a4,-24(s0)
40000258:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	GPIO_DATA_BASE ->OUTPUT=iData;
4000025c:	f00067b7          	lui	a5,0xf0006
40000260:	fec42703          	lw	a4,-20(s0)
40000264:	00e7a223          	sw	a4,4(a5) # f0006004 <_stack_start+0x700056c4>
	GPIO_READ_N_BASE ->OUTPUT=1;
40000268:	f00037b7          	lui	a5,0xf0003
4000026c:	00100713          	li	a4,1
40000270:	00e7a223          	sw	a4,4(a5) # f0003004 <_stack_start+0x700026c4>
	GPIO_WRITE_N_BASE ->OUTPUT=0;
40000274:	f00047b7          	lui	a5,0xf0004
40000278:	0007a223          	sw	zero,4(a5) # f0004004 <_stack_start+0x700036c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=1;
4000027c:	f00027b7          	lui	a5,0xf0002
40000280:	00100713          	li	a4,1
40000284:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=0;
40000288:	f00027b7          	lui	a5,0xf0002
4000028c:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>
}
40000290:	00000013          	nop
40000294:	01c12403          	lw	s0,28(sp)
40000298:	02010113          	addi	sp,sp,32
4000029c:	00008067          	ret

400002a0 <gpio_read>:
int gpio_read(int iAddress)
{
400002a0:	fd010113          	addi	sp,sp,-48
400002a4:	02812623          	sw	s0,44(sp)
400002a8:	03010413          	addi	s0,sp,48
400002ac:	fca42e23          	sw	a0,-36(s0)
	GPIO_ADDRESS_BASE ->OUTPUT=iAddress;
400002b0:	f00057b7          	lui	a5,0xf0005
400002b4:	fdc42703          	lw	a4,-36(s0)
400002b8:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	GPIO_WRITE_N_BASE ->OUTPUT=1;
400002bc:	f00047b7          	lui	a5,0xf0004
400002c0:	00100713          	li	a4,1
400002c4:	00e7a223          	sw	a4,4(a5) # f0004004 <_stack_start+0x700036c4>
	GPIO_READ_N_BASE ->OUTPUT=0;
400002c8:	f00037b7          	lui	a5,0xf0003
400002cc:	0007a223          	sw	zero,4(a5) # f0003004 <_stack_start+0x700026c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=1;
400002d0:	f00027b7          	lui	a5,0xf0002
400002d4:	00100713          	li	a4,1
400002d8:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	int res = GPIO_A_BASE->INPUT;
400002dc:	f00007b7          	lui	a5,0xf0000
400002e0:	0007a783          	lw	a5,0(a5) # f0000000 <_stack_start+0x6ffff6c0>
400002e4:	fef42623          	sw	a5,-20(s0)
	GPIO_CHIPSELECT_BASE ->OUTPUT=0;
400002e8:	f00027b7          	lui	a5,0xf0002
400002ec:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>
	return res;
400002f0:	fec42783          	lw	a5,-20(s0)
}
400002f4:	00078513          	mv	a0,a5
400002f8:	02c12403          	lw	s0,44(sp)
400002fc:	03010113          	addi	sp,sp,48
40000300:	00008067          	ret

40000304 <freeTime>:
void freeTime()
{
40000304:	ff010113          	addi	sp,sp,-16
40000308:	00812623          	sw	s0,12(sp)
4000030c:	01010413          	addi	s0,sp,16
	GPIO_CHIPSELECT_BASE->OUTPUT=1;
40000310:	f00027b7          	lui	a5,0xf0002
40000314:	00100713          	li	a4,1
40000318:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_WRITE_N_BASE->OUTPUT=1;
4000031c:	f00047b7          	lui	a5,0xf0004
40000320:	00100713          	li	a4,1
40000324:	00e7a223          	sw	a4,4(a5) # f0004004 <_stack_start+0x700036c4>
	GPIO_READ_N_BASE->OUTPUT=1;
40000328:	f00037b7          	lui	a5,0xf0003
4000032c:	00100713          	li	a4,1
40000330:	00e7a223          	sw	a4,4(a5) # f0003004 <_stack_start+0x700026c4>
}
40000334:	00000013          	nop
40000338:	00c12403          	lw	s0,12(sp)
4000033c:	01010113          	addi	sp,sp,16
40000340:	00008067          	ret

40000344 <print>:
void print(char *str){
40000344:	fe010113          	addi	sp,sp,-32
40000348:	00112e23          	sw	ra,28(sp)
4000034c:	00812c23          	sw	s0,24(sp)
40000350:	02010413          	addi	s0,sp,32
40000354:	fea42623          	sw	a0,-20(s0)
	while(*str){
40000358:	0200006f          	j	40000378 <print+0x34>
		uart_write(UART,*(str++));
4000035c:	fec42783          	lw	a5,-20(s0)
40000360:	00178713          	addi	a4,a5,1
40000364:	fee42623          	sw	a4,-20(s0)
40000368:	0007c783          	lbu	a5,0(a5)
4000036c:	00078593          	mv	a1,a5
40000370:	f0010537          	lui	a0,0xf0010
40000374:	d6dff0ef          	jal	ra,400000e0 <uart_write>
	while(*str){
40000378:	fec42783          	lw	a5,-20(s0)
4000037c:	0007c783          	lbu	a5,0(a5)
40000380:	fc079ee3          	bnez	a5,4000035c <print+0x18>
	}
}
40000384:	00000013          	nop
40000388:	00000013          	nop
4000038c:	01c12083          	lw	ra,28(sp)
40000390:	01812403          	lw	s0,24(sp)
40000394:	02010113          	addi	sp,sp,32
40000398:	00008067          	ret

4000039c <main>:
unsigned int data;
unsigned int address;
int main() {
4000039c:	fd010113          	addi	sp,sp,-48
400003a0:	02112623          	sw	ra,44(sp)
400003a4:	02812423          	sw	s0,40(sp)
400003a8:	03010413          	addi	s0,sp,48
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
400003ac:	00800793          	li	a5,8
400003b0:	fcf42e23          	sw	a5,-36(s0)
	uartConfig.parity = NONE;
400003b4:	fe042023          	sw	zero,-32(s0)
	uartConfig.stop = ONE;
400003b8:	fe042223          	sw	zero,-28(s0)
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
400003bc:	03500793          	li	a5,53
400003c0:	fef42423          	sw	a5,-24(s0)
	uart_applyConfig(UART,&uartConfig);
400003c4:	fdc40793          	addi	a5,s0,-36
400003c8:	00078593          	mv	a1,a5
400003cc:	f0010537          	lui	a0,0xf0010
400003d0:	d5dff0ef          	jal	ra,4000012c <uart_applyConfig>

	print("Well, hello there ! こんにちは。\r\n");
400003d4:	400007b7          	lui	a5,0x40000
400003d8:	62878513          	addi	a0,a5,1576 # 40000628 <vga_simRes_h160_v120+0x20>
400003dc:	f69ff0ef          	jal	ra,40000344 <print>
	print("University of Electro-Communications (UEC), Tokyo, Japan\r\n");
400003e0:	400007b7          	lui	a5,0x40000
400003e4:	65478513          	addi	a0,a5,1620 # 40000654 <vga_simRes_h160_v120+0x4c>
400003e8:	f5dff0ef          	jal	ra,40000344 <print>
	print("電気通信大学、東京都、日本\r\n");
400003ec:	400007b7          	lui	a5,0x40000
400003f0:	69078513          	addi	a0,a5,1680 # 40000690 <vga_simRes_h160_v120+0x88>
400003f4:	f51ff0ef          	jal	ra,40000344 <print>
	print("AES Accelerator - Duy Linh Le K18\r\n");
400003f8:	400007b7          	lui	a5,0x40000
400003fc:	6bc78513          	addi	a0,a5,1724 # 400006bc <vga_simRes_h160_v120+0xb4>
40000400:	f45ff0ef          	jal	ra,40000344 <print>
	print("Briey SoC on FPGA\r\n");
40000404:	400007b7          	lui	a5,0x40000
40000408:	6e078513          	addi	a0,a5,1760 # 400006e0 <vga_simRes_h160_v120+0xd8>
4000040c:	f39ff0ef          	jal	ra,40000344 <print>
	
	int res;
	gpio_write(0x15,0);
40000410:	00000593          	li	a1,0
40000414:	01500513          	li	a0,21
40000418:	e25ff0ef          	jal	ra,4000023c <gpio_write>
	gpio_write(0x17,1);
4000041c:	00100593          	li	a1,1
40000420:	01700513          	li	a0,23
40000424:	e19ff0ef          	jal	ra,4000023c <gpio_write>
	gpio_write(0x35,2);
40000428:	00200593          	li	a1,2
4000042c:	03500513          	li	a0,53
40000430:	e0dff0ef          	jal	ra,4000023c <gpio_write>
	gpio_write(0x75,3);
40000434:	00300593          	li	a1,3
40000438:	07500513          	li	a0,117
4000043c:	e01ff0ef          	jal	ra,4000023c <gpio_write>

	res= gpio_read(0);
40000440:	00000513          	li	a0,0
40000444:	e5dff0ef          	jal	ra,400002a0 <gpio_read>
40000448:	fea42623          	sw	a0,-20(s0)
	res =gpio_read(1);
4000044c:	00100513          	li	a0,1
40000450:	e51ff0ef          	jal	ra,400002a0 <gpio_read>
40000454:	fea42623          	sw	a0,-20(s0)
	res =gpio_read(3);
40000458:	00300513          	li	a0,3
4000045c:	e45ff0ef          	jal	ra,400002a0 <gpio_read>
40000460:	fea42623          	sw	a0,-20(s0)
	res =gpio_read(2);
40000464:	00200513          	li	a0,2
40000468:	e39ff0ef          	jal	ra,400002a0 <gpio_read>
4000046c:	fea42623          	sw	a0,-20(s0)
	//reset
	GPIO_WRITE_N_BASE ->OUTPUT=1;
40000470:	f00047b7          	lui	a5,0xf0004
40000474:	00100713          	li	a4,1
40000478:	00e7a223          	sw	a4,4(a5) # f0004004 <_stack_start+0x700036c4>
	GPIO_READ_N_BASE ->OUTPUT=1;
4000047c:	f00037b7          	lui	a5,0xf0003
40000480:	00100713          	li	a4,1
40000484:	00e7a223          	sw	a4,4(a5) # f0003004 <_stack_start+0x700026c4>
	GPIO_ADDRESS_BASE ->OUTPUT=0;
40000488:	f00057b7          	lui	a5,0xf0005
4000048c:	0007a223          	sw	zero,4(a5) # f0005004 <_stack_start+0x700046c4>
	GPIO_DATA_BASE ->OUTPUT=0;
40000490:	f00067b7          	lui	a5,0xf0006
40000494:	0007a223          	sw	zero,4(a5) # f0006004 <_stack_start+0x700056c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=1;
40000498:	f00027b7          	lui	a5,0xf0002
4000049c:	00100713          	li	a4,1
400004a0:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=0;
400004a4:	f00027b7          	lui	a5,0xf0002
400004a8:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>

	//write 7 to address 0x1
	GPIO_ADDRESS_BASE ->OUTPUT=1;
400004ac:	f00057b7          	lui	a5,0xf0005
400004b0:	00100713          	li	a4,1
400004b4:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	GPIO_DATA_BASE ->OUTPUT=7;
400004b8:	f00067b7          	lui	a5,0xf0006
400004bc:	00700713          	li	a4,7
400004c0:	00e7a223          	sw	a4,4(a5) # f0006004 <_stack_start+0x700056c4>
	GPIO_WRITE_N_BASE ->OUTPUT=0;
400004c4:	f00047b7          	lui	a5,0xf0004
400004c8:	0007a223          	sw	zero,4(a5) # f0004004 <_stack_start+0x700036c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=1;
400004cc:	f00027b7          	lui	a5,0xf0002
400004d0:	00100713          	li	a4,1
400004d4:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=0;
400004d8:	f00027b7          	lui	a5,0xf0002
400004dc:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>

	//write 15 to address 0x3
	GPIO_ADDRESS_BASE ->OUTPUT=3;
400004e0:	f00057b7          	lui	a5,0xf0005
400004e4:	00300713          	li	a4,3
400004e8:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	GPIO_DATA_BASE ->OUTPUT=0x15;
400004ec:	f00067b7          	lui	a5,0xf0006
400004f0:	01500713          	li	a4,21
400004f4:	00e7a223          	sw	a4,4(a5) # f0006004 <_stack_start+0x700056c4>
	GPIO_WRITE_N_BASE ->OUTPUT=0;
400004f8:	f00047b7          	lui	a5,0xf0004
400004fc:	0007a223          	sw	zero,4(a5) # f0004004 <_stack_start+0x700036c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=1;
40000500:	f00027b7          	lui	a5,0xf0002
40000504:	00100713          	li	a4,1
40000508:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=0;
4000050c:	f00027b7          	lui	a5,0xf0002
40000510:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>

	//read data from 0x1
	GPIO_ADDRESS_BASE ->OUTPUT=1;
40000514:	f00057b7          	lui	a5,0xf0005
40000518:	00100713          	li	a4,1
4000051c:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	GPIO_WRITE_N_BASE ->OUTPUT=1;
40000520:	f00047b7          	lui	a5,0xf0004
40000524:	00100713          	li	a4,1
40000528:	00e7a223          	sw	a4,4(a5) # f0004004 <_stack_start+0x700036c4>
	GPIO_READ_N_BASE ->OUTPUT=0;
4000052c:	f00037b7          	lui	a5,0xf0003
40000530:	0007a223          	sw	zero,4(a5) # f0003004 <_stack_start+0x700026c4>
	res=GPIO_A_BASE->INPUT;
40000534:	f00007b7          	lui	a5,0xf0000
40000538:	0007a783          	lw	a5,0(a5) # f0000000 <_stack_start+0x6ffff6c0>
4000053c:	fef42623          	sw	a5,-20(s0)
	GPIO_CHIPSELECT_BASE ->OUTPUT=1;
40000540:	f00027b7          	lui	a5,0xf0002
40000544:	00100713          	li	a4,1
40000548:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=0;
4000054c:	f00027b7          	lui	a5,0xf0002
40000550:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>

	//read data from 0x3
	GPIO_ADDRESS_BASE ->OUTPUT=3;
40000554:	f00057b7          	lui	a5,0xf0005
40000558:	00300713          	li	a4,3
4000055c:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	GPIO_WRITE_N_BASE ->OUTPUT=1;
40000560:	f00047b7          	lui	a5,0xf0004
40000564:	00100713          	li	a4,1
40000568:	00e7a223          	sw	a4,4(a5) # f0004004 <_stack_start+0x700036c4>
	GPIO_READ_N_BASE ->OUTPUT=0;
4000056c:	f00037b7          	lui	a5,0xf0003
40000570:	0007a223          	sw	zero,4(a5) # f0003004 <_stack_start+0x700026c4>
	res=GPIO_A_BASE->INPUT;
40000574:	f00007b7          	lui	a5,0xf0000
40000578:	0007a783          	lw	a5,0(a5) # f0000000 <_stack_start+0x6ffff6c0>
4000057c:	fef42623          	sw	a5,-20(s0)
	GPIO_CHIPSELECT_BASE ->OUTPUT=1;
40000580:	f00027b7          	lui	a5,0xf0002
40000584:	00100713          	li	a4,1
40000588:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_CHIPSELECT_BASE ->OUTPUT=0;
4000058c:	f00027b7          	lui	a5,0xf0002
40000590:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>
	result[1]= vexriscv_aes_read(DATA_BASE_ADDRESS + 1);
	result[2]= vexriscv_aes_read(DATA_BASE_ADDRESS + 2);
	result[3]= vexriscv_aes_read(DATA_BASE_ADDRESS + 3);

	print("\r\n Result: \r\n");*/
	return 0;	
40000594:	00000793          	li	a5,0
}
40000598:	00078513          	mv	a0,a5
4000059c:	02c12083          	lw	ra,44(sp)
400005a0:	02812403          	lw	s0,40(sp)
400005a4:	03010113          	addi	sp,sp,48
400005a8:	00008067          	ret

400005ac <irqCallback>:


void irqCallback(){
400005ac:	ff010113          	addi	sp,sp,-16
400005b0:	00812623          	sw	s0,12(sp)
400005b4:	01010413          	addi	s0,sp,16

}
400005b8:	00000013          	nop
400005bc:	00c12403          	lw	s0,12(sp)
400005c0:	01010113          	addi	sp,sp,16
400005c4:	00008067          	ret
