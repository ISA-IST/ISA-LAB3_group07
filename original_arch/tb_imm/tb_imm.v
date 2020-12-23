//`timescale 1ns

module tb_imm ();

   wire CLK_i;
   wire [31:0] INSTR;
   wire [31:0] IMM_i;




   clk_gen CG(.CLK(CLK_i));


   data_maker SM(.CLK(CLK_i),
		 .instr(INSTR));


   imm_gen IG(.instr(INSTR),
		 .imm(IMM_i));


    data_sink DS(.CLK(CLK_i),
		  .imm(IMM_i));

endmodule
