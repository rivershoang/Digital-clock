onerror {quit -f}
vlib work
vlog -work work clock_can_change.vo
vlog -work work clock_can_change.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.debounce_vlg_vec_tst
vcd file -direction clock_can_change.msim.vcd
vcd add -internal debounce_vlg_vec_tst/*
vcd add -internal debounce_vlg_vec_tst/i1/*
add wave /*
run -all
