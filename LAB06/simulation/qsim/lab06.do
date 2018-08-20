onerror {quit -f}
vlib work
vlog -work work lab06.vo
vlog -work work lab06.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.lab06_vlg_vec_tst
vcd file -direction lab06.msim.vcd
vcd add -internal lab06_vlg_vec_tst/*
vcd add -internal lab06_vlg_vec_tst/i1/*
add wave /*
run -all
