onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_alu/CLK_i
add wave -noupdate -format Literal /tb_alu/A
add wave -noupdate -format Literal /tb_alu/B
add wave -noupdate -format Literal /tb_alu/OPCODE
add wave -noupdate -format Literal /tb_alu/FUNCT3
add wave -noupdate -format Logic /tb_alu/ALU_SRC1
add wave -noupdate -format Logic /tb_alu/SEL_MUX_JAL_AUIPC
add wave -noupdate -format Logic /tb_alu/REG_WRITE
add wave -noupdate -format Logic /tb_alu/MEM_WRITE
add wave -noupdate -format Logic /tb_alu/MEM_READ
add wave -noupdate -format Logic /tb_alu/BRANCH
add wave -noupdate -format Logic /tb_alu/SEL_MUX_ADD_SUM
add wave -noupdate -format Literal /tb_alu/MEM_TO_REG
add wave -noupdate -format Literal /tb_alu/ALU_OP
add wave -noupdate -format Literal /tb_alu/DATA_OUT
add wave -noupdate -format Literal /tb_alu/CTRL
add wave -noupdate -format Logic /tb_alu/ZERO
add wave -noupdate -format Logic /tb_alu/CG/clk
add wave -noupdate -format Logic /tb_alu/CG/clk_i
add wave -noupdate -format Logic /tb_alu/SM/clk
add wave -noupdate -format Literal /tb_alu/SM/funct3
add wave -noupdate -format Literal /tb_alu/SM/opcode
add wave -noupdate -format Literal /tb_alu/SM/a
add wave -noupdate -format Literal /tb_alu/SM/b
add wave -noupdate -format Literal /tb_alu/ALU/data_a
add wave -noupdate -format Literal /tb_alu/ALU/data_b
add wave -noupdate -format Literal /tb_alu/ALU/ctrl
add wave -noupdate -format Literal /tb_alu/ALU/data_out
add wave -noupdate -format Logic /tb_alu/ALU/zero
add wave -noupdate -format Literal /tb_alu/CONTROL/opcode
add wave -noupdate -format Logic /tb_alu/CONTROL/alu_src1
add wave -noupdate -format Logic /tb_alu/CONTROL/sel_mux_jal_auipc
add wave -noupdate -format Logic /tb_alu/CONTROL/reg_write
add wave -noupdate -format Logic /tb_alu/CONTROL/mem_write
add wave -noupdate -format Logic /tb_alu/CONTROL/mem_read
add wave -noupdate -format Logic /tb_alu/CONTROL/branch
add wave -noupdate -format Logic /tb_alu/CONTROL/sel_mux_add_sum
add wave -noupdate -format Literal /tb_alu/CONTROL/mem_to_reg
add wave -noupdate -format Literal /tb_alu/CONTROL/alu_op
add wave -noupdate -format Literal /tb_alu/ALU_CTRL/func3
add wave -noupdate -format Literal /tb_alu/ALU_CTRL/alu_op
add wave -noupdate -format Literal /tb_alu/ALU_CTRL/alu_ctrl
add wave -noupdate -format Logic /tb_alu/DS/clk
add wave -noupdate -format Logic /tb_alu/DS/alu_src1
add wave -noupdate -format Logic /tb_alu/DS/sel_mux_jal_auipc
add wave -noupdate -format Logic /tb_alu/DS/reg_write
add wave -noupdate -format Logic /tb_alu/DS/mem_write
add wave -noupdate -format Logic /tb_alu/DS/mem_read
add wave -noupdate -format Logic /tb_alu/DS/branch
add wave -noupdate -format Logic /tb_alu/DS/sel_mux_add_sum
add wave -noupdate -format Literal /tb_alu/DS/mem_to_reg
add wave -noupdate -format Literal /tb_alu/DS/res
add wave -noupdate -format Logic /tb_alu/DS/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17 ns} 0}
configure wave -namecolwidth 250
configure wave -valuecolwidth 194
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
update
WaveRestoreZoom {0 ns} {30 ns}
