###############################################################################
# PYNQ-Z2 Minimal Constraints
###############################################################################

## 125 MHz Clock
set_property PACKAGE_PIN H16 [get_ports sys_clock]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clock]

create_clock -period 8.000 -name sys_clock -waveform {0.000 4.000} [get_ports sys_clock]

###############################################################################
# Reset Push Button (BTN0)
###############################################################################

set_property PACKAGE_PIN D19 [get_ports reset_rtl]
set_property IOSTANDARD LVCMOS33 [get_ports reset_rtl]
