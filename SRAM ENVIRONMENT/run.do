#vlib work
#vlog top.sv +acc +cover +incdirC:/questasim64_10.7c/verilog_src/uvm-1.1d/src
#vsim work.top -coverage -assertdebug -sv_lib C:/questasim64_10.7c/uvm-1.1d/win64/uvm_dpi +UVM_VERBOSITY=UVM_NONE -l run.log
#add wave -r *
#run -all


vlib work
vlog top.sv +acc +cover +incdirC:/questasim64_10.7c/verilog_src/uvm-1.1d/src
vsim work.top -coverage -assertdebug -sv_lib C:/questasim64_10.7c/uvm-1.1d/win64/uvm_dpi +UVM_VERBOSITY=UVM_NONE -l run.log
add wave -r sim:/top/*
run -all
