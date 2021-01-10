vlib work
vcom -93 -work ./work ../src/regnbit.vhd
vcom -93 -work ./work ../src/ff.vhd
vcom -93 -work ./work ../src/mux_2to1_nbit.vhd
vcom -93 -work ./work ../src/mux_4to1_nbit.vhd

vcom -93 -work ./work ./data_memory.vhd
vcom -93 -work ./work ./instruction_memory.vhd

vcom -93 -work ./work ../src/ALU.vhd
vcom -93 -work ./work ../src/control.vhd
vcom -93 -work ./work ../src/alu_control.vhd
vcom -93 -work ./work ../src/imm_gen.vhd
vcom -93 -work ./work ../src/RF_32_32b.vhd
vcom -93 -work ./work ../src/forwarding_unit.vhd
vcom -93 -work ./work ../src/HDU.vhd
vcom -93 -work ./work ../src/Absolute_value.vhd
vcom -93 -work ./work ../src/RISC-V-forward.vhd

vcom -93 -work ./work ./clk_gen.vhd

vlog -work ./work ./tb_RISC.v

vsim work.tb_RISC

#add wave -r *
do wave_abs.do

run 3 us
