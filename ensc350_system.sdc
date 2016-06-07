create_clock -name CLK -period 25MHZ [get_ports CLOCK_50]

set_input_delay -max 10 [all_inputs] -clock CLK
set_input_delay -min 2 [all_inputs] -clock CLK

set_output_delay -max 10 [all_outputs] -clock CLK
set_output_delay -min 2 [all_outputs] -clock CLK