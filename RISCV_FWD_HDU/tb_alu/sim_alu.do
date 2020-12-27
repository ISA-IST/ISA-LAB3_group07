vcom -93 -work ./work ../src/ALU.vhd
vcom -93 -work ./work ../src/alu_control.vhd
vcom -93 -work ./work ../src/control.vhd

vcom -93 -work ./work ./clk_gen.vhd
vcom -93 -work ./work ./data_sink.vhd
vcom -93 -work ./work ./data_maker.vhd

vlog -work ./work ./tb_alu.v

vsim work.tb_alu

add wave -r *
run 150 ns
