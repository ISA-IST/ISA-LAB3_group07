vlib work

vcom -93 -work ./work ./data_memory.vhd
vcom -93 -work ./work ./instruction_memory.vhd
vcom -93 -work ./work ./clk_gen.vhd
vlog -work ./work ../innovus/RISCV_ABS_innovus.v



vlog -work ./work ./tb_RISC.v

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_RISC/RV=../innovus/RISCV_ABS_innovus.sdf work.tb_RISC
vcd file ../vcd/RISCV_ABS_innovus.vcd
vcd add /tb_RISC/RV/*

#add wave -r *
do wave_abs.do

run 1.5 us



