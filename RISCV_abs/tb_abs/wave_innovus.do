onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {ENTITY SIGNALS}
add wave -noupdate -format Logic /tb_RISC/CLK_i
add wave -noupdate -format Logic /tb_RISC/RST_n
add wave -noupdate -format Literal -radix decimal /tb_RISC/INSTR_i
add wave -noupdate -format Literal -radix decimal /tb_RISC/DM_data_i
add wave -noupdate -format Literal -radix decimal /tb_RISC/PC_i
add wave -noupdate -format Literal -radix decimal /tb_RISC/DM_addr_i
add wave -noupdate -format Logic /tb_RISC/DM_WRITE_OUT_i
add wave -noupdate -format Logic /tb_RISC/DM_READ_OUT_i
add wave -noupdate -format Literal -radix decimal /tb_RISC/WRITE_DATA_OUT_i
add wave -noupdate -format Logic /tb_RISC/IM_READ_OUT_i
add wave -noupdate -divider OTHERS
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
WaveRestoreCursors {{Cursor 1} {922 ns} 0}
configure wave -namecolwidth 300
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
WaveRestoreZoom {0 ns} {660 ns}
