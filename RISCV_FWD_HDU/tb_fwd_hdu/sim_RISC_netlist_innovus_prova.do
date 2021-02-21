vlib work

vcom -93 -work ./work ../src/data_memory.vhd
vcom -93 -work ./work ../src/instruction_memory.vhd
vcom -93 -work ./work ./clk_gen.vhd

vlog -work ./work ../innovus/RISC_V.v
vlog -work ./work ./tb_RISC.v

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_RISC/RV=../innovus/RISC_V.sdf work.tb_RISC


do wave_innovus.do

run 1.5 us



