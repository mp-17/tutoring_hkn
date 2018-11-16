onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /add_sub_abc_tb/clock
add wave -noupdate /add_sub_abc_tb/reset
add wave -noupdate /add_sub_abc_tb/start
add wave -noupdate /add_sub_abc_tb/add_sub_abc_rst_n
add wave -noupdate /add_sub_abc_tb/add_sub_abc_start
add wave -noupdate /add_sub_abc_tb/ab_freader_enable
add wave -noupdate /add_sub_abc_tb/c_freader_enable
add wave -noupdate /add_sub_abc_tb/sign_freader_enable
add wave -noupdate /add_sub_abc_tb/fwriter_enable
add wave -noupdate /add_sub_abc_tb/sign_freader_data
add wave -noupdate /add_sub_abc_tb/a_freader_data
add wave -noupdate /add_sub_abc_tb/b_freader_data
add wave -noupdate /add_sub_abc_tb/c_freader_data
add wave -noupdate /add_sub_abc_tb/add_sub_abc_out
add wave -noupdate /add_sub_abc_tb/control_unit/pres_state
add wave -noupdate /add_sub_abc_tb/device/cu/ps
add wave -noupdate /add_sub_abc_tb/freader_done
add wave -noupdate /add_sub_abc_tb/device/sign_wire
add wave -noupdate /add_sub_abc_tb/device/en_rega
add wave -noupdate /add_sub_abc_tb/device/en_regb
add wave -noupdate /add_sub_abc_tb/device/en_regc
add wave -noupdate /add_sub_abc_tb/device/en_regsum
add wave -noupdate /add_sub_abc_tb/device/dp/adder_sub/add0
add wave -noupdate /add_sub_abc_tb/device/dp/adder_sub/add1
add wave -noupdate /add_sub_abc_tb/device/dp/adder_sub/out0
add wave -noupdate /add_sub_abc_tb/device/dp/reg_out/en
add wave -noupdate /add_sub_abc_tb/device/dp/reg_out/d
add wave -noupdate /add_sub_abc_tb/device/dp/reg_out/q
add wave -noupdate /add_sub_abc_tb/device/cu/rst_n_regs
add wave -noupdate /add_sub_abc_tb/device/cu/rst_n_regsum
add wave -noupdate /add_sub_abc_tb/add_sub_abc_data_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2167 ns} 0}
configure wave -namecolwidth 274
configure wave -valuecolwidth 73
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
configure wave -timelineunits ns
update
WaveRestoreZoom {1710 ns} {2665 ns}
