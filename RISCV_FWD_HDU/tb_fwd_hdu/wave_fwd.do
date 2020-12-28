onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {ENTITY SIGNALS}
add wave -noupdate /tb_RISC/CLK_i
add wave -noupdate /tb_RISC/RST_n
add wave -noupdate -radix decimal /tb_RISC/INSTR_i
add wave -noupdate -radix decimal /tb_RISC/DM_data_i
add wave -noupdate -radix decimal /tb_RISC/PC_i
add wave -noupdate -radix decimal /tb_RISC/DM_addr_i
add wave -noupdate -radix decimal /tb_RISC/WRITE_DATA_OUT_i
add wave -noupdate /tb_RISC/MEM_WRITE_OUT_i
add wave -noupdate /tb_RISC/MEM_READ_OUT_i
add wave -noupdate -divider ID
add wave -noupdate -radix decimal /tb_RISC/RV/INSTR
add wave -noupdate -radix decimal -childformat {{/tb_RISC/RV/REG_FILES/RF(0) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(1) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(2) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(3) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(4) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(5) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(6) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(7) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(8) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(9) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(10) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(11) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(12) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(13) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(14) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(15) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(16) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(17) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(18) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(19) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(20) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(21) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(22) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(23) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(24) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(25) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(26) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(27) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(28) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(29) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(30) -radix decimal} {/tb_RISC/RV/REG_FILES/RF(31) -radix decimal}} -expand -subitemconfig {/tb_RISC/RV/REG_FILES/RF(0) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(1) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(2) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(3) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(4) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(5) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(6) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(7) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(8) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(9) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(10) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(11) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(12) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(13) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(14) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(15) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(16) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(17) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(18) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(19) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(20) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(21) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(22) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(23) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(24) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(25) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(26) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(27) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(28) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(29) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(30) {-height 17 -radix decimal} /tb_RISC/RV/REG_FILES/RF(31) {-height 17 -radix decimal}} /tb_RISC/RV/REG_FILES/RF
add wave -noupdate /tb_RISC/RV/REG_WRITE
add wave -noupdate /tb_RISC/RV/ALU_SRC
add wave -noupdate /tb_RISC/RV/MEM_WRITE
add wave -noupdate /tb_RISC/RV/MEM_READ
add wave -noupdate /tb_RISC/RV/BRANCH_cond
add wave -noupdate /tb_RISC/RV/BRANCH_uncond
add wave -noupdate /tb_RISC/RV/SEL_MUX_ADD_SUM
add wave -noupdate -format Literal /tb_RISC/RV/MEM_TO_REG
add wave -noupdate /tb_RISC/RV/ALU_OP
add wave -noupdate /tb_RISC/RV/ALU_SRC_1
add wave -noupdate -radix decimal /tb_RISC/RV/IMM
add wave -noupdate -radix decimal /tb_RISC/RV/PC_1
add wave -noupdate -radix decimal /tb_RISC/RV/NEXT_PC_1
add wave -noupdate -divider EXE
add wave -noupdate -radix decimal /tb_RISC/RV/READ_DATA1
add wave -noupdate -radix decimal /tb_RISC/RV/READ_DATA2
add wave -noupdate -radix decimal /tb_RISC/RV/NEXT_PC_2
add wave -noupdate /tb_RISC/RV/MEM_WRITE_1
add wave -noupdate /tb_RISC/RV/MEM_READ_1
add wave -noupdate /tb_RISC/RV/REG_WRITE_1
add wave -noupdate /tb_RISC/RV/BRANCH_cond_1
add wave -noupdate /tb_RISC/RV/BRANCH_uncond_1
add wave -noupdate -format Literal /tb_RISC/RV/MEM_TO_REG_1
add wave -noupdate /tb_RISC/RV/SEL_MUX_ADD_SUM_1
add wave -noupdate -radix decimal /tb_RISC/RV/IMM_1
add wave -noupdate -radix decimal /tb_RISC/RV/IMM_1_SHIFT
add wave -noupdate -radix decimal /tb_RISC/RV/PC_2
add wave -noupdate /tb_RISC/RV/ALU_OP_1
add wave -noupdate -radix decimal /tb_RISC/RV/OUT_MUX_ADD_SUM
add wave -noupdate -radix decimal /tb_RISC/RV/OUT_ADD_SUM
add wave -noupdate /tb_RISC/RV/ALU_CTRL
add wave -noupdate -radix decimal /tb_RISC/RV/DATA_B
add wave -noupdate -radix decimal /tb_RISC/RV/OUT_ALU
add wave -noupdate /tb_RISC/RV/ZERO
add wave -noupdate -divider MEM
add wave -noupdate -radix decimal /tb_RISC/RV/NEXT_PC_3
add wave -noupdate -radix decimal /tb_RISC/RV/OUT_ADD_SUM_1
add wave -noupdate /tb_RISC/RV/REG_WRITE_2
add wave -noupdate -radix decimal /tb_RISC/RV/IMM_2
add wave -noupdate -format Literal /tb_RISC/RV/MEM_TO_REG_2
add wave -noupdate /tb_RISC/RV/ZERO_1
add wave -noupdate /tb_RISC/RV/BRANCH_cond_2
add wave -noupdate /tb_RISC/RV/BRANCH_uncond_2
add wave -noupdate -divider WB
add wave -noupdate /tb_RISC/RV/REG_WRITE_3
add wave -noupdate -format Literal /tb_RISC/RV/MEM_TO_REG_3
add wave -noupdate -radix decimal /tb_RISC/RV/OUT_MUX_FIN
add wave -noupdate -radix decimal /tb_RISC/RV/DM_data
add wave -noupdate -divider PC_part
add wave -noupdate -radix decimal /tb_RISC/RV/PC
add wave -noupdate -radix decimal /tb_RISC/RV/DM_addr
add wave -noupdate -radix decimal /tb_RISC/RV/WRITE_DATA_OUT
add wave -noupdate /tb_RISC/RV/MEM_WRITE_OUT
add wave -noupdate /tb_RISC/RV/MEM_READ_OUT
add wave -noupdate -radix decimal /tb_RISC/RV/NEXT_PC
add wave -noupdate -radix decimal /tb_RISC/RV/OUT_MUX_PC1
add wave -noupdate -radix decimal /tb_RISC/RV/OUT_MUX_PC2
add wave -noupdate -radix decimal /tb_RISC/RV/FIRST_ADDRESS
add wave -noupdate /tb_RISC/RV/SEL_ADD
add wave -noupdate -radix decimal /tb_RISC/RV/PC_s
add wave -noupdate -radix decimal /tb_RISC/RV/DM_ADDR_s
add wave -noupdate -divider FWD
add wave -noupdate /tb_RISC/RV/forw_unit/RS_1
add wave -noupdate /tb_RISC/RV/forw_unit/RS_2
add wave -noupdate /tb_RISC/RV/forw_unit/RD_EX_MEM
add wave -noupdate /tb_RISC/RV/forw_unit/RD_MEM_WB
add wave -noupdate /tb_RISC/RV/forw_unit/REG_WRITE_EX_MEM
add wave -noupdate /tb_RISC/RV/forw_unit/REG_WRITE_MEM_WB
add wave -noupdate /tb_RISC/RV/forw_unit/FORW_A1
add wave -noupdate /tb_RISC/RV/forw_unit/FORW_A2
add wave -noupdate /tb_RISC/RV/forw_unit/FORW_B1
add wave -noupdate /tb_RISC/RV/forw_unit/FORW_B2
add wave -noupdate -divider OTHERS
add wave -noupdate /tb_RISC/RV/MUX_PC/I0
add wave -noupdate /tb_RISC/RV/MUX_PC/I1
add wave -noupdate /tb_RISC/RV/MUX_PC/SEL
add wave -noupdate /tb_RISC/RV/MUX_PC/O
add wave -noupdate /tb_RISC/RV/MUX_RESET/I0
add wave -noupdate /tb_RISC/RV/MUX_RESET/I1
add wave -noupdate /tb_RISC/RV/MUX_RESET/SEL
add wave -noupdate /tb_RISC/RV/MUX_RESET/O
add wave -noupdate /tb_RISC/RV/PC_REG/D
add wave -noupdate /tb_RISC/RV/PC_REG/CLK
add wave -noupdate /tb_RISC/RV/PC_REG/RST_n
add wave -noupdate /tb_RISC/RV/PC_REG/Q
add wave -noupdate /tb_RISC/RV/ID_1/D
add wave -noupdate /tb_RISC/RV/ID_1/CLK
add wave -noupdate /tb_RISC/RV/ID_1/RST_n
add wave -noupdate /tb_RISC/RV/ID_1/Q
add wave -noupdate /tb_RISC/RV/ID_2/D
add wave -noupdate /tb_RISC/RV/ID_2/CLK
add wave -noupdate /tb_RISC/RV/ID_2/RST_n
add wave -noupdate /tb_RISC/RV/ID_2/Q
add wave -noupdate /tb_RISC/RV/REG_FILES/DATA_IN
add wave -noupdate /tb_RISC/RV/REG_FILES/CLK
add wave -noupdate /tb_RISC/RV/REG_FILES/WR
add wave -noupdate /tb_RISC/RV/REG_FILES/ADDR_RD_1
add wave -noupdate /tb_RISC/RV/REG_FILES/ADDR_RD_2
add wave -noupdate /tb_RISC/RV/REG_FILES/ADDR_WR
add wave -noupdate /tb_RISC/RV/REG_FILES/DATA_OUT_1
add wave -noupdate /tb_RISC/RV/REG_FILES/DATA_OUT_2
add wave -noupdate /tb_RISC/RV/IMMED_GEN/instr
add wave -noupdate /tb_RISC/RV/IMMED_GEN/imm
add wave -noupdate /tb_RISC/RV/CONTR/OPCODE
add wave -noupdate /tb_RISC/RV/CONTR/ALU_SRC1
add wave -noupdate /tb_RISC/RV/CONTR/REG_WRITE
add wave -noupdate /tb_RISC/RV/CONTR/MEM_WRITE
add wave -noupdate /tb_RISC/RV/CONTR/MEM_READ
add wave -noupdate /tb_RISC/RV/CONTR/BRANCH_cond
add wave -noupdate /tb_RISC/RV/CONTR/BRANCH_uncond
add wave -noupdate /tb_RISC/RV/CONTR/SEL_MUX_ADD_SUM
add wave -noupdate -format Literal /tb_RISC/RV/CONTR/MEM_TO_REG
add wave -noupdate /tb_RISC/RV/CONTR/ALU_OP
add wave -noupdate /tb_RISC/RV/EX_2/D
add wave -noupdate /tb_RISC/RV/EX_2/CLK
add wave -noupdate /tb_RISC/RV/EX_2/RST_n
add wave -noupdate /tb_RISC/RV/EX_2/Q
add wave -noupdate /tb_RISC/RV/EX_3/D
add wave -noupdate /tb_RISC/RV/EX_3/CLK
add wave -noupdate /tb_RISC/RV/EX_3/RST_n
add wave -noupdate /tb_RISC/RV/EX_3/Q
add wave -noupdate /tb_RISC/RV/EX_4/D
add wave -noupdate /tb_RISC/RV/EX_4/CLK
add wave -noupdate /tb_RISC/RV/EX_4/RST_n
add wave -noupdate /tb_RISC/RV/EX_4/Q
add wave -noupdate /tb_RISC/RV/EX_5/D
add wave -noupdate /tb_RISC/RV/EX_5/CLK
add wave -noupdate /tb_RISC/RV/EX_5/RST_n
add wave -noupdate /tb_RISC/RV/EX_5/Q
add wave -noupdate /tb_RISC/RV/EX_6/D
add wave -noupdate /tb_RISC/RV/EX_6/CLK
add wave -noupdate /tb_RISC/RV/EX_6/RST_n
add wave -noupdate /tb_RISC/RV/EX_6/Q
add wave -noupdate /tb_RISC/RV/EX_7/D
add wave -noupdate /tb_RISC/RV/EX_7/CLK
add wave -noupdate /tb_RISC/RV/EX_7/RST_n
add wave -noupdate /tb_RISC/RV/EX_7/Q
add wave -noupdate /tb_RISC/RV/EX_8/D
add wave -noupdate /tb_RISC/RV/EX_8/CLK
add wave -noupdate /tb_RISC/RV/EX_8/RST_n
add wave -noupdate /tb_RISC/RV/EX_8/Q
add wave -noupdate /tb_RISC/RV/EX_9/D
add wave -noupdate /tb_RISC/RV/EX_9/CLK
add wave -noupdate /tb_RISC/RV/EX_9/RST_n
add wave -noupdate /tb_RISC/RV/EX_9/Q
add wave -noupdate -format Literal /tb_RISC/RV/EX_10/D
add wave -noupdate /tb_RISC/RV/EX_10/CLK
add wave -noupdate /tb_RISC/RV/EX_10/RST_n
add wave -noupdate -format Literal /tb_RISC/RV/EX_10/Q
add wave -noupdate /tb_RISC/RV/EX_1/D
add wave -noupdate /tb_RISC/RV/EX_1/CLK
add wave -noupdate /tb_RISC/RV/EX_1/RST_n
add wave -noupdate /tb_RISC/RV/EX_1/Q
add wave -noupdate /tb_RISC/RV/EX_11/D
add wave -noupdate /tb_RISC/RV/EX_11/CLK
add wave -noupdate /tb_RISC/RV/EX_11/RST_n
add wave -noupdate /tb_RISC/RV/EX_11/Q
add wave -noupdate /tb_RISC/RV/EX_12/D
add wave -noupdate /tb_RISC/RV/EX_12/CLK
add wave -noupdate /tb_RISC/RV/EX_12/RST_n
add wave -noupdate /tb_RISC/RV/EX_12/Q
add wave -noupdate /tb_RISC/RV/EX_13/D
add wave -noupdate /tb_RISC/RV/EX_13/CLK
add wave -noupdate /tb_RISC/RV/EX_13/RST_n
add wave -noupdate /tb_RISC/RV/EX_13/Q
add wave -noupdate /tb_RISC/RV/EX_14/D
add wave -noupdate /tb_RISC/RV/EX_14/CLK
add wave -noupdate /tb_RISC/RV/EX_14/RST_n
add wave -noupdate /tb_RISC/RV/EX_14/Q
add wave -noupdate /tb_RISC/RV/MUX_ADD_SUM/I0
add wave -noupdate /tb_RISC/RV/MUX_ADD_SUM/I1
add wave -noupdate /tb_RISC/RV/MUX_ADD_SUM/SEL
add wave -noupdate /tb_RISC/RV/MUX_ADD_SUM/O
add wave -noupdate /tb_RISC/RV/MUX_ALU/I0
add wave -noupdate /tb_RISC/RV/MUX_ALU/I1
add wave -noupdate /tb_RISC/RV/MUX_ALU/SEL
add wave -noupdate /tb_RISC/RV/MUX_ALU/O
add wave -noupdate /tb_RISC/RV/ctrl_alu/FUNC3
add wave -noupdate /tb_RISC/RV/ctrl_alu/ALU_OP
add wave -noupdate /tb_RISC/RV/ctrl_alu/ALU_CTRL
add wave -noupdate /tb_RISC/RV/ALU_unit/DATA_A
add wave -noupdate /tb_RISC/RV/ALU_unit/DATA_B
add wave -noupdate /tb_RISC/RV/ALU_unit/CTRL
add wave -noupdate /tb_RISC/RV/ALU_unit/DATA_OUT
add wave -noupdate /tb_RISC/RV/ALU_unit/ZERO
add wave -noupdate /tb_RISC/RV/MEM_1/D
add wave -noupdate /tb_RISC/RV/MEM_1/CLK
add wave -noupdate /tb_RISC/RV/MEM_1/RST_n
add wave -noupdate /tb_RISC/RV/MEM_1/Q
add wave -noupdate /tb_RISC/RV/MEM_2/D
add wave -noupdate /tb_RISC/RV/MEM_2/CLK
add wave -noupdate /tb_RISC/RV/MEM_2/RST_n
add wave -noupdate /tb_RISC/RV/MEM_2/Q
add wave -noupdate /tb_RISC/RV/MEM_3/D
add wave -noupdate /tb_RISC/RV/MEM_3/CLK
add wave -noupdate /tb_RISC/RV/MEM_3/RST_n
add wave -noupdate /tb_RISC/RV/MEM_3/Q
add wave -noupdate /tb_RISC/RV/MEM_4/D
add wave -noupdate /tb_RISC/RV/MEM_4/CLK
add wave -noupdate /tb_RISC/RV/MEM_4/RST_n
add wave -noupdate /tb_RISC/RV/MEM_4/Q
add wave -noupdate /tb_RISC/RV/MEM_5/D
add wave -noupdate /tb_RISC/RV/MEM_5/CLK
add wave -noupdate /tb_RISC/RV/MEM_5/RST_n
add wave -noupdate /tb_RISC/RV/MEM_5/Q
add wave -noupdate /tb_RISC/RV/MEM_6/D
add wave -noupdate /tb_RISC/RV/MEM_6/CLK
add wave -noupdate /tb_RISC/RV/MEM_6/RST_n
add wave -noupdate /tb_RISC/RV/MEM_6/Q
add wave -noupdate /tb_RISC/RV/MEM_7/D
add wave -noupdate /tb_RISC/RV/MEM_7/CLK
add wave -noupdate /tb_RISC/RV/MEM_7/RST_n
add wave -noupdate /tb_RISC/RV/MEM_7/Q
add wave -noupdate /tb_RISC/RV/MEM_8/D
add wave -noupdate /tb_RISC/RV/MEM_8/CLK
add wave -noupdate /tb_RISC/RV/MEM_8/RST_n
add wave -noupdate /tb_RISC/RV/MEM_8/Q
add wave -noupdate /tb_RISC/RV/MEM_9/D
add wave -noupdate /tb_RISC/RV/MEM_9/CLK
add wave -noupdate /tb_RISC/RV/MEM_9/RST_n
add wave -noupdate /tb_RISC/RV/MEM_9/Q
add wave -noupdate /tb_RISC/RV/MEM_10/D
add wave -noupdate /tb_RISC/RV/MEM_10/CLK
add wave -noupdate /tb_RISC/RV/MEM_10/RST_n
add wave -noupdate /tb_RISC/RV/MEM_10/Q
add wave -noupdate -format Literal /tb_RISC/RV/MEM_12/D
add wave -noupdate /tb_RISC/RV/MEM_12/CLK
add wave -noupdate /tb_RISC/RV/MEM_12/RST_n
add wave -noupdate -format Literal /tb_RISC/RV/MEM_12/Q
add wave -noupdate /tb_RISC/RV/MEM_13/D
add wave -noupdate /tb_RISC/RV/MEM_13/CLK
add wave -noupdate /tb_RISC/RV/MEM_13/RST_n
add wave -noupdate /tb_RISC/RV/MEM_13/Q
add wave -noupdate /tb_RISC/RV/MEM_14/D
add wave -noupdate /tb_RISC/RV/MEM_14/CLK
add wave -noupdate /tb_RISC/RV/MEM_14/RST_n
add wave -noupdate /tb_RISC/RV/MEM_14/Q
add wave -noupdate /tb_RISC/RV/MEM_15/D
add wave -noupdate /tb_RISC/RV/MEM_15/CLK
add wave -noupdate /tb_RISC/RV/MEM_15/RST_n
add wave -noupdate /tb_RISC/RV/MEM_15/Q
add wave -noupdate /tb_RISC/RV/WB_1/D
add wave -noupdate /tb_RISC/RV/WB_1/CLK
add wave -noupdate /tb_RISC/RV/WB_1/RST_n
add wave -noupdate /tb_RISC/RV/WB_1/Q
add wave -noupdate /tb_RISC/RV/WB_4/D
add wave -noupdate /tb_RISC/RV/WB_4/CLK
add wave -noupdate /tb_RISC/RV/WB_4/RST_n
add wave -noupdate /tb_RISC/RV/WB_4/Q
add wave -noupdate /tb_RISC/RV/WB_5/D
add wave -noupdate /tb_RISC/RV/WB_5/CLK
add wave -noupdate /tb_RISC/RV/WB_5/RST_n
add wave -noupdate /tb_RISC/RV/WB_5/Q
add wave -noupdate -format Literal /tb_RISC/RV/WB_6/D
add wave -noupdate /tb_RISC/RV/WB_6/CLK
add wave -noupdate /tb_RISC/RV/WB_6/RST_n
add wave -noupdate -format Literal /tb_RISC/RV/WB_6/Q
add wave -noupdate /tb_RISC/RV/MUX_FIN/I0
add wave -noupdate /tb_RISC/RV/MUX_FIN/I1
add wave -noupdate -format Literal /tb_RISC/RV/MUX_FIN/SEL
add wave -noupdate /tb_RISC/RV/MUX_FIN/O
add wave -noupdate /tb_RISC/IM/CLK
add wave -noupdate /tb_RISC/IM/ADDR
add wave -noupdate /tb_RISC/IM/DATA_OUT
add wave -noupdate /tb_RISC/IM/IM
add wave -noupdate /tb_RISC/DM/CLK
add wave -noupdate /tb_RISC/DM/RST_n
add wave -noupdate /tb_RISC/DM/MEM_READ
add wave -noupdate /tb_RISC/DM/MEM_WRITE
add wave -noupdate /tb_RISC/DM/ADDR
add wave -noupdate /tb_RISC/DM/WRITE_DATA
add wave -noupdate /tb_RISC/DM/DATA_OUT
add wave -noupdate /tb_RISC/DM/DM
add wave -noupdate /tb_RISC/RV/MUX_MEM/I0
add wave -noupdate /tb_RISC/RV/MUX_MEM/I1
add wave -noupdate /tb_RISC/RV/MUX_MEM/I2
add wave -noupdate /tb_RISC/RV/MUX_MEM/I3
add wave -noupdate /tb_RISC/RV/MUX_MEM/SEL
add wave -noupdate /tb_RISC/RV/MUX_MEM/O
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 264
configure wave -valuecolwidth 156
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {549856 ps}
