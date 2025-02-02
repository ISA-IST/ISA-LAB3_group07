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
vlog -work ./work ../netlist/RISC_ABS.v

vcom -93 -work ./work ./clk_gen.vhd

vlog -work ./work ./tb_RISC.v

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_RISC/RV=../netlist/RISC_ABS.sdf work.tb_RISC
#vcd file ../vcd/RISCV_ABS_netlist.vcd # questa riga è stata commentata per fare una prova
#vcd add /tb_RISC/RV/* # questa riga è stata commentata per fare una prova

#add wave -r *
do wave_abs.do

run 3 us
