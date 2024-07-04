# XDC constraints for Xilinx AU200/AU250/VCU1525
# AU200 part: xcu200-fsgd2104-2-e
# AU250 part: xcu250-figd2104-2-e
# VCU1525 part: xcvu9p-fsgd2104-2L-e

# General configuration
set_property CFGBVS GND                                [current_design]
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true           [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK ENABLE    [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN DISABLE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 85.0          [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP         [current_design]
set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN Enable  [current_design]

set_operating_conditions -design_power_budget 160

# System clocks
# 100 MHz
set_property -dict {PACKAGE_PIN AY23 IOSTANDARD DIFF_SSTL12} [get_ports clk_100mhz_p]
set_property -dict {PACKAGE_PIN BA23 IOSTANDARD DIFF_SSTL12} [get_ports clk_100mhz_n]
create_clock -period 10.0 -name clk_100mhz [get_ports clk_100mhz_p]

set_property -quiet CLOCK_DEDICATED_ROUTE BACKBONE [get_nets -quiet clk_100mhz_int]

# # 400 MHz (DDR 0)
# set_property -dict {PACKAGE_PIN G25  IOSTANDARD DIFF_SSTL12} [get_ports clk_400mhz_0_p]
# set_property -dict {PACKAGE_PIN G24  IOSTANDARD DIFF_SSTL12} [get_ports clk_400mhz_0_n]
# create_clock -period 2.500 -name clk_400mhz_0 [get_ports clk_400mhz_0_p]

# set_property -quiet CLOCK_DEDICATED_ROUTE BACKBONE [get_nets -quiet clk_400mhz_0_int]

# # 400 MHz (DDR 1)
# set_property -dict {PACKAGE_PIN J26  IOSTANDARD DIFF_SSTL12} [get_ports clk_400mhz_1_p]
# set_property -dict {PACKAGE_PIN H26  IOSTANDARD DIFF_SSTL12} [get_ports clk_400mhz_1_n]
# create_clock -period 2.500 -name clk_400mhz_1 [get_ports clk_400mhz_1_p]

# set_property -quiet CLOCK_DEDICATED_ROUTE BACKBONE [get_nets -quiet clk_400mhz_1_int]

# # 400 MHz (DDR 2)
# set_property -dict {PACKAGE_PIN AE31  IOSTANDARD DIFF_SSTL12} [get_ports clk_400mhz_2_p]
# set_property -dict {PACKAGE_PIN AE32  IOSTANDARD DIFF_SSTL12} [get_ports clk_400mhz_2_n]
# create_clock -period 2.500 -name clk_400mhz_2 [get_ports clk_400mhz_2_p]

# set_property -quiet CLOCK_DEDICATED_ROUTE BACKBONE [get_nets -quiet clk_400mhz_2_int]

# # 400 MHz (DDR 3)
# set_property -dict {PACKAGE_PIN AW14  IOSTANDARD DIFF_SSTL12} [get_ports clk_400mhz_3_p]
# set_property -dict {PACKAGE_PIN AW13  IOSTANDARD DIFF_SSTL12} [get_ports clk_400mhz_3_n]
# create_clock -period 2.500 -name clk_400mhz_3 [get_ports clk_400mhz_3_p]

# set_property -quiet CLOCK_DEDICATED_ROUTE BACKBONE [get_nets -quiet clk_400mhz_3_int]

# SI570 user clock
#set_property -dict {LOC AU19 IOSTANDARD LVDS} [get_ports clk_user_p]
#set_property -dict {LOC AV19 IOSTANDARD LVDS} [get_ports clk_user_n]
#create_clock -period 6.400 -name clk_user [get_ports clk_user_p]

# LEDs
# set_property -dict {LOC BC21 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[0]}]
# set_property -dict {LOC BB21 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[1]}]
# set_property -dict {LOC BA20 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {led[2]}]

# set_false_path -to [get_ports {led[*]}]
# set_output_delay 0 [get_ports {led[*]}]

set_property -dict {PACKAGE_PIN BD21 IOSTANDARD LVCMOS12} [get_ports {qsfp_led_y[0]}]
set_property -dict {PACKAGE_PIN BE21 IOSTANDARD LVCMOS12} [get_ports {qsfp_led_y[1]}]
set_property -dict {PACKAGE_PIN BE22 IOSTANDARD LVCMOS12} [get_ports {qsfp_led_g[0]}]
set_property -dict {PACKAGE_PIN BF22 IOSTANDARD LVCMOS12} [get_ports {qsfp_led_g[1]}]

set_false_path -to [get_ports {qsfp_led_g[*]}]
set_output_delay 0 [get_ports {qsfp_led_g[*]}]
set_false_path -to [get_ports {qsfp_led_y[*]}]
set_output_delay 0 [get_ports {qsfp_led_y[*]}]

# Reset button
#set_property -dict {LOC AL20 IOSTANDARD LVCMOS12} [get_ports reset]

#set_false_path -from [get_ports {reset}]
#set_input_delay 0 [get_ports {reset}]

# DIP switches
# set_property -dict {LOC AN22 IOSTANDARD LVCMOS12} [get_ports {sw[0]}]
# set_property -dict {LOC AM19 IOSTANDARD LVCMOS12} [get_ports {sw[1]}]
# set_property -dict {LOC AL19 IOSTANDARD LVCMOS12} [get_ports {sw[2]}]
# set_property -dict {LOC AP20 IOSTANDARD LVCMOS12} [get_ports {sw[3]}]

# set_false_path -from [get_ports {sw[*]}]
# set_input_delay 0 [get_ports {sw[*]}]

# UART
#set_property -dict {LOC BF18 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports uart_txd]
#set_property -dict {LOC BB20 IOSTANDARD LVCMOS12} [get_ports uart_rxd]

#set_false_path -to [get_ports {uart_txd}]
#set_output_delay 0 [get_ports {uart_txd}]
#set_false_path -from [get_ports {uart_rxd}]
#set_input_delay 0 [get_ports {uart_rxd}]

# BMC
# set_property -dict {LOC AR20 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 4} [get_ports {msp_gpio[0]}]
# set_property -dict {LOC AM20 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 4} [get_ports {msp_gpio[1]}]
# set_property -dict {LOC AM21 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 4} [get_ports {msp_gpio[2]}]
# set_property -dict {LOC AN21 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 4} [get_ports {msp_gpio[3]}]
# set_property -dict {LOC BB19 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 4} [get_ports {msp_uart_txd}]
# set_property -dict {LOC BA19 IOSTANDARD LVCMOS12} [get_ports {msp_uart_rxd}]

# set_false_path -to [get_ports {msp_uart_txd}]
# set_output_delay 0 [get_ports {msp_uart_txd}]
# set_false_path -from [get_ports {msp_gpio[*] msp_uart_rxd}]
# set_input_delay 0 [get_ports {msp_gpio[*] msp_uart_rxd}]

# QSFP28 Interfaces
set_property -dict {PACKAGE_PIN E4} [get_ports {qsfp0_rx_p[0]}] ;# MGTYRXP0_231 GTYE4_CHANNEL_X1Y48 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN E3} [get_ports {qsfp0_rx_n[0]}] ;# MGTYRXN0_231 GTYE4_CHANNEL_X1Y48 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN E9} [get_ports {qsfp0_tx_p[0]}] ;# MGTYTXP0_231 GTYE4_CHANNEL_X1Y48 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN E8} [get_ports {qsfp0_tx_n[0]}] ;# MGTYTXN0_231 GTYE4_CHANNEL_X1Y48 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN D2} [get_ports {qsfp0_rx_p[1]}] ;# MGTYRXP1_231 GTYE4_CHANNEL_X1Y49 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN D1} [get_ports {qsfp0_rx_n[1]}] ;# MGTYRXN1_231 GTYE4_CHANNEL_X1Y49 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN D7} [get_ports {qsfp0_tx_p[1]}] ;# MGTYTXP1_231 GTYE4_CHANNEL_X1Y49 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN D6} [get_ports {qsfp0_tx_n[1]}] ;# MGTYTXN1_231 GTYE4_CHANNEL_X1Y49 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN C4} [get_ports {qsfp0_rx_p[2]}] ;# MGTYRXP2_231 GTYE4_CHANNEL_X1Y50 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN C3} [get_ports {qsfp0_rx_n[2]}] ;# MGTYRXN2_231 GTYE4_CHANNEL_X1Y50 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN C9} [get_ports {qsfp0_tx_p[2]}] ;# MGTYTXP2_231 GTYE4_CHANNEL_X1Y50 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN C8} [get_ports {qsfp0_tx_n[2]}] ;# MGTYTXN2_231 GTYE4_CHANNEL_X1Y50 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN A5} [get_ports {qsfp0_rx_p[3]}] ;# MGTYRXP3_231 GTYE4_CHANNEL_X1Y51 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN A4} [get_ports {qsfp0_rx_n[3]}] ;# MGTYRXN3_231 GTYE4_CHANNEL_X1Y51 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN A9} [get_ports {qsfp0_tx_p[3]}] ;# MGTYTXP3_231 GTYE4_CHANNEL_X1Y51 / GTYE4_COMMON_X1Y12
set_property -dict {PACKAGE_PIN A8} [get_ports {qsfp0_tx_n[3]}] ;# MGTYTXN3_231 GTYE4_CHANNEL_X1Y51 / GTYE4_COMMON_X1Y12
#set_property -dict {LOC M11 } [get_ports qsfp0_mgt_refclk_0_p] ;# MGTREFCLK0P_231 from U14.4 via U43.13
#set_property -dict {LOC M10 } [get_ports qsfp0_mgt_refclk_0_n] ;# MGTREFCLK0N_231 from U14.5 via U43.14
set_property -dict {PACKAGE_PIN D11} [get_ports qsfp0_mgt_refclk_1_p] ;# MGTREFCLK1P_231 from U9.18
set_property -dict {PACKAGE_PIN D10} [get_ports qsfp0_mgt_refclk_1_n] ;# MGTREFCLK1N_231 from U9.17
# set_property -dict {LOC BE16 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports qsfp0_modsell]
set_property -dict {PACKAGE_PIN BA7  IOSTANDARD LVCMOS18} [get_ports qsfp0_resetl]
set_property -dict {PACKAGE_PIN BC7  IOSTANDARD LVCMOS18} [get_ports qsfp0_modprsl]
set_property -dict {PACKAGE_PIN BC8  IOSTANDARD LVCMOS18} [get_ports qsfp0_intl]
set_property -dict {PACKAGE_PIN BB9  IOSTANDARD LVCMOS18} [get_ports qsfp0_lpmode]
# set_property -dict {LOC AT22 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports qsfp0_refclk_reset]
# set_property -dict {LOC AT20 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {qsfp0_fs[0]}]
# set_property -dict {LOC AU22 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {qsfp0_fs[1]}]

# 156.25 MHz MGT reference clock (from SI570)
#create_clock -period 6.400 -name qsfp0_mgt_refclk_0 [get_ports qsfp0_mgt_refclk_0_p]

# 156.25 MHz MGT reference clock (from SI5335, FS = 0b01)
#create_clock -period 6.400 -name qsfp0_mgt_refclk_1 [get_ports qsfp0_mgt_refclk_1_p]

# 161.1328125 MHz MGT reference clock (from SI5335, FS = 0b10)
create_clock -period 6.206 -name qsfp0_mgt_refclk_1 [get_ports qsfp0_mgt_refclk_1_p]

set_false_path -to [get_ports {qsfp0_resetl qsfp0_lpmode}]
set_output_delay 0 [get_ports {qsfp0_resetl qsfp0_lpmode}]
set_false_path -from [get_ports {qsfp0_modprsl qsfp0_intl}]
set_input_delay 0 [get_ports {qsfp0_modprsl qsfp0_intl}]

set_property -dict {PACKAGE_PIN AA4} [get_ports {qsfp1_rx_p[0]}] ;# MGTYRXP0_230 GTYE4_CHANNEL_X1Y44 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN AA3} [get_ports {qsfp1_rx_n[0]}] ;# MGTYRXN0_230 GTYE4_CHANNEL_X1Y44 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN AA9} [get_ports {qsfp1_tx_p[0]}] ;# MGTYTXP0_230 GTYE4_CHANNEL_X1Y44 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN AA8} [get_ports {qsfp1_tx_n[0]}] ;# MGTYTXN0_230 GTYE4_CHANNEL_X1Y44 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN Y2 } [get_ports {qsfp1_rx_p[1]}] ;# MGTYRXP1_230 GTYE4_CHANNEL_X1Y45 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN Y1 } [get_ports {qsfp1_rx_n[1]}] ;# MGTYRXN1_230 GTYE4_CHANNEL_X1Y45 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN Y7 } [get_ports {qsfp1_tx_p[1]}] ;# MGTYTXP1_230 GTYE4_CHANNEL_X1Y45 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN Y6 } [get_ports {qsfp1_tx_n[1]}] ;# MGTYTXN1_230 GTYE4_CHANNEL_X1Y45 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN W4 } [get_ports {qsfp1_rx_p[2]}] ;# MGTYRXP2_230 GTYE4_CHANNEL_X1Y46 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN W3 } [get_ports {qsfp1_rx_n[2]}] ;# MGTYRXN2_230 GTYE4_CHANNEL_X1Y46 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN W9 } [get_ports {qsfp1_tx_p[2]}] ;# MGTYTXP2_230 GTYE4_CHANNEL_X1Y46 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN W8 } [get_ports {qsfp1_tx_n[2]}] ;# MGTYTXN2_230 GTYE4_CHANNEL_X1Y46 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN V2 } [get_ports {qsfp1_rx_p[3]}] ;# MGTYRXP3_230 GTYE4_CHANNEL_X1Y47 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN V1 } [get_ports {qsfp1_rx_n[3]}] ;# MGTYRXN3_230 GTYE4_CHANNEL_X1Y47 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN V7 } [get_ports {qsfp1_tx_p[3]}] ;# MGTYTXP3_230 GTYE4_CHANNEL_X1Y47 / GTYE4_COMMON_X1Y11
set_property -dict {PACKAGE_PIN V6 } [get_ports {qsfp1_tx_n[3]}] ;# MGTYTXN3_230 GTYE4_CHANNEL_X1Y47 / GTYE4_COMMON_X1Y11
#set_property -dict {LOC T11 } [get_ports qsfp1_mgt_refclk_0_p] ;# MGTREFCLK0P_230 from U14.4 via U43.15
#set_property -dict {LOC T10 } [get_ports qsfp1_mgt_refclk_0_n] ;# MGTREFCLK0N_230 from U14.5 via U43.16
set_property -dict {PACKAGE_PIN Y11} [get_ports qsfp1_mgt_refclk_1_p] ;# MGTREFCLK1P_230 from U12.18
set_property -dict {PACKAGE_PIN Y10} [get_ports qsfp1_mgt_refclk_1_n] ;# MGTREFCLK1N_230 from U12.17
# set_property -dict {LOC AY20 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports qsfp1_modsell]
set_property -dict {PACKAGE_PIN BB10 IOSTANDARD LVCMOS18} [get_ports qsfp1_resetl]
set_property -dict {PACKAGE_PIN BB11 IOSTANDARD LVCMOS18} [get_ports qsfp1_modprsl]
set_property -dict {PACKAGE_PIN BC11 IOSTANDARD LVCMOS18} [get_ports qsfp1_intl]
set_property -dict {PACKAGE_PIN BB7  IOSTANDARD LVCMOS18} [get_ports qsfp1_lpmode]
# set_property -dict {LOC AR21 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports qsfp1_refclk_reset]
# set_property -dict {LOC AR22 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {qsfp1_fs[0]}]
# set_property -dict {LOC AU20 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports {qsfp1_fs[1]}]

# 156.25 MHz MGT reference clock (from SI570)
#create_clock -period 6.400 -name qsfp1_mgt_refclk_0 [get_ports qsfp1_mgt_refclk_0_p]

# 156.25 MHz MGT reference clock (from SI5335, FS = 0b01)
#create_clock -period 6.400 -name qsfp1_mgt_refclk_1 [get_ports qsfp1_mgt_refclk_1_p]

# 161.1328125 MHz MGT reference clock (from SI5335, FS = 0b10)
create_clock -period 6.206 -name qsfp1_mgt_refclk_1 [get_ports qsfp1_mgt_refclk_1_p]

set_false_path -to [get_ports {qsfp1_resetl qsfp1_lpmode}]
set_output_delay 0 [get_ports {qsfp1_resetl qsfp1_lpmode}]
set_false_path -from [get_ports {qsfp1_modprsl qsfp1_intl}]
set_input_delay 0 [get_ports {qsfp1_modprsl qsfp1_intl}]

# I2C interface
#set_property -dict {LOC BF19 IOSTANDARD LVCMOS12 SLEW SLOW DRIVE 8} [get_ports i2c_mux_reset]
set_property -dict {PACKAGE_PIN BF12  IOSTANDARD LVCMOS18} [get_ports i2c_scl]
set_property -dict {PACKAGE_PIN BD9   IOSTANDARD LVCMOS18} [get_ports i2c_sda]

set_false_path -to [get_ports {i2c_sda i2c_scl}]
set_output_delay 0 [get_ports {i2c_sda i2c_scl}]
set_false_path -from [get_ports {i2c_sda i2c_scl}]
set_input_delay 0 [get_ports {i2c_sda i2c_scl}]

# PCIe Interface
set_property -dict {PACKAGE_PIN AF2  } [get_ports {pcie_rx_p[0]}]  ;# MGTYRXP3_227 GTYE4_CHANNEL_X1Y35 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AF1  } [get_ports {pcie_rx_n[0]}]  ;# MGTYRXN3_227 GTYE4_CHANNEL_X1Y35 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AF7  } [get_ports {pcie_tx_p[0]}]  ;# MGTYTXP3_227 GTYE4_CHANNEL_X1Y35 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AF6  } [get_ports {pcie_tx_n[0]}]  ;# MGTYTXN3_227 GTYE4_CHANNEL_X1Y35 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AG4  } [get_ports {pcie_rx_p[1]}]  ;# MGTYRXP2_227 GTYE4_CHANNEL_X1Y34 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AG3  } [get_ports {pcie_rx_n[1]}]  ;# MGTYRXN2_227 GTYE4_CHANNEL_X1Y34 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AG9  } [get_ports {pcie_tx_p[1]}]  ;# MGTYTXP2_227 GTYE4_CHANNEL_X1Y34 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AG8  } [get_ports {pcie_tx_n[1]}]  ;# MGTYTXN2_227 GTYE4_CHANNEL_X1Y34 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AH2  } [get_ports {pcie_rx_p[2]}]  ;# MGTYRXP1_227 GTYE4_CHANNEL_X1Y33 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AH1  } [get_ports {pcie_rx_n[2]}]  ;# MGTYRXN1_227 GTYE4_CHANNEL_X1Y33 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AH7  } [get_ports {pcie_tx_p[2]}]  ;# MGTYTXP1_227 GTYE4_CHANNEL_X1Y33 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AH6  } [get_ports {pcie_tx_n[2]}]  ;# MGTYTXN1_227 GTYE4_CHANNEL_X1Y33 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AJ4  } [get_ports {pcie_rx_p[3]}]  ;# MGTYRXP0_227 GTYE4_CHANNEL_X1Y32 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AJ3  } [get_ports {pcie_rx_n[3]}]  ;# MGTYRXN0_227 GTYE4_CHANNEL_X1Y32 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AJ9  } [get_ports {pcie_tx_p[3]}]  ;# MGTYTXP0_227 GTYE4_CHANNEL_X1Y32 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AJ8  } [get_ports {pcie_tx_n[3]}]  ;# MGTYTXN0_227 GTYE4_CHANNEL_X1Y32 / GTYE4_COMMON_X1Y8
set_property -dict {PACKAGE_PIN AK2  } [get_ports {pcie_rx_p[4]}]  ;# MGTYRXP3_226 GTYE4_CHANNEL_X1Y31 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AK1  } [get_ports {pcie_rx_n[4]}]  ;# MGTYRXN3_226 GTYE4_CHANNEL_X1Y31 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AK7  } [get_ports {pcie_tx_p[4]}]  ;# MGTYTXP3_226 GTYE4_CHANNEL_X1Y31 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AK6  } [get_ports {pcie_tx_n[4]}]  ;# MGTYTXN3_226 GTYE4_CHANNEL_X1Y31 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AL4  } [get_ports {pcie_rx_p[5]}]  ;# MGTYRXP2_226 GTYE4_CHANNEL_X1Y30 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AL3  } [get_ports {pcie_rx_n[5]}]  ;# MGTYRXN2_226 GTYE4_CHANNEL_X1Y30 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AL9  } [get_ports {pcie_tx_p[5]}]  ;# MGTYTXP2_226 GTYE4_CHANNEL_X1Y30 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AL8  } [get_ports {pcie_tx_n[5]}]  ;# MGTYTXN2_226 GTYE4_CHANNEL_X1Y30 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AM2  } [get_ports {pcie_rx_p[6]}]  ;# MGTYRXP1_226 GTYE4_CHANNEL_X1Y29 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AM1  } [get_ports {pcie_rx_n[6]}]  ;# MGTYRXN1_226 GTYE4_CHANNEL_X1Y29 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AM7  } [get_ports {pcie_tx_p[6]}]  ;# MGTYTXP1_226 GTYE4_CHANNEL_X1Y29 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AM6  } [get_ports {pcie_tx_n[6]}]  ;# MGTYTXN1_226 GTYE4_CHANNEL_X1Y29 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AN4  } [get_ports {pcie_rx_p[7]}]  ;# MGTYRXP0_226 GTYE4_CHANNEL_X1Y28 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AN3  } [get_ports {pcie_rx_n[7]}]  ;# MGTYRXN0_226 GTYE4_CHANNEL_X1Y28 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AN9  } [get_ports {pcie_tx_p[7]}]  ;# MGTYTXP0_226 GTYE4_CHANNEL_X1Y28 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AN8  } [get_ports {pcie_tx_n[7]}]  ;# MGTYTXN0_226 GTYE4_CHANNEL_X1Y28 / GTYE4_COMMON_X1Y7
set_property -dict {PACKAGE_PIN AP2  } [get_ports {pcie_rx_p[8]}]  ;# MGTYRXP3_225 GTYE4_CHANNEL_X1Y27 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AP1  } [get_ports {pcie_rx_n[8]}]  ;# MGTYRXN3_225 GTYE4_CHANNEL_X1Y27 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AP7  } [get_ports {pcie_tx_p[8]}]  ;# MGTYTXP3_225 GTYE4_CHANNEL_X1Y27 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AP6  } [get_ports {pcie_tx_n[8]}]  ;# MGTYTXN3_225 GTYE4_CHANNEL_X1Y27 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AR4  } [get_ports {pcie_rx_p[9]}]  ;# MGTYRXP2_225 GTYE4_CHANNEL_X1Y26 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AR3  } [get_ports {pcie_rx_n[9]}]  ;# MGTYRXN2_225 GTYE4_CHANNEL_X1Y26 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AR9  } [get_ports {pcie_tx_p[9]}]  ;# MGTYTXP2_225 GTYE4_CHANNEL_X1Y26 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AR8  } [get_ports {pcie_tx_n[9]}]  ;# MGTYTXN2_225 GTYE4_CHANNEL_X1Y26 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AT2  } [get_ports {pcie_rx_p[10]}] ;# MGTYRXP1_225 GTYE4_CHANNEL_X1Y25 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AT1  } [get_ports {pcie_rx_n[10]}] ;# MGTYRXN1_225 GTYE4_CHANNEL_X1Y25 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AT7  } [get_ports {pcie_tx_p[10]}] ;# MGTYTXP1_225 GTYE4_CHANNEL_X1Y25 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AT6  } [get_ports {pcie_tx_n[10]}] ;# MGTYTXN1_225 GTYE4_CHANNEL_X1Y25 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AU4  } [get_ports {pcie_rx_p[11]}] ;# MGTYRXP0_225 GTYE4_CHANNEL_X1Y24 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AU3  } [get_ports {pcie_rx_n[11]}] ;# MGTYRXN0_225 GTYE4_CHANNEL_X1Y24 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AU9  } [get_ports {pcie_tx_p[11]}] ;# MGTYTXP0_225 GTYE4_CHANNEL_X1Y24 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AU8  } [get_ports {pcie_tx_n[11]}] ;# MGTYTXN0_225 GTYE4_CHANNEL_X1Y24 / GTYE4_COMMON_X1Y6
set_property -dict {PACKAGE_PIN AV2  } [get_ports {pcie_rx_p[12]}] ;# MGTYRXP3_224 GTYE4_CHANNEL_X1Y23 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN AV1  } [get_ports {pcie_rx_n[12]}] ;# MGTYRXN3_224 GTYE4_CHANNEL_X1Y23 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN AV7  } [get_ports {pcie_tx_p[12]}] ;# MGTYTXP3_224 GTYE4_CHANNEL_X1Y23 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN AV6  } [get_ports {pcie_tx_n[12]}] ;# MGTYTXN3_224 GTYE4_CHANNEL_X1Y23 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN AW4  } [get_ports {pcie_rx_p[13]}] ;# MGTYRXP2_224 GTYE4_CHANNEL_X1Y22 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN AW3  } [get_ports {pcie_rx_n[13]}] ;# MGTYRXN2_224 GTYE4_CHANNEL_X1Y22 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN BB5  } [get_ports {pcie_tx_p[13]}] ;# MGTYTXP2_224 GTYE4_CHANNEL_X1Y22 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN BB4  } [get_ports {pcie_tx_n[13]}] ;# MGTYTXN2_224 GTYE4_CHANNEL_X1Y22 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN BA2  } [get_ports {pcie_rx_p[14]}] ;# MGTYRXP1_224 GTYE4_CHANNEL_X1Y21 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN BA1  } [get_ports {pcie_rx_n[14]}] ;# MGTYRXN1_224 GTYE4_CHANNEL_X1Y21 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN BD5  } [get_ports {pcie_tx_p[14]}] ;# MGTYTXP1_224 GTYE4_CHANNEL_X1Y21 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN BD4  } [get_ports {pcie_tx_n[14]}] ;# MGTYTXN1_224 GTYE4_CHANNEL_X1Y21 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN BC2  } [get_ports {pcie_rx_p[15]}] ;# MGTYRXP0_224 GTYE4_CHANNEL_X1Y20 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN BC1  } [get_ports {pcie_rx_n[15]}] ;# MGTYRXN0_224 GTYE4_CHANNEL_X1Y20 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN BF5  } [get_ports {pcie_tx_p[15]}] ;# MGTYTXP0_224 GTYE4_CHANNEL_X1Y20 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN BF4  } [get_ports {pcie_tx_n[15]}] ;# MGTYTXN0_224 GTYE4_CHANNEL_X1Y20 / GTYE4_COMMON_X1Y5
set_property -dict {PACKAGE_PIN AK11 } [get_ports pcie_refclk_p] ;# MGTREFCLK0P_226
set_property -dict {PACKAGE_PIN AK10 } [get_ports pcie_refclk_n] ;# MGTREFCLK0N_226
set_property -dict {PACKAGE_PIN AR26 IOSTANDARD LVCMOS12} [get_ports pcie_reset_n]

# 100 MHz MGT reference clock
create_clock -period 10 -name pcie_mgt_refclk_1 [get_ports pcie_refclk_p]

set_false_path -from [get_ports {pcie_reset_n}]
set_input_delay 0 [get_ports {pcie_reset_n}]
