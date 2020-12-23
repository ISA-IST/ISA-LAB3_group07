onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {ENTITY SIGNALS}
add wave -noupdate -format Logic /tb_RISC/CLK_i
add wave -noupdate -format Logic /tb_RISC/RST_n
add wave -noupdate -format Literal -radix decimal /tb_RISC/INSTR_i
add wave -noupdate -format Literal -radix decimal /tb_RISC/DM_data_i
add wave -noupdate -format Literal -radix decimal /tb_RISC/PC_i
add wave -noupdate -format Literal -radix decimal /tb_RISC/DM_addr_i
add wave -noupdate -format Literal -radix decimal /tb_RISC/WRITE_DATA_OUT_i
add wave -noupdate -format Logic /tb_RISC/MEM_WRITE_OUT_i
add wave -noupdate -format Logic /tb_RISC/MEM_READ_OUT_i
add wave -noupdate -divider ID
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/instr
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/reg_files/rf
add wave -noupdate -format Logic /tb_RISC/RV/reg_write
add wave -noupdate -format Logic /tb_RISC/RV/alu_src
add wave -noupdate -format Logic /tb_RISC/RV/sel_mux_jal_auipc
add wave -noupdate -format Logic /tb_RISC/RV/mem_write
add wave -noupdate -format Logic /tb_RISC/RV/mem_read
add wave -noupdate -format Logic /tb_RISC/RV/branch_cond
add wave -noupdate -format Logic /tb_RISC/RV/branch_uncond
add wave -noupdate -format Logic /tb_RISC/RV/sel_mux_add_sum
add wave -noupdate -format Literal /tb_RISC/RV/mem_to_reg
add wave -noupdate -format Literal /tb_RISC/RV/alu_op
add wave -noupdate -format Logic /tb_RISC/RV/alu_src_1
add wave -noupdate -format Logic /tb_RISC/RV/sel_mux_jal_auipc_1
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/imm
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/pc_1
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/next_pc_1
add wave -noupdate -divider EXE
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/read_data1
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/read_data2
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/next_pc_2
add wave -noupdate -format Logic /tb_RISC/RV/mem_write_1
add wave -noupdate -format Logic /tb_RISC/RV/mem_read_1
add wave -noupdate -format Logic /tb_RISC/RV/reg_write_1
add wave -noupdate -format Logic /tb_RISC/RV/branch_cond_1
add wave -noupdate -format Logic /tb_RISC/RV/branch_uncond_1
add wave -noupdate -format Literal /tb_RISC/RV/mem_to_reg_1
add wave -noupdate -format Literal /tb_RISC/RV/instr_1
add wave -noupdate -format Logic /tb_RISC/RV/sel_mux_add_sum_1
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/imm_1
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/imm_1_shift
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/pc_2
add wave -noupdate -format Literal /tb_RISC/RV/alu_op_1
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/out_mux_add_sum
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/out_add_sum
add wave -noupdate -format Literal /tb_RISC/RV/alu_ctrl
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/data_b
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/out_alu
add wave -noupdate -format Logic /tb_RISC/RV/zero
add wave -noupdate -divider MEM
add wave -noupdate -format Literal /tb_RISC/RV/instr_2
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/out_mux_jal_auipc
add wave -noupdate -format Logic /tb_RISC/RV/sel_mux_jal_auipc_2
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/next_pc_3
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/out_add_sum_1
add wave -noupdate -format Logic /tb_RISC/RV/reg_write_2
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/imm_2
add wave -noupdate -format Literal /tb_RISC/RV/mem_to_reg_2
add wave -noupdate -format Logic /tb_RISC/RV/zero_1
add wave -noupdate -format Logic /tb_RISC/RV/branch_cond_2
add wave -noupdate -format Logic /tb_RISC/RV/branch_uncond_2
add wave -noupdate -divider WB
add wave -noupdate -format Logic /tb_RISC/RV/reg_write_3
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/dm_addr_mux
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/imm_mux
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/out_mux_jal_auipc_1
add wave -noupdate -format Literal /tb_RISC/RV/mem_to_reg_3
add wave -noupdate -format Literal /tb_RISC/RV/instr_3
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/out_mux_fin
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/dm_data
add wave -noupdate -divider PC_part
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/pc
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/dm_addr
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/write_data_out
add wave -noupdate -format Logic /tb_RISC/RV/mem_write_out
add wave -noupdate -format Logic /tb_RISC/RV/mem_read_out
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/next_pc
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/out_mux_pc1
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/out_mux_pc2
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/first_address
add wave -noupdate -format Logic /tb_RISC/RV/sel_add
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/pc_s
add wave -noupdate -format Literal -radix decimal /tb_RISC/RV/dm_addr_s
add wave -noupdate -divider OTHERS
add wave -noupdate -format Literal /tb_RISC/RV/mux_pc/i0
add wave -noupdate -format Literal /tb_RISC/RV/mux_pc/i1
add wave -noupdate -format Logic /tb_RISC/RV/mux_pc/sel
add wave -noupdate -format Literal /tb_RISC/RV/mux_pc/o
add wave -noupdate -format Literal /tb_RISC/RV/mux_reset/i0
add wave -noupdate -format Literal /tb_RISC/RV/mux_reset/i1
add wave -noupdate -format Logic /tb_RISC/RV/mux_reset/sel
add wave -noupdate -format Literal /tb_RISC/RV/mux_reset/o
add wave -noupdate -format Literal /tb_RISC/RV/pc_reg/d
add wave -noupdate -format Logic /tb_RISC/RV/pc_reg/clk
add wave -noupdate -format Logic /tb_RISC/RV/pc_reg/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/pc_reg/q
add wave -noupdate -format Literal /tb_RISC/RV/id_1/d
add wave -noupdate -format Logic /tb_RISC/RV/id_1/clk
add wave -noupdate -format Logic /tb_RISC/RV/id_1/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/id_1/q
add wave -noupdate -format Literal /tb_RISC/RV/id_2/d
add wave -noupdate -format Logic /tb_RISC/RV/id_2/clk
add wave -noupdate -format Logic /tb_RISC/RV/id_2/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/id_2/q
add wave -noupdate -format Literal /tb_RISC/RV/reg_files/data_in
add wave -noupdate -format Logic /tb_RISC/RV/reg_files/clk
add wave -noupdate -format Logic /tb_RISC/RV/reg_files/wr
add wave -noupdate -format Literal /tb_RISC/RV/reg_files/addr_rd_1
add wave -noupdate -format Literal /tb_RISC/RV/reg_files/addr_rd_2
add wave -noupdate -format Literal /tb_RISC/RV/reg_files/addr_wr
add wave -noupdate -format Literal /tb_RISC/RV/reg_files/data_out_1
add wave -noupdate -format Literal /tb_RISC/RV/reg_files/data_out_2
add wave -noupdate -format Literal /tb_RISC/RV/immed_gen/instr
add wave -noupdate -format Literal /tb_RISC/RV/immed_gen/imm
add wave -noupdate -format Literal /tb_RISC/RV/contr/opcode
add wave -noupdate -format Logic /tb_RISC/RV/contr/alu_src1
add wave -noupdate -format Logic /tb_RISC/RV/contr/sel_mux_jal_auipc
add wave -noupdate -format Logic /tb_RISC/RV/contr/reg_write
add wave -noupdate -format Logic /tb_RISC/RV/contr/mem_write
add wave -noupdate -format Logic /tb_RISC/RV/contr/mem_read
add wave -noupdate -format Logic /tb_RISC/RV/contr/branch_cond
add wave -noupdate -format Logic /tb_RISC/RV/contr/branch_uncond
add wave -noupdate -format Logic /tb_RISC/RV/contr/sel_mux_add_sum
add wave -noupdate -format Literal /tb_RISC/RV/contr/mem_to_reg
add wave -noupdate -format Literal /tb_RISC/RV/contr/alu_op
add wave -noupdate -format Logic /tb_RISC/RV/ex_2/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_2/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_2/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/ex_2/q
add wave -noupdate -format Logic /tb_RISC/RV/ex_3/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_3/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_3/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/ex_3/q
add wave -noupdate -format Logic /tb_RISC/RV/ex_4/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_4/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_4/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/ex_4/q
add wave -noupdate -format Logic /tb_RISC/RV/ex_5/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_5/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_5/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/ex_5/q
add wave -noupdate -format Logic /tb_RISC/RV/ex_6/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_6/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_6/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/ex_6/q
add wave -noupdate -format Logic /tb_RISC/RV/ex_7/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_7/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_7/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/ex_7/q
add wave -noupdate -format Logic /tb_RISC/RV/ex_8/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_8/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_8/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/ex_8/q
add wave -noupdate -format Logic /tb_RISC/RV/ex_9/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_9/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_9/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/ex_9/q
add wave -noupdate -format Literal /tb_RISC/RV/ex_10/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_10/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_10/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/ex_10/q
add wave -noupdate -format Literal /tb_RISC/RV/ex_1/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_1/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_1/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/ex_1/q
add wave -noupdate -format Literal /tb_RISC/RV/ex_11/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_11/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_11/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/ex_11/q
add wave -noupdate -format Literal /tb_RISC/RV/ex_12/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_12/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_12/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/ex_12/q
add wave -noupdate -format Literal /tb_RISC/RV/ex_13/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_13/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_13/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/ex_13/q
add wave -noupdate -format Literal /tb_RISC/RV/ex_14/d
add wave -noupdate -format Logic /tb_RISC/RV/ex_14/clk
add wave -noupdate -format Logic /tb_RISC/RV/ex_14/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/ex_14/q
add wave -noupdate -format Literal /tb_RISC/RV/mux_add_sum/i0
add wave -noupdate -format Literal /tb_RISC/RV/mux_add_sum/i1
add wave -noupdate -format Logic /tb_RISC/RV/mux_add_sum/sel
add wave -noupdate -format Literal /tb_RISC/RV/mux_add_sum/o
add wave -noupdate -format Literal /tb_RISC/RV/mux_alu/i0
add wave -noupdate -format Literal /tb_RISC/RV/mux_alu/i1
add wave -noupdate -format Logic /tb_RISC/RV/mux_alu/sel
add wave -noupdate -format Literal /tb_RISC/RV/mux_alu/o
add wave -noupdate -format Literal /tb_RISC/RV/ctrl_alu/func3
add wave -noupdate -format Literal /tb_RISC/RV/ctrl_alu/alu_op
add wave -noupdate -format Literal /tb_RISC/RV/ctrl_alu/alu_ctrl
add wave -noupdate -format Literal /tb_RISC/RV/alu_unit/data_a
add wave -noupdate -format Literal /tb_RISC/RV/alu_unit/data_b
add wave -noupdate -format Literal /tb_RISC/RV/alu_unit/ctrl
add wave -noupdate -format Literal /tb_RISC/RV/alu_unit/data_out
add wave -noupdate -format Logic /tb_RISC/RV/alu_unit/zero
add wave -noupdate -format Logic /tb_RISC/RV/mem_1/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_1/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_1/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/mem_1/q
add wave -noupdate -format Logic /tb_RISC/RV/mem_2/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_2/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_2/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/mem_2/q
add wave -noupdate -format Logic /tb_RISC/RV/mem_3/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_3/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_3/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/mem_3/q
add wave -noupdate -format Logic /tb_RISC/RV/mem_4/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_4/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_4/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/mem_4/q
add wave -noupdate -format Logic /tb_RISC/RV/mem_5/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_5/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_5/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/mem_5/q
add wave -noupdate -format Logic /tb_RISC/RV/mem_6/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_6/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_6/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/mem_6/q
add wave -noupdate -format Literal /tb_RISC/RV/mem_7/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_7/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_7/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/mem_7/q
add wave -noupdate -format Literal /tb_RISC/RV/mem_8/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_8/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_8/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/mem_8/q
add wave -noupdate -format Literal /tb_RISC/RV/mem_9/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_9/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_9/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/mem_9/q
add wave -noupdate -format Literal /tb_RISC/RV/mem_10/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_10/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_10/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/mem_10/q
add wave -noupdate -format Literal /tb_RISC/RV/mem_12/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_12/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_12/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/mem_12/q
add wave -noupdate -format Logic /tb_RISC/RV/mem_13/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_13/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_13/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/mem_13/q
add wave -noupdate -format Literal /tb_RISC/RV/mem_14/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_14/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_14/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/mem_14/q
add wave -noupdate -format Literal /tb_RISC/RV/mem_15/d
add wave -noupdate -format Logic /tb_RISC/RV/mem_15/clk
add wave -noupdate -format Logic /tb_RISC/RV/mem_15/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/mem_15/q
add wave -noupdate -format Literal /tb_RISC/RV/mux_jal_auipc/i0
add wave -noupdate -format Literal /tb_RISC/RV/mux_jal_auipc/i1
add wave -noupdate -format Logic /tb_RISC/RV/mux_jal_auipc/sel
add wave -noupdate -format Literal /tb_RISC/RV/mux_jal_auipc/o
add wave -noupdate -format Logic /tb_RISC/RV/wb_1/d
add wave -noupdate -format Logic /tb_RISC/RV/wb_1/clk
add wave -noupdate -format Logic /tb_RISC/RV/wb_1/rst_n
add wave -noupdate -format Logic /tb_RISC/RV/wb_1/q
add wave -noupdate -format Literal /tb_RISC/RV/wb_2/d
add wave -noupdate -format Logic /tb_RISC/RV/wb_2/clk
add wave -noupdate -format Logic /tb_RISC/RV/wb_2/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/wb_2/q
add wave -noupdate -format Literal /tb_RISC/RV/wb_3/d
add wave -noupdate -format Logic /tb_RISC/RV/wb_3/clk
add wave -noupdate -format Logic /tb_RISC/RV/wb_3/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/wb_3/q
add wave -noupdate -format Literal /tb_RISC/RV/wb_4/d
add wave -noupdate -format Logic /tb_RISC/RV/wb_4/clk
add wave -noupdate -format Logic /tb_RISC/RV/wb_4/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/wb_4/q
add wave -noupdate -format Literal /tb_RISC/RV/wb_5/d
add wave -noupdate -format Logic /tb_RISC/RV/wb_5/clk
add wave -noupdate -format Logic /tb_RISC/RV/wb_5/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/wb_5/q
add wave -noupdate -format Literal /tb_RISC/RV/wb_6/d
add wave -noupdate -format Logic /tb_RISC/RV/wb_6/clk
add wave -noupdate -format Logic /tb_RISC/RV/wb_6/rst_n
add wave -noupdate -format Literal /tb_RISC/RV/wb_6/q
add wave -noupdate -format Literal /tb_RISC/RV/mux_fin/i0
add wave -noupdate -format Literal /tb_RISC/RV/mux_fin/i1
add wave -noupdate -format Literal /tb_RISC/RV/mux_fin/i2
add wave -noupdate -format Literal /tb_RISC/RV/mux_fin/i3
add wave -noupdate -format Literal /tb_RISC/RV/mux_fin/sel
add wave -noupdate -format Literal /tb_RISC/RV/mux_fin/o
add wave -noupdate -format Logic /tb_RISC/IM/clk
add wave -noupdate -format Literal /tb_RISC/IM/addr
add wave -noupdate -format Literal /tb_RISC/IM/data_out
add wave -noupdate -format Literal /tb_RISC/IM/im
add wave -noupdate -format Logic /tb_RISC/DM/clk
add wave -noupdate -format Logic /tb_RISC/DM/rst_n
add wave -noupdate -format Logic /tb_RISC/DM/mem_read
add wave -noupdate -format Logic /tb_RISC/DM/mem_write
add wave -noupdate -format Literal /tb_RISC/DM/addr
add wave -noupdate -format Literal /tb_RISC/DM/write_data
add wave -noupdate -format Literal /tb_RISC/DM/data_out
add wave -noupdate -format Literal /tb_RISC/DM/dm
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3 ns} 0}
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
update
WaveRestoreZoom {0 ns} {30 ns}
