onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /e/uut/CLOCK_50
add wave -noupdate -radix hexadecimal /e/uut/uut/register_file/reg_out
add wave -noupdate -radix hexadecimal /e/uut/KEY
add wave -noupdate -radix hexadecimal /e/uut/SW
add wave -noupdate -radix hexadecimal /e/uut/LEDR
add wave -noupdate -radix hexadecimal /e/uut/LEDG
add wave -noupdate -radix hexadecimal /e/uut/HEX0
add wave -noupdate -radix hexadecimal /e/uut/HEX1
add wave -noupdate -radix hexadecimal /e/uut/HEX2
add wave -noupdate -radix hexadecimal /e/uut/HEX3
add wave -noupdate -radix hexadecimal /e/uut/HEX4
add wave -noupdate -radix hexadecimal /e/uut/HEX5
add wave -noupdate -radix hexadecimal /e/uut/HEX6
add wave -noupdate -radix hexadecimal /e/uut/HEX7
add wave -noupdate -radix hexadecimal /e/uut/counter_rdn_sig
add wave -noupdate -radix hexadecimal /e/uut/counter_wrn_sig
add wave -noupdate -radix hexadecimal /e/uut/counter_address_sig
add wave -noupdate -radix hexadecimal /e/uut/counter_data_in_sig
add wave -noupdate -radix hexadecimal /e/uut/counter_data_out_sig
add wave -noupdate -radix hexadecimal /e/uut/clk
add wave -noupdate -radix hexadecimal /e/uut/clkn
add wave -noupdate -radix hexadecimal /e/uut/resetn
add wave -noupdate -radix hexadecimal /e/uut/iaddr_out
add wave -noupdate -radix hexadecimal /e/uut/daddr_out
add wave -noupdate -radix hexadecimal /e/uut/idata_in
add wave -noupdate -radix hexadecimal /e/uut/ddata_in
add wave -noupdate -radix hexadecimal /e/uut/ddata_out
add wave -noupdate -radix hexadecimal /e/uut/mem_value
add wave -noupdate -radix hexadecimal /e/uut/D_wen
add wave -noupdate -radix hexadecimal /e/uut/D_ren
add wave -noupdate -radix hexadecimal /e/uut/I_wen
add wave -noupdate -radix hexadecimal /e/uut/I_ren
add wave -noupdate -radix hexadecimal /e/uut/S1_wen
add wave -noupdate -radix hexadecimal /e/uut/S1_ren
add wave -noupdate -radix hexadecimal /e/uut/S2_ren
add wave -noupdate -radix hexadecimal /e/uut/S2_wen
add wave -noupdate -radix hexadecimal /e/uut/S3_ren
add wave -noupdate -radix hexadecimal /e/uut/S3_wen
add wave -noupdate -radix hexadecimal /e/uut/S4_ren
add wave -noupdate -radix hexadecimal /e/uut/S4_wen
add wave -noupdate -radix hexadecimal /e/uut/D_bitwen
add wave -noupdate -radix hexadecimal /e/uut/I_bitwen
add wave -noupdate -radix hexadecimal /e/uut/SW_in
add wave -noupdate -radix hexadecimal /e/uut/output
add wave -noupdate -radix hexadecimal /e/uut/softwareCount
add wave -noupdate -radix hexadecimal /e/uut/softwareCountNext
add wave -noupdate -radix hexadecimal /e/uut/M1_BUSY_SIG
add wave -noupdate -radix hexadecimal /e/uut/M1_NREADY_SIG
add wave -noupdate -radix hexadecimal /e/uut/M2_NREADY_SIG
add wave -noupdate -radix hexadecimal /e/uut/S1_BUSY_SIG
add wave -noupdate -radix hexadecimal /e/uut/S1_NREADY_SIG
add wave -noupdate -radix hexadecimal /e/uut/S2_BUSY_SIG
add wave -noupdate -radix hexadecimal /e/uut/S3_NREADY_SIG
add wave -noupdate -radix hexadecimal /e/uut/S3_BUSY_SIG
add wave -noupdate -radix hexadecimal /e/uut/S4_NREADY_SIG
add wave -noupdate -radix hexadecimal /e/uut/M1_ADDRBUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/M1_RDATABUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/M1_WDATABUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/M2_BUSY_SIG
add wave -noupdate -radix hexadecimal /e/uut/M2_MR_SIG
add wave -noupdate -radix hexadecimal /e/uut/M2_MW_SIG
add wave -noupdate -radix hexadecimal /e/uut/M2_ADDRBUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/M2_RDATABUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/M2_WDATABUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/S1_ADDRBUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/S2_ADDRBUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/S3_ADDRBUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/S4_ADDRBUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/S1_ddata_in
add wave -noupdate -radix hexadecimal /e/uut/S2_ddata_in
add wave -noupdate -radix hexadecimal /e/uut/S3_ddata_in
add wave -noupdate -radix hexadecimal /e/uut/S4_ddata_in
add wave -noupdate -radix hexadecimal /e/uut/S1_ddata_out
add wave -noupdate -radix hexadecimal /e/uut/S2_ddata_out
add wave -noupdate -radix hexadecimal /e/uut/S3_ddata_out
add wave -noupdate -radix hexadecimal /e/uut/S4_ddata_out
add wave -noupdate -radix hexadecimal /e/uut/S4_BUSY_SIG
add wave -noupdate -radix hexadecimal /e/uut/S4_MR_SIG
add wave -noupdate -radix hexadecimal /e/uut/S4_MW_SIG
add wave -noupdate -radix hexadecimal /e/uut/BUS2_M1_BUSY_SIG
add wave -noupdate -radix hexadecimal /e/uut/BUS2_M1_NREADY_SIG
add wave -noupdate -radix hexadecimal /e/uut/BUS2_M1_MR_SIG
add wave -noupdate -radix hexadecimal /e/uut/BUS2_M1_MW_SIG
add wave -noupdate -radix hexadecimal /e/uut/BUS2_M1_ADDRBUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/BUS2_M1_RDATABUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/BUS2_M1_WDATABUS_SIG
add wave -noupdate -radix hexadecimal /e/uut/hexSignal
add wave -noupdate -radix hexadecimal /e/uut/ledSignal
add wave -noupdate -radix hexadecimal /e/uut/switchSignal
add wave -noupdate -radix hexadecimal /e/uut/hexSignaladdr
add wave -noupdate -radix hexadecimal /e/uut/ledSignaladdr
add wave -noupdate -radix hexadecimal /e/uut/switchSignaladdr
add wave -noupdate -radix hexadecimal /e/uut/temp
add wave -noupdate -radix hexadecimal /e/uut/my_dma/CLK
add wave -noupdate -radix hexadecimal /e/uut/my_dma/reset
add wave -noupdate -radix hexadecimal /e/uut/my_dma/M2_BUSY
add wave -noupdate -radix hexadecimal /e/uut/my_dma/M2_MR
add wave -noupdate -radix hexadecimal /e/uut/my_dma/M2_MW
add wave -noupdate -radix hexadecimal /e/uut/my_dma/M2_NREADY
add wave -noupdate -radix hexadecimal /e/uut/my_dma/M2_ADDRBUS
add wave -noupdate -radix hexadecimal /e/uut/my_dma/M2_RDATABUS
add wave -noupdate -radix hexadecimal /e/uut/my_dma/M2_WDATABUS
add wave -noupdate -radix hexadecimal /e/uut/my_dma/S4_BUSY
add wave -noupdate -radix hexadecimal /e/uut/my_dma/S4_MR
add wave -noupdate -radix hexadecimal /e/uut/my_dma/S4_MW
add wave -noupdate -radix hexadecimal /e/uut/my_dma/S4_NREADY
add wave -noupdate -radix hexadecimal /e/uut/my_dma/S4_ADDRBUS
add wave -noupdate -radix hexadecimal /e/uut/my_dma/S4_RDATABUS
add wave -noupdate -radix hexadecimal /e/uut/my_dma/S4_WDATABUS
add wave -noupdate -radix hexadecimal /e/uut/my_dma/DMA_State
add wave -noupdate -radix hexadecimal /e/uut/my_dma/next_DMA_state
add wave -noupdate -radix hexadecimal /e/uut/my_dma/command_reg
add wave -noupdate -radix hexadecimal /e/uut/my_dma/data_reg
add wave -noupdate -radix hexadecimal /e/uut/my_dma/count_reg
add wave -noupdate -radix hexadecimal /e/uut/my_dma/next_count
add wave -noupdate -radix hexadecimal /e/uut/my_dma/rstart_reg
add wave -noupdate -radix hexadecimal /e/uut/my_dma/rstep_reg
add wave -noupdate -radix hexadecimal /e/uut/my_dma/raddr_reg
add wave -noupdate -radix hexadecimal /e/uut/my_dma/next_raddress
add wave -noupdate -radix hexadecimal /e/uut/my_dma/wstart_reg
add wave -noupdate -radix hexadecimal /e/uut/my_dma/wstep_reg
add wave -noupdate -radix hexadecimal /e/uut/my_dma/waddr_reg
add wave -noupdate -radix hexadecimal /e/uut/my_dma/next_waddress
add wave -noupdate -radix hexadecimal /e/uut/my_dma/ck_S4_ADDRBUS
add wave -noupdate -radix hexadecimal /e/uut/my_counter/clk
add wave -noupdate -radix hexadecimal /e/uut/my_counter/resetn
add wave -noupdate -radix hexadecimal /e/uut/my_counter/rdn
add wave -noupdate -radix hexadecimal /e/uut/my_counter/wrn
add wave -noupdate -radix hexadecimal /e/uut/my_counter/address
add wave -noupdate -radix hexadecimal /e/uut/my_counter/data_in
add wave -noupdate -radix hexadecimal /e/uut/my_counter/data_out
add wave -noupdate -radix hexadecimal /e/uut/my_counter/count
add wave -noupdate -radix hexadecimal /e/uut/my_counter/next_count
add wave -noupdate -radix hexadecimal /e/uut/my_counter/cstate
add wave -noupdate -radix hexadecimal /e/uut/my_counter/next_cstate
add wave -noupdate -radix hexadecimal /e/uut/my_counter/creset
add wave -noupdate -radix hexadecimal /e/uut/my_counter/read_addr
add wave -noupdate -radix hexadecimal /e/uut/uut/register_file/clk
add wave -noupdate -radix hexadecimal /e/uut/uut/register_file/resetn
add wave -noupdate -radix hexadecimal /e/uut/uut/register_file/ra
add wave -noupdate -radix hexadecimal /e/uut/uut/register_file/rb
add wave -noupdate -radix hexadecimal /e/uut/uut/register_file/a_out
add wave -noupdate -radix hexadecimal /e/uut/uut/register_file/b_out
add wave -noupdate -radix hexadecimal /e/uut/uut/register_file/rd1
add wave -noupdate -radix hexadecimal /e/uut/uut/register_file/d1_in
add wave -noupdate -radix hexadecimal /e/uut/uut/register_file/reg_in
add wave -noupdate -radix hexadecimal -childformat {{/e/uut/uut/register_file/reg_out(15) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(14) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(13) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(12) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(11) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(10) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(9) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(8) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(7) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(6) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(5) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(4) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(3) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(2) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(1) -radix hexadecimal} {/e/uut/uut/register_file/reg_out(0) -radix hexadecimal}} -expand -subitemconfig {/e/uut/uut/register_file/reg_out(15) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(14) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(13) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(12) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(11) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(10) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(9) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(8) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(7) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(6) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(5) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(4) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(3) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(2) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(1) {-height 15 -radix hexadecimal} /e/uut/uut/register_file/reg_out(0) {-height 15 -radix hexadecimal}} /e/uut/uut/register_file/reg_out
add wave -noupdate -radix hexadecimal /e/uut/my_fft/clk
add wave -noupdate -radix hexadecimal /e/uut/my_fft/resetn
add wave -noupdate -radix hexadecimal /e/uut/my_fft/addr_in
add wave -noupdate -radix hexadecimal /e/uut/my_fft/mr
add wave -noupdate -radix hexadecimal /e/uut/my_fft/mw
add wave -noupdate -radix hexadecimal /e/uut/my_fft/data_in
add wave -noupdate -radix hexadecimal /e/uut/my_fft/data_out
add wave -noupdate -radix hexadecimal /e/uut/my_fft/fft_in
add wave -noupdate -radix hexadecimal /e/uut/my_fft/fft_out
add wave -noupdate -radix hexadecimal /e/uut/my_fft/samples_in
add wave -noupdate -radix hexadecimal /e/uut/my_fft/samples_out
add wave -noupdate -radix hexadecimal /e/uut/my_fft/l0
add wave -noupdate -radix hexadecimal /e/uut/my_fft/l1
add wave -noupdate -radix hexadecimal /e/uut/my_fft/l2
add wave -noupdate -radix hexadecimal /e/uut/my_fft/l3
add wave -noupdate -radix hexadecimal /e/uut/my_fft/l4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9556979 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 240
configure wave -valuecolwidth 174
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
configure wave -timelineunits ps
update
WaveRestoreZoom {9373536 ps} {10032972 ps}
