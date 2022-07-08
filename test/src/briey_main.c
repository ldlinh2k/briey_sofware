#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>
#include "aes_custom.h"
#include "aes_custom_riscv.h"

#define EN_OR_DE_ADDRESS 0x04
#define PLAIN_TEXT_BASE_ADDRESS 0x0C
#define IKEY_BASE_ADDRESS 0x08
#define START_BASE_ADDRESS 0x01
#define DATA_BASE_ADDRESS 0x10
#define DATA_READY_ADDRESS 0x14
#define RESET_EXTERNAL_ADDRESS 0x18

void aes_gpio_write(int iData, int iAddress)
{
	GPIO_CHIPSELECT_N_BASE->OUTPUT=0;
	GPIO_WRITE_N_BASE->OUTPUT=0;
	GPIO_READ_N_BASE->OUTPUT=1;
	GPIO_ADDRESS_BASE->OUTPUT=iAddress;
	GPIO_DATA_BASE->OUTPUT =iData;
}
int aes_gpio_read(int iAddress)
{
	GPIO_CHIPSELECT_N_BASE->OUTPUT=0;
	GPIO_WRITE_N_BASE->OUTPUT=1;
	GPIO_READ_N_BASE->OUTPUT=0;
	GPIO_ADDRESS_BASE->OUTPUT=iAddress;
	int res = GPIO_OUTPUT_DATA_BASE->INPUT;
	return GPIO_OUTPUT_DATA_BASE->INPUT;
}
void freeTime()
{
	GPIO_CHIPSELECT_N_BASE->OUTPUT=1;
	GPIO_WRITE_N_BASE->OUTPUT=1;
	GPIO_READ_N_BASE->OUTPUT=1;
}
void print(char *str){
	while(*str){
		uart_write(UART,*(str++));
	}
}
unsigned int data;
unsigned int address;
int main() {
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
	uartConfig.parity = NONE;
	uartConfig.stop = ONE;
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
	uart_applyConfig(UART,&uartConfig);

	print("Well, hello there ! こんにちは。\r\n");
	print("University of Electro-Communications (UEC), Tokyo, Japan\r\n");
	print("電気通信大学、東京都、日本\r\n");
	print("AES Accelerator - Duy Linh Le K18\r\n");
	print("Briey SoC on FPGA\r\n");
	


	//Test new instruction simple sub
	int a=0x39;
	int b=0x12;
	int result_con_cate=con_cate_bits_func(a,b);
	int ALU_add1 = ALU_add(a,b);
	int ALU_sub1= ALU_sub(a,b);
	//int result_con_cate1=con_cate_bits_func(b,a);


	GPIO_A_BASE->OUTPUT=result_con_cate;
	int sw = GPIO_A_BASE ->INPUT;

	GPIO_CHIPSELECT_N_BASE->OUTPUT=1;
	GPIO_WRITE_N_BASE->OUTPUT=1;

	GPIO_ADDRESS_BASE->OUTPUT=0;
	GPIO_DATA_BASE->OUTPUT=35;

	GPIO_ADDRESS_BASE->OUTPUT=1;
	GPIO_DATA_BASE->OUTPUT=25;

	GPIO_CHIPSELECT_N_BASE->OUTPUT=0;

	for(int i=0;i<10;i++)
	{
		for(int j=0;j<32768;j++);
	}
	GPIO_CHIPSELECT_N_BASE->OUTPUT=1;
	GPIO_WRITE_N_BASE->OUTPUT=0;
	for(int i=0;i<10;i++)
	{
		for(int j=0;j<32768;j++);
	}
	GPIO_ADDRESS_BASE->OUTPUT=1;
	int result1 = GPIO_OUTPUT_DATA_BASE->INPUT;

	GPIO_ADDRESS_BASE->OUTPUT=1;
	result1 = GPIO_OUTPUT_DATA_BASE->INPUT;


	GPIO_DATA_BASE->OUTPUT=12;
	GPIO_WRITE_N_BASE->OUTPUT=0;

	GPIO_WRITE_N_BASE->OUTPUT=1;
	GPIO_READ_N_BASE->OUTPUT=0;

	int res=GPIO_OUTPUT_DATA_BASE->INPUT;

	GPIO_READ_N_BASE->OUTPUT=0;
	res=GPIO_OUTPUT_DATA_BASE->INPUT;
	GPIO_DATA_BASE->OUTPUT=34;
	res=GPIO_OUTPUT_DATA_BASE->INPUT;
	aes_gpio_write(0x123,0);
	aes_gpio_write(0x456,1);
	aes_gpio_write(0x789,2);
	aes_gpio_write(0x10,3);

	int res1=aes_gpio_read(0);
	int res2=aes_gpio_read(1);
	int res3=aes_gpio_read(2);
	int res4=aes_gpio_read(3);
for(int i=0;i<100;i++)
{
	GPIO_A_BASE->OUTPUT=i;
}
while(1)
{
	GPIO_A_BASE->OUTPUT=GPIO_A_BASE->OUTPUT_ENABLE;
	GPIO_B_BASE->OUTPUT=GPIO_B_BASE->OUTPUT_ENABLE;
}
while(1)
{


	 res1=aes_gpio_read(0);
		 res2=aes_gpio_read(1);
		 res3=aes_gpio_read(2);
		 res4=aes_gpio_read(3);

}

	//2. write LeDuyLinh DESLAB to plainText
		aes_gpio_write(0x4C654475,PLAIN_TEXT_BASE_ADDRESS + 0);
		freeTime();
		aes_gpio_write(0x794C696E,PLAIN_TEXT_BASE_ADDRESS + 1);
		freeTime();
		aes_gpio_write(0x68204445,PLAIN_TEXT_BASE_ADDRESS + 2);
		freeTime();
		aes_gpio_write(0x534C4142,PLAIN_TEXT_BASE_ADDRESS + 3);
		freeTime();
		//3.write aesEncyptionKey to iKey
		aes_gpio_write(0x61657345,IKEY_BASE_ADDRESS + 0);
		freeTime();
		aes_gpio_write(0x6E637279,IKEY_BASE_ADDRESS + 1);
		freeTime();
		aes_gpio_write(0x7074696F,IKEY_BASE_ADDRESS + 2);
		freeTime();
		aes_gpio_write(0x6E4B6579,IKEY_BASE_ADDRESS + 3);
		freeTime();

		//4.write 1 to iStart
		aes_gpio_write(1,START_BASE_ADDRESS);
		freeTime();

		//wait
		while(aes_gpio_read(DATA_BASE_ADDRESS)==0);
		freeTime();

		int result[4];
		result[0]= aes_gpio_read(DATA_BASE_ADDRESS + 0);
		freeTime();
		result[1]= aes_gpio_read(DATA_BASE_ADDRESS + 1);
		freeTime();
		result[2]= aes_gpio_read(DATA_BASE_ADDRESS + 2);
		freeTime();
		result[3]= aes_gpio_read(DATA_BASE_ADDRESS + 3);
		freeTime();

//	int result_sub;
//	result_sub=sub_8_bits_func(b,a);
//	int con_cate_bits_with_clock_res = con_cate_bits_with_clock_func(0x0,b);
//	int con_cate_bits_with_clock_res1 = con_cate_bits_with_clock_func(0x1,0x234);
//	int con_cate_bits_with_clock_res2 = con_cate_bits_with_clock_func(0x1,0x123);

//	 int iData1=0x1235;
//	 int iAddress1=0x00;
//	 int iData2=0x3333;
//	 int iAddress2=0x01;
//
//	mem16x32_write(iData1,iAddress1);
//	mem16x32_write(iData2,iAddress2);
//	 int mem1 = mem16x32_read(iData1,iAddress1);
//	 int mem2 = mem16x32_read(iData2,iAddress2);
//	unsigned int result;
//write 123 to address 0x0, 456 to address 0x1
//	data=123;
//	address=0x0;
//	avalon_test_write_ins(data,address);
//	data=456;
//	address=0x1;
//	avalon_test_write_ins(data,address);
//read data
//	address =0x0;
//	result=avalon_test_read_ins(0x0,address);
//	address =0x1;
//	result=avalon_test_read_ins(0x0,address);


	/*int con_cate_bits_res = con_cate_bits_func(a,b);

	int con_cate_bits_with_clock_res1 = con_cate_bits_with_clock_func(0x87651111,b);




	int t2=avalon_test_write_func(0x567,0x01);
	int avalon2 = avalon_test_read_func(0x01);

	int t3=avalon_test_write_func(0x96782,0x02);
	int avalon3 = avalon_test_read_func(0x00);

	int t4=avalon_test_write_func(0x54321,0x03);
	int avalon4 = avalon_test_read_func(0x01);
	//Encrypt:
	
	//1. write 1 to en_or_de
	vexriscv_aes_write(1,EN_OR_DE_ADDRESS);

	//2. write LeDuyLinh DESLAB to plainText
	int ts1= vexriscv_aes_write(0x4C654475,PLAIN_TEXT_BASE_ADDRESS + 0);
	int ts2 =vexriscv_aes_write(0x794C696E,PLAIN_TEXT_BASE_ADDRESS + 1);
	int ts3= vexriscv_aes_write(0x68204445,PLAIN_TEXT_BASE_ADDRESS + 2);
	int ts4=vexriscv_aes_write(0x534C4142,PLAIN_TEXT_BASE_ADDRESS + 3);
	int ts5 =vexriscv_aes_read(DATA_BASE_ADDRESS + 0);
	//3.write aesEncyptionKey to iKey
	vexriscv_aes_write(0x61657345,IKEY_BASE_ADDRESS + 0);
	vexriscv_aes_write(0x6E637279,IKEY_BASE_ADDRESS + 1);
	vexriscv_aes_write(0x7074696F,IKEY_BASE_ADDRESS + 2);
	vexriscv_aes_write(0x6E4B6579,IKEY_BASE_ADDRESS + 3);

	//4.write 1 to iStart
	vexriscv_aes_write(1,START_BASE_ADDRESS);

	//wait
	while(vexriscv_aes_read(DATA_BASE_ADDRESS)==0);
	
	int result[4];
	result[0]= vexriscv_aes_read(DATA_BASE_ADDRESS + 0);
	result[1]= vexriscv_aes_read(DATA_BASE_ADDRESS + 1);
	result[2]= vexriscv_aes_read(DATA_BASE_ADDRESS + 2);
	result[3]= vexriscv_aes_read(DATA_BASE_ADDRESS + 3);

	print("\r\n Result: \r\n");*/
	return 0;	
}


void irqCallback(){

}
