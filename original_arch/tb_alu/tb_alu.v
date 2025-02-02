//`timescale 1ns

module tb_alu ();

   wire CLK_i;
   wire [31:0] A;
   wire [31:0] B;
   wire [6:0] OPCODE;
   wire [2:0] FUNCT3;
   wire ZER0;

   wire ALU_SRC1;
   wire SEL_MUX_JAL_AUIPC;
   wire	REG_WRITE;
   wire MEM_WRITE;
   wire MEM_READ;
   wire BRANCH;
   wire SEL_MUX_ADD_SUM;
   wire [1:0] MEM_TO_REG;
   wire [1:0] ALU_OP;

   wire [31:0] DATA_OUT;
   wire [2:0] CTRL;



   clk_gen CG(.CLK(CLK_i));


   data_maker SM(.CLK(CLK_i),
		.A(A),
        .B(B),
		.FUNCT3(FUNCT3),
		.OPCODE(OPCODE));


   alu ALU(.DATA_A(A),
		.DATA_B(B),
		.CTRL(CTRL),
		.ZERO(ZERO),
		.DATA_OUT(DATA_OUT));

   control CONTROL(.OPCODE(OPCODE),
		.ALU_SRC1(ALU_SRC1),
		.SEL_MUX_JAL_AUIPC(SEL_MUX_JAL_AUIPC),
		.REG_WRITE(REG_WRITE),
		.MEM_WRITE(MEM_WRITE),
		.MEM_READ(MEM_READ),
		.BRANCH(BRANCH),
		.SEL_MUX_ADD_SUM(SEL_MUX_ADD_SUM),
		.MEM_TO_REG(MEM_TO_REG),
		.ALU_OP(ALU_OP));

   alu_control ALU_CTRL(.FUNC3(FUNCT3),
		.ALU_OP(ALU_OP),
		.ALU_CTRL(CTRL));

data_sink DS(.CLK(CLK_i),
		.RES(DATA_OUT),
		.ALU_SRC1(ALU_SRC1),
		.SEL_MUX_JAL_AUIPC(SEL_MUX_JAL_AUIPC),
		.REG_WRITE(REG_WRITE),
		.MEM_WRITE(MEM_WRITE),
		.MEM_READ(MEM_READ),
		.BRANCH(BRANCH),
		.SEL_MUX_ADD_SUM(SEL_MUX_ADD_SUM),
		.MEM_TO_REG(MEM_TO_REG),
		.ZERO(ZERO));

endmodule
