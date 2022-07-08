
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
80000068:	638080e7          	jalr	1592(ra) # 4000069c <irqCallback>
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
800000b8:	f3418193          	addi	gp,gp,-204 # 40000fe8 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0000517          	auipc	a0,0xc0000
800000c8:	72450513          	addi	a0,a0,1828 # 400007e8 <data>
  la a1, _bss_end
800000cc:	80818593          	addi	a1,gp,-2040 # 400007f0 <_bss_end>

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
800000e4:	70450513          	addi	a0,a0,1796 # 400007e4 <_ctors_end>
  addi sp,sp,-4
800000e8:	ffc10113          	addi	sp,sp,-4

800000ec <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000ec:	c0000597          	auipc	a1,0xc0000
800000f0:	6f858593          	addi	a1,a1,1784 # 400007e4 <_ctors_end>
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
80000130:	25c080e7          	jalr	604(ra) # 40000388 <main>

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

4000023c <aes_gpio_write>:
#define DATA_BASE_ADDRESS 0x10
#define DATA_READY_ADDRESS 0x14
#define RESET_EXTERNAL_ADDRESS 0x18

void aes_gpio_write(int iData, int iAddress)
{
4000023c:	fe010113          	addi	sp,sp,-32
40000240:	00812e23          	sw	s0,28(sp)
40000244:	02010413          	addi	s0,sp,32
40000248:	fea42623          	sw	a0,-20(s0)
4000024c:	feb42423          	sw	a1,-24(s0)
	GPIO_CHIPSELECT_N_BASE->OUTPUT=0;
40000250:	f00027b7          	lui	a5,0xf0002
40000254:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_WRITE_N_BASE->OUTPUT=0;
40000258:	f00037b7          	lui	a5,0xf0003
4000025c:	0007a223          	sw	zero,4(a5) # f0003004 <_stack_start+0x700026c4>
	GPIO_READ_N_BASE->OUTPUT=1;
40000260:	f00047b7          	lui	a5,0xf0004
40000264:	00100713          	li	a4,1
40000268:	00e7a223          	sw	a4,4(a5) # f0004004 <_stack_start+0x700036c4>
	GPIO_ADDRESS_BASE->OUTPUT=iAddress;
4000026c:	f00057b7          	lui	a5,0xf0005
40000270:	fe842703          	lw	a4,-24(s0)
40000274:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	GPIO_DATA_BASE->OUTPUT =iData;
40000278:	f00067b7          	lui	a5,0xf0006
4000027c:	fec42703          	lw	a4,-20(s0)
40000280:	00e7a223          	sw	a4,4(a5) # f0006004 <_stack_start+0x700056c4>
}
40000284:	00000013          	nop
40000288:	01c12403          	lw	s0,28(sp)
4000028c:	02010113          	addi	sp,sp,32
40000290:	00008067          	ret

40000294 <aes_gpio_read>:
int aes_gpio_read(int iAddress)
{
40000294:	fd010113          	addi	sp,sp,-48
40000298:	02812623          	sw	s0,44(sp)
4000029c:	03010413          	addi	s0,sp,48
400002a0:	fca42e23          	sw	a0,-36(s0)
	GPIO_CHIPSELECT_N_BASE->OUTPUT=0;
400002a4:	f00027b7          	lui	a5,0xf0002
400002a8:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_WRITE_N_BASE->OUTPUT=1;
400002ac:	f00037b7          	lui	a5,0xf0003
400002b0:	00100713          	li	a4,1
400002b4:	00e7a223          	sw	a4,4(a5) # f0003004 <_stack_start+0x700026c4>
	GPIO_READ_N_BASE->OUTPUT=0;
400002b8:	f00047b7          	lui	a5,0xf0004
400002bc:	0007a223          	sw	zero,4(a5) # f0004004 <_stack_start+0x700036c4>
	GPIO_ADDRESS_BASE->OUTPUT=iAddress;
400002c0:	f00057b7          	lui	a5,0xf0005
400002c4:	fdc42703          	lw	a4,-36(s0)
400002c8:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	int res = GPIO_OUTPUT_DATA_BASE->INPUT;
400002cc:	f00077b7          	lui	a5,0xf0007
400002d0:	0007a783          	lw	a5,0(a5) # f0007000 <_stack_start+0x700066c0>
400002d4:	fef42623          	sw	a5,-20(s0)
	return GPIO_OUTPUT_DATA_BASE->INPUT;
400002d8:	f00077b7          	lui	a5,0xf0007
400002dc:	0007a783          	lw	a5,0(a5) # f0007000 <_stack_start+0x700066c0>
}
400002e0:	00078513          	mv	a0,a5
400002e4:	02c12403          	lw	s0,44(sp)
400002e8:	03010113          	addi	sp,sp,48
400002ec:	00008067          	ret

400002f0 <freeTime>:
void freeTime()
{
400002f0:	ff010113          	addi	sp,sp,-16
400002f4:	00812623          	sw	s0,12(sp)
400002f8:	01010413          	addi	s0,sp,16
	GPIO_CHIPSELECT_N_BASE->OUTPUT=1;
400002fc:	f00027b7          	lui	a5,0xf0002
40000300:	00100713          	li	a4,1
40000304:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_WRITE_N_BASE->OUTPUT=1;
40000308:	f00037b7          	lui	a5,0xf0003
4000030c:	00100713          	li	a4,1
40000310:	00e7a223          	sw	a4,4(a5) # f0003004 <_stack_start+0x700026c4>
	GPIO_READ_N_BASE->OUTPUT=1;
40000314:	f00047b7          	lui	a5,0xf0004
40000318:	00100713          	li	a4,1
4000031c:	00e7a223          	sw	a4,4(a5) # f0004004 <_stack_start+0x700036c4>
}
40000320:	00000013          	nop
40000324:	00c12403          	lw	s0,12(sp)
40000328:	01010113          	addi	sp,sp,16
4000032c:	00008067          	ret

40000330 <print>:
void print(char *str){
40000330:	fe010113          	addi	sp,sp,-32
40000334:	00112e23          	sw	ra,28(sp)
40000338:	00812c23          	sw	s0,24(sp)
4000033c:	02010413          	addi	s0,sp,32
40000340:	fea42623          	sw	a0,-20(s0)
	while(*str){
40000344:	0200006f          	j	40000364 <print+0x34>
		uart_write(UART,*(str++));
40000348:	fec42783          	lw	a5,-20(s0)
4000034c:	00178713          	addi	a4,a5,1
40000350:	fee42623          	sw	a4,-20(s0)
40000354:	0007c783          	lbu	a5,0(a5)
40000358:	00078593          	mv	a1,a5
4000035c:	f0010537          	lui	a0,0xf0010
40000360:	d81ff0ef          	jal	ra,400000e0 <uart_write>
	while(*str){
40000364:	fec42783          	lw	a5,-20(s0)
40000368:	0007c783          	lbu	a5,0(a5)
4000036c:	fc079ee3          	bnez	a5,40000348 <print+0x18>
	}
}
40000370:	00000013          	nop
40000374:	00000013          	nop
40000378:	01c12083          	lw	ra,28(sp)
4000037c:	01812403          	lw	s0,24(sp)
40000380:	02010113          	addi	sp,sp,32
40000384:	00008067          	ret

40000388 <main>:
unsigned int data;
unsigned int address;
int main() {
40000388:	f8010113          	addi	sp,sp,-128
4000038c:	06112e23          	sw	ra,124(sp)
40000390:	06812c23          	sw	s0,120(sp)
40000394:	08010413          	addi	s0,sp,128
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
40000398:	00800793          	li	a5,8
4000039c:	f8f42a23          	sw	a5,-108(s0)
	uartConfig.parity = NONE;
400003a0:	f8042c23          	sw	zero,-104(s0)
	uartConfig.stop = ONE;
400003a4:	f8042e23          	sw	zero,-100(s0)
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
400003a8:	03500793          	li	a5,53
400003ac:	faf42023          	sw	a5,-96(s0)
	uart_applyConfig(UART,&uartConfig);
400003b0:	f9440793          	addi	a5,s0,-108
400003b4:	00078593          	mv	a1,a5
400003b8:	f0010537          	lui	a0,0xf0010
400003bc:	d71ff0ef          	jal	ra,4000012c <uart_applyConfig>

	print("Well, hello there ! こんにちは。\r\n");
400003c0:	400007b7          	lui	a5,0x40000
400003c4:	71878513          	addi	a0,a5,1816 # 40000718 <vga_simRes_h160_v120+0x20>
400003c8:	f69ff0ef          	jal	ra,40000330 <print>
	print("University of Electro-Communications (UEC), Tokyo, Japan\r\n");
400003cc:	400007b7          	lui	a5,0x40000
400003d0:	74478513          	addi	a0,a5,1860 # 40000744 <vga_simRes_h160_v120+0x4c>
400003d4:	f5dff0ef          	jal	ra,40000330 <print>
	print("電気通信大学、東京都、日本\r\n");
400003d8:	400007b7          	lui	a5,0x40000
400003dc:	78078513          	addi	a0,a5,1920 # 40000780 <vga_simRes_h160_v120+0x88>
400003e0:	f51ff0ef          	jal	ra,40000330 <print>
	print("AES Accelerator - Duy Linh Le K18\r\n");
400003e4:	400007b7          	lui	a5,0x40000
400003e8:	7ac78513          	addi	a0,a5,1964 # 400007ac <vga_simRes_h160_v120+0xb4>
400003ec:	f45ff0ef          	jal	ra,40000330 <print>
	print("Briey SoC on FPGA\r\n");
400003f0:	400007b7          	lui	a5,0x40000
400003f4:	7d078513          	addi	a0,a5,2000 # 400007d0 <vga_simRes_h160_v120+0xd8>
400003f8:	f39ff0ef          	jal	ra,40000330 <print>
	


	//Test new instruction simple sub
	int a=0x39;
400003fc:	03900793          	li	a5,57
40000400:	fcf42c23          	sw	a5,-40(s0)
	int b=0x12;
40000404:	01200793          	li	a5,18
40000408:	fcf42a23          	sw	a5,-44(s0)
4000040c:	fd842783          	lw	a5,-40(s0)
40000410:	faf42423          	sw	a5,-88(s0)
40000414:	fd442783          	lw	a5,-44(s0)
40000418:	faf42223          	sw	a5,-92(s0)
static inline __attribute__((always_inline)) int sub_8_bits_func(int numberA,int numberB)   {
   return sub_8_bits_ins(numberA,numberB);
}

static inline __attribute__((always_inline)) int con_cate_bits_func(int numberA,int numberB)   {
   return con_cate_bits_ins(numberA,numberB);
4000041c:	fa842783          	lw	a5,-88(s0)
40000420:	fa442703          	lw	a4,-92(s0)
40000424:	10e797ab          	0x10e797ab
40000428:	00078093          	mv	ra,a5
4000042c:	00008793          	mv	a5,ra
	int result_con_cate=con_cate_bits_func(a,b);
40000430:	fcf42823          	sw	a5,-48(s0)
	int ALU_add1 = ALU_add(a,b);
40000434:	fd842783          	lw	a5,-40(s0)
40000438:	fd442703          	lw	a4,-44(s0)
4000043c:	00e7f7ab          	0xe7f7ab
40000440:	00078093          	mv	ra,a5
40000444:	00008793          	mv	a5,ra
40000448:	fcf42623          	sw	a5,-52(s0)
	int ALU_sub1= ALU_sub(a,b);
4000044c:	fd842783          	lw	a5,-40(s0)
40000450:	fd442703          	lw	a4,-44(s0)
40000454:	02e7f7ab          	0x2e7f7ab
40000458:	00078093          	mv	ra,a5
4000045c:	00008793          	mv	a5,ra
40000460:	fcf42423          	sw	a5,-56(s0)
	//int result_con_cate1=con_cate_bits_func(b,a);


	GPIO_A_BASE->OUTPUT=result_con_cate;
40000464:	f00007b7          	lui	a5,0xf0000
40000468:	fd042703          	lw	a4,-48(s0)
4000046c:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>
	int sw = GPIO_A_BASE ->INPUT;
40000470:	f00007b7          	lui	a5,0xf0000
40000474:	0007a783          	lw	a5,0(a5) # f0000000 <_stack_start+0x6ffff6c0>
40000478:	fcf42223          	sw	a5,-60(s0)

	GPIO_CHIPSELECT_N_BASE->OUTPUT=1;
4000047c:	f00027b7          	lui	a5,0xf0002
40000480:	00100713          	li	a4,1
40000484:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_WRITE_N_BASE->OUTPUT=1;
40000488:	f00037b7          	lui	a5,0xf0003
4000048c:	00100713          	li	a4,1
40000490:	00e7a223          	sw	a4,4(a5) # f0003004 <_stack_start+0x700026c4>

	GPIO_ADDRESS_BASE->OUTPUT=0;
40000494:	f00057b7          	lui	a5,0xf0005
40000498:	0007a223          	sw	zero,4(a5) # f0005004 <_stack_start+0x700046c4>
	GPIO_DATA_BASE->OUTPUT=35;
4000049c:	f00067b7          	lui	a5,0xf0006
400004a0:	02300713          	li	a4,35
400004a4:	00e7a223          	sw	a4,4(a5) # f0006004 <_stack_start+0x700056c4>

	GPIO_ADDRESS_BASE->OUTPUT=1;
400004a8:	f00057b7          	lui	a5,0xf0005
400004ac:	00100713          	li	a4,1
400004b0:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	GPIO_DATA_BASE->OUTPUT=25;
400004b4:	f00067b7          	lui	a5,0xf0006
400004b8:	01900713          	li	a4,25
400004bc:	00e7a223          	sw	a4,4(a5) # f0006004 <_stack_start+0x700056c4>

	GPIO_CHIPSELECT_N_BASE->OUTPUT=0;
400004c0:	f00027b7          	lui	a5,0xf0002
400004c4:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>

	for(int i=0;i<10;i++)
400004c8:	fe042423          	sw	zero,-24(s0)
400004cc:	0300006f          	j	400004fc <main+0x174>
	{
		for(int j=0;j<32768;j++);
400004d0:	fe042223          	sw	zero,-28(s0)
400004d4:	0100006f          	j	400004e4 <main+0x15c>
400004d8:	fe442783          	lw	a5,-28(s0)
400004dc:	00178793          	addi	a5,a5,1
400004e0:	fef42223          	sw	a5,-28(s0)
400004e4:	fe442703          	lw	a4,-28(s0)
400004e8:	000087b7          	lui	a5,0x8
400004ec:	fef746e3          	blt	a4,a5,400004d8 <main+0x150>
	for(int i=0;i<10;i++)
400004f0:	fe842783          	lw	a5,-24(s0)
400004f4:	00178793          	addi	a5,a5,1 # 8001 <_stack_size+0x7801>
400004f8:	fef42423          	sw	a5,-24(s0)
400004fc:	fe842703          	lw	a4,-24(s0)
40000500:	00900793          	li	a5,9
40000504:	fce7d6e3          	bge	a5,a4,400004d0 <main+0x148>
	}
	GPIO_CHIPSELECT_N_BASE->OUTPUT=1;
40000508:	f00027b7          	lui	a5,0xf0002
4000050c:	00100713          	li	a4,1
40000510:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	GPIO_WRITE_N_BASE->OUTPUT=0;
40000514:	f00037b7          	lui	a5,0xf0003
40000518:	0007a223          	sw	zero,4(a5) # f0003004 <_stack_start+0x700026c4>
	for(int i=0;i<10;i++)
4000051c:	fe042023          	sw	zero,-32(s0)
40000520:	0300006f          	j	40000550 <main+0x1c8>
	{
		for(int j=0;j<32768;j++);
40000524:	fc042e23          	sw	zero,-36(s0)
40000528:	0100006f          	j	40000538 <main+0x1b0>
4000052c:	fdc42783          	lw	a5,-36(s0)
40000530:	00178793          	addi	a5,a5,1
40000534:	fcf42e23          	sw	a5,-36(s0)
40000538:	fdc42703          	lw	a4,-36(s0)
4000053c:	000087b7          	lui	a5,0x8
40000540:	fef746e3          	blt	a4,a5,4000052c <main+0x1a4>
	for(int i=0;i<10;i++)
40000544:	fe042783          	lw	a5,-32(s0)
40000548:	00178793          	addi	a5,a5,1 # 8001 <_stack_size+0x7801>
4000054c:	fef42023          	sw	a5,-32(s0)
40000550:	fe042703          	lw	a4,-32(s0)
40000554:	00900793          	li	a5,9
40000558:	fce7d6e3          	bge	a5,a4,40000524 <main+0x19c>
	}
	GPIO_ADDRESS_BASE->OUTPUT=1;
4000055c:	f00057b7          	lui	a5,0xf0005
40000560:	00100713          	li	a4,1
40000564:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	int result1 = GPIO_OUTPUT_DATA_BASE->INPUT;
40000568:	f00077b7          	lui	a5,0xf0007
4000056c:	0007a783          	lw	a5,0(a5) # f0007000 <_stack_start+0x700066c0>
40000570:	fcf42023          	sw	a5,-64(s0)

	GPIO_ADDRESS_BASE->OUTPUT=1;
40000574:	f00057b7          	lui	a5,0xf0005
40000578:	00100713          	li	a4,1
4000057c:	00e7a223          	sw	a4,4(a5) # f0005004 <_stack_start+0x700046c4>
	result1 = GPIO_OUTPUT_DATA_BASE->INPUT;
40000580:	f00077b7          	lui	a5,0xf0007
40000584:	0007a783          	lw	a5,0(a5) # f0007000 <_stack_start+0x700066c0>
40000588:	fcf42023          	sw	a5,-64(s0)


	GPIO_DATA_BASE->OUTPUT=12;
4000058c:	f00067b7          	lui	a5,0xf0006
40000590:	00c00713          	li	a4,12
40000594:	00e7a223          	sw	a4,4(a5) # f0006004 <_stack_start+0x700056c4>
	GPIO_WRITE_N_BASE->OUTPUT=0;
40000598:	f00037b7          	lui	a5,0xf0003
4000059c:	0007a223          	sw	zero,4(a5) # f0003004 <_stack_start+0x700026c4>

	GPIO_WRITE_N_BASE->OUTPUT=1;
400005a0:	f00037b7          	lui	a5,0xf0003
400005a4:	00100713          	li	a4,1
400005a8:	00e7a223          	sw	a4,4(a5) # f0003004 <_stack_start+0x700026c4>
	GPIO_READ_N_BASE->OUTPUT=0;
400005ac:	f00047b7          	lui	a5,0xf0004
400005b0:	0007a223          	sw	zero,4(a5) # f0004004 <_stack_start+0x700036c4>

	int res=GPIO_OUTPUT_DATA_BASE->INPUT;
400005b4:	f00077b7          	lui	a5,0xf0007
400005b8:	0007a783          	lw	a5,0(a5) # f0007000 <_stack_start+0x700066c0>
400005bc:	faf42e23          	sw	a5,-68(s0)

	GPIO_READ_N_BASE->OUTPUT=0;
400005c0:	f00047b7          	lui	a5,0xf0004
400005c4:	0007a223          	sw	zero,4(a5) # f0004004 <_stack_start+0x700036c4>
	res=GPIO_OUTPUT_DATA_BASE->INPUT;
400005c8:	f00077b7          	lui	a5,0xf0007
400005cc:	0007a783          	lw	a5,0(a5) # f0007000 <_stack_start+0x700066c0>
400005d0:	faf42e23          	sw	a5,-68(s0)
	GPIO_DATA_BASE->OUTPUT=34;
400005d4:	f00067b7          	lui	a5,0xf0006
400005d8:	02200713          	li	a4,34
400005dc:	00e7a223          	sw	a4,4(a5) # f0006004 <_stack_start+0x700056c4>
	res=GPIO_OUTPUT_DATA_BASE->INPUT;
400005e0:	f00077b7          	lui	a5,0xf0007
400005e4:	0007a783          	lw	a5,0(a5) # f0007000 <_stack_start+0x700066c0>
400005e8:	faf42e23          	sw	a5,-68(s0)
	aes_gpio_write(0x123,0);
400005ec:	00000593          	li	a1,0
400005f0:	12300513          	li	a0,291
400005f4:	c49ff0ef          	jal	ra,4000023c <aes_gpio_write>
	aes_gpio_write(0x456,1);
400005f8:	00100593          	li	a1,1
400005fc:	45600513          	li	a0,1110
40000600:	c3dff0ef          	jal	ra,4000023c <aes_gpio_write>
	aes_gpio_write(0x789,2);
40000604:	00200593          	li	a1,2
40000608:	78900513          	li	a0,1929
4000060c:	c31ff0ef          	jal	ra,4000023c <aes_gpio_write>
	aes_gpio_write(0x10,3);
40000610:	00300593          	li	a1,3
40000614:	01000513          	li	a0,16
40000618:	c25ff0ef          	jal	ra,4000023c <aes_gpio_write>

	int res1=aes_gpio_read(0);
4000061c:	00000513          	li	a0,0
40000620:	c75ff0ef          	jal	ra,40000294 <aes_gpio_read>
40000624:	faa42c23          	sw	a0,-72(s0)
	int res2=aes_gpio_read(1);
40000628:	00100513          	li	a0,1
4000062c:	c69ff0ef          	jal	ra,40000294 <aes_gpio_read>
40000630:	faa42a23          	sw	a0,-76(s0)
	int res3=aes_gpio_read(2);
40000634:	00200513          	li	a0,2
40000638:	c5dff0ef          	jal	ra,40000294 <aes_gpio_read>
4000063c:	faa42823          	sw	a0,-80(s0)
	int res4=aes_gpio_read(3);
40000640:	00300513          	li	a0,3
40000644:	c51ff0ef          	jal	ra,40000294 <aes_gpio_read>
40000648:	faa42623          	sw	a0,-84(s0)
for(int i=0;i<100;i++)
4000064c:	fe042623          	sw	zero,-20(s0)
40000650:	01c0006f          	j	4000066c <main+0x2e4>
{
	GPIO_A_BASE->OUTPUT=i;
40000654:	f00007b7          	lui	a5,0xf0000
40000658:	fec42703          	lw	a4,-20(s0)
4000065c:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>
for(int i=0;i<100;i++)
40000660:	fec42783          	lw	a5,-20(s0)
40000664:	00178793          	addi	a5,a5,1
40000668:	fef42623          	sw	a5,-20(s0)
4000066c:	fec42703          	lw	a4,-20(s0)
40000670:	06300793          	li	a5,99
40000674:	fee7d0e3          	bge	a5,a4,40000654 <main+0x2cc>
}
while(1)
{
	GPIO_A_BASE->OUTPUT=GPIO_A_BASE->OUTPUT_ENABLE;
40000678:	f0000737          	lui	a4,0xf0000
4000067c:	f00007b7          	lui	a5,0xf0000
40000680:	00872703          	lw	a4,8(a4) # f0000008 <_stack_start+0x6ffff6c8>
40000684:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>
	GPIO_B_BASE->OUTPUT=GPIO_B_BASE->OUTPUT_ENABLE;
40000688:	f0001737          	lui	a4,0xf0001
4000068c:	f00017b7          	lui	a5,0xf0001
40000690:	00872703          	lw	a4,8(a4) # f0001008 <_stack_start+0x700006c8>
40000694:	00e7a223          	sw	a4,4(a5) # f0001004 <_stack_start+0x700006c4>
	GPIO_A_BASE->OUTPUT=GPIO_A_BASE->OUTPUT_ENABLE;
40000698:	fe1ff06f          	j	40000678 <main+0x2f0>

4000069c <irqCallback>:
	print("\r\n Result: \r\n");*/
	return 0;	
}


void irqCallback(){
4000069c:	ff010113          	addi	sp,sp,-16
400006a0:	00812623          	sw	s0,12(sp)
400006a4:	01010413          	addi	s0,sp,16

}
400006a8:	00000013          	nop
400006ac:	00c12403          	lw	s0,12(sp)
400006b0:	01010113          	addi	sp,sp,16
400006b4:	00008067          	ret
