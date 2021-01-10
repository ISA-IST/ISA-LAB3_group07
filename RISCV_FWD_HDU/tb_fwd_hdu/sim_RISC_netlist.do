vlib work
vcom -93 -work ./work ../src/regnbit.vhd
vcom -93 -work ./work ../src/ff.vhd
vcom -93 -work ./work ../src/mux_2to1_nbit.vhd
vcom -93 -work ./work ../src/mux_4to1_nbit.vhd
vcom -93 -work ./work ../src/data_memory.vhd
vcom -93 -work ./work ../src/instruction_memory.vhd
vcom -93 -work ./work ../src/ALU.vhd
vcom -93 -work ./work ../src/control.vhd
vcom -93 -work ./work ../src/alu_control.vhd
vcom -93 -work ./work ../src/imm_gen.vhd
vcom -93 -work ./work ../src/RF_32_32b.vhd
vcom -93 -work ./work ../src/forwarding_unit.vhd
vcom -93 -work ./work ../src/HDU.vhd
vlog -work ./work ../netlist/RISC_FWD_HDU.v

vcom -93 -work ./work ./clk_gen.vhd

vlog -work ./work ./tb_RISC.v

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_RISC/RV=../netlist/RISC_FWD_HDU.sdf work.tb_RISC
vcd file ../vcd/sim_RISC_netlist.do
vcd add /tb_RISC/RV/*


#add wave -r *
do wave_RISC.do

run 3 us
