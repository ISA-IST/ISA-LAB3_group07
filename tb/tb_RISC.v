//`timescale 1ns

module tb_alu ();

   wire CLK_i;
   wire RST_n;
   wire [31:0] INSTR_i;
   wire [31:0] DM_data_i;
   wire [31:0] PC_i;
   wire [31:0] DM_addr;
   wire WRITE_DATA_OUT_i;
   wire MEM_WRITE_OUT_i;
   wire MEM_READ_OUT_i;


   clk_gen CG(.CLK(CLK_i),
    .RST_n(RST_n));

   RISC_V RV(.CLK(CLK_i),
    .RST_n(RST_n),
    .INSTR(INSTR_i),
    .DM_data(DM_data_i),
    .PC(PC_i),
    .DM_addr(DM_addr_i),
    .WRITE_DATA_OUT(WRITE_DATA_OUT_i),
    .MEM_WRITE_OUT(MEM_WRITE_OUT_i),
    .MEM_READ_OUT(MEM_READ_OUT_i));

  instruction_memory IM(.CLK(CLK_i),
    .ADDR(PC_i),
		.DATA_OUT(INSTR_i));

  data_memory DM(.CLK(CLK_i),
    .RST_n(RST_n),
		.MEM_READ(MEM_READ_OUT_i),
    .MEM_WRITE(MEM_WRITE_OUT_i),
    .ADDR(DM_addr_i),
    .WRITE_DATA(WRITE_DATA_OUT_i),
    .DATA_OUT(DM_data_i));


endmodule
