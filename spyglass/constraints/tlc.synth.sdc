###################################################################

# Created by write_sdc on Thu Nov 19 11:12:32 2009

###################################################################
set sdc_version 1.7

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -analysis_type on_chip_variation slow_125_0.81 -library tsmc_cln40g_schxd_slow_125c_0p81v
set_max_leakage_power 0
#create_clock [get_ports PCLK]  -period 5  -waveform {0 2.5}
#create_clock [get_ports otp_clk]  -period 10  -waveform {0 5}
#create_clock [get_ports sif_clk]  -period 12.5  -waveform {0 6.25}
create_clock [get_ports clk]  -period 5  -waveform {0 2.5}
#create_clock [get_ports wclk]  -period 5  -waveform {0 2.5}
#set_false_path -from [get ports reset]
