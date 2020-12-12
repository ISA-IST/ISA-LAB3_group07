//`timescale 1ns

module tb_MBE_encoder ();

   wire CLK_i;
   wire [31:0] A;
   wire [31:0] B;
   wire ZER0;
   wire [31:0] DATA_OUT;
   wire [2:0] ctrl;



   clk_gen CG(.CLK(CLK_i));


   data_maker SM(.CLK(CLK_i),
		 .A(A),
     .B(B),
		 .ctrl(ctrl));


   alu ALU(.DATA_A(A),
      .DATA_B(B),
      .CTRL(CTRL),
      .ZERO(ZERO),
      .DATA_OUT(DATA_OUT));


   data_sink DS(.CLK(CLK_i),
		.RES(DATA_OUT),
    .ZERO(ZERO));
    

endmodule
