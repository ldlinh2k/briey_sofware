#pragma once

#include "riscv.h"

#define ALU_add(rs1,rs2) opcode_R(0x2B,0x7,0x0,rs1,rs2)
#define ALU_sub(rs1,rs2) opcode_R(0x2B,0x7,0x1,rs1,rs2)

#define mem16x32_write(rs1,rs2) opcode_R(0xB,0x2,0x1,rs1,rs2)
#define mem16x32_read(rs1,rs2) opcode_R(0xB,0x2,0x0,rs1,rs2)

#define avalon_read(rs1, rs2) opcode_R(CUSTOM1, 0x2, 0x00, rs1, rs2)
#define avalon_write(rs1, rs2) opcode_R(CUSTOM1, 0x2, 0x01, rs1, rs2)

#define avalon_test_read_ins(rs1, rs2) opcode_R(CUSTOM1, 0x1, 0x0A, rs1, rs2)
#define avalon_test_write_ins(rs1, rs2) opcode_R(CUSTOM1, 0x1, 0x0B, rs1, rs2)

#define sub_8_bits_ins(rs1,rs2) opcode_R(CUSTOM1,0x1,0x07,rs1,rs2)
#define con_cate_bits_ins(rs1,rs2) opcode_R(CUSTOM1,0x1,0x08,rs1,rs2)
#define con_cate_bits_with_clock_ins(rs1,rs2) opcode_R(CUSTOM1,0x1,0x09,rs1,rs2)

static inline __attribute__((always_inline)) void mem16x32_write_func(int iData,int iAddress)   {
     mem16x32_write(iData,iAddress);
}

static inline __attribute__((always_inline))  int mem16x32_read_func(int iAddress)   {
    return mem16x32_read(0x00,iAddress);
}
static inline __attribute__((always_inline)) int avalon_test_write_func(int iData,int iAddress)   {
    return avalon_test_write_ins(iData,iAddress);
}

static inline __attribute__((always_inline)) int avalon_test_read_func(int iAddress)   {
   return avalon_test_read_ins(0x00,iAddress);
}

static inline __attribute__((always_inline)) int vexriscv_aes_write(int iData,int iAddress)   {
    return avalon_write(iData,iAddress);
}

static inline __attribute__((always_inline)) int vexriscv_aes_read(int iAddress)   {
   return avalon_read(0x00,iAddress);
}

static inline __attribute__((always_inline)) int sub_8_bits_func(int numberA,int numberB)   {
   return sub_8_bits_ins(numberA,numberB);
}

static inline __attribute__((always_inline)) int con_cate_bits_func(int numberA,int numberB)   {
   return con_cate_bits_ins(numberA,numberB);
}
static inline __attribute__((always_inline)) int con_cate_bits_with_clock_func(int numberA,int numberB)   {
   return con_cate_bits_with_clock_ins(numberA,numberB);
}

