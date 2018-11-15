-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "11/15/2018 19:22:17"

-- 
-- Device: Altera EP2C5T144C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sync_cnt_right IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	en : IN std_logic;
	clr : IN std_logic;
	tc : OUT std_logic;
	cnt : BUFFER std_logic_vector(8 DOWNTO 0)
	);
END sync_cnt_right;

-- Design Ports Information
-- tc	=>  Location: PIN_42,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cnt[0]	=>  Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cnt[1]	=>  Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cnt[2]	=>  Location: PIN_32,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cnt[3]	=>  Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cnt[4]	=>  Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cnt[5]	=>  Location: PIN_25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cnt[6]	=>  Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cnt[7]	=>  Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cnt[8]	=>  Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rst_n	=>  Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clr	=>  Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- en	=>  Location: PIN_22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF sync_cnt_right IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_clr : std_logic;
SIGNAL ww_tc : std_logic;
SIGNAL ww_cnt : std_logic_vector(8 DOWNTO 0);
SIGNAL \rst_n~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \counting_process:cnt_var[9]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[14]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[20]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[25]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[9]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[14]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[20]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[25]~1_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[0]~1_combout\ : std_logic;
SIGNAL \rst_n~combout\ : std_logic;
SIGNAL \rst_n~clkctrl_outclk\ : std_logic;
SIGNAL \counting_process:cnt_var[8]~4\ : std_logic;
SIGNAL \counting_process:cnt_var[9]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[10]~1_combout\ : std_logic;
SIGNAL \clr~combout\ : std_logic;
SIGNAL \en~combout\ : std_logic;
SIGNAL \counting_process:cnt_var[8]~2_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[10]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[10]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[11]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[11]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[11]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[12]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[12]~regout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[12]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[13]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[13]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[13]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[14]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[15]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[15]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[15]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[16]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[16]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[16]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[17]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[17]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[17]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[18]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[19]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[19]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[19]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[20]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[21]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[22]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[22]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[22]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[23]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[24]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[24]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[24]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[25]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[26]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[26]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[26]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[27]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[28]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[28]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[28]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[29]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[29]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[29]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[30]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[30]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[18]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[18]~regout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[27]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[27]~regout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[23]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[23]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[21]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[21]~regout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[8]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[0]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[0]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[1]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[1]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[1]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[2]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[3]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[3]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[3]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[4]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[5]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[6]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[6]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[6]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[7]~2\ : std_logic;
SIGNAL \counting_process:cnt_var[8]~3_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[8]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[2]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[2]~regout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[7]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[7]~regout\ : std_logic;
SIGNAL \counting_process:cnt_var[5]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[5]~regout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \counting_process:cnt_var[4]~1_combout\ : std_logic;
SIGNAL \counting_process:cnt_var[4]~regout\ : std_logic;
SIGNAL \ALT_INV_rst_n~clkctrl_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
ww_en <= en;
ww_clr <= clr;
tc <= ww_tc;
cnt <= ww_cnt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst_n~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \rst_n~combout\);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\ALT_INV_rst_n~clkctrl_outclk\ <= NOT \rst_n~clkctrl_outclk\;

-- Location: LCFF_X1_Y5_N21
\counting_process:cnt_var[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[9]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[9]~regout\);

-- Location: LCFF_X2_Y4_N23
\counting_process:cnt_var[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \counting_process:cnt_var[14]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	sload => VCC,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[14]~regout\);

-- Location: LCFF_X1_Y4_N11
\counting_process:cnt_var[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[20]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[20]~regout\);

-- Location: LCFF_X1_Y4_N21
\counting_process:cnt_var[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[25]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[25]~regout\);

-- Location: LCCOMB_X1_Y5_N20
\counting_process:cnt_var[9]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[9]~1_combout\ = (\counting_process:cnt_var[9]~regout\ & (!\counting_process:cnt_var[8]~4\)) # (!\counting_process:cnt_var[9]~regout\ & ((\counting_process:cnt_var[8]~4\) # (GND)))
-- \counting_process:cnt_var[9]~2\ = CARRY((!\counting_process:cnt_var[8]~4\) # (!\counting_process:cnt_var[9]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[9]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[8]~4\,
	combout => \counting_process:cnt_var[9]~1_combout\,
	cout => \counting_process:cnt_var[9]~2\);

-- Location: LCCOMB_X1_Y5_N30
\counting_process:cnt_var[14]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[14]~1_combout\ = (\counting_process:cnt_var[14]~regout\ & (\counting_process:cnt_var[13]~2\ $ (GND))) # (!\counting_process:cnt_var[14]~regout\ & (!\counting_process:cnt_var[13]~2\ & VCC))
-- \counting_process:cnt_var[14]~2\ = CARRY((\counting_process:cnt_var[14]~regout\ & !\counting_process:cnt_var[13]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[14]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[13]~2\,
	combout => \counting_process:cnt_var[14]~1_combout\,
	cout => \counting_process:cnt_var[14]~2\);

-- Location: LCCOMB_X1_Y4_N10
\counting_process:cnt_var[20]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[20]~1_combout\ = (\counting_process:cnt_var[20]~regout\ & (\counting_process:cnt_var[19]~2\ $ (GND))) # (!\counting_process:cnt_var[20]~regout\ & (!\counting_process:cnt_var[19]~2\ & VCC))
-- \counting_process:cnt_var[20]~2\ = CARRY((\counting_process:cnt_var[20]~regout\ & !\counting_process:cnt_var[19]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[20]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[19]~2\,
	combout => \counting_process:cnt_var[20]~1_combout\,
	cout => \counting_process:cnt_var[20]~2\);

-- Location: LCCOMB_X1_Y4_N20
\counting_process:cnt_var[25]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[25]~1_combout\ = (\counting_process:cnt_var[25]~regout\ & (!\counting_process:cnt_var[24]~2\)) # (!\counting_process:cnt_var[25]~regout\ & ((\counting_process:cnt_var[24]~2\) # (GND)))
-- \counting_process:cnt_var[25]~2\ = CARRY((!\counting_process:cnt_var[24]~2\) # (!\counting_process:cnt_var[25]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[25]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[24]~2\,
	combout => \counting_process:cnt_var[25]~1_combout\,
	cout => \counting_process:cnt_var[25]~2\);

-- Location: LCCOMB_X2_Y4_N10
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (\counting_process:cnt_var[15]~regout\) # ((\counting_process:cnt_var[16]~regout\) # ((\counting_process:cnt_var[13]~regout\) # (\counting_process:cnt_var[14]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[15]~regout\,
	datab => \counting_process:cnt_var[16]~regout\,
	datac => \counting_process:cnt_var[13]~regout\,
	datad => \counting_process:cnt_var[14]~regout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X1_Y5_N2
\counting_process:cnt_var[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[0]~1_combout\ = \counting_process:cnt_var[0]~regout\ $ (VCC)
-- \counting_process:cnt_var[0]~2\ = CARRY(\counting_process:cnt_var[0]~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[0]~regout\,
	datad => VCC,
	combout => \counting_process:cnt_var[0]~1_combout\,
	cout => \counting_process:cnt_var[0]~2\);

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst_n~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rst_n,
	combout => \rst_n~combout\);

-- Location: CLKCTRL_G1
\rst_n~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst_n~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst_n~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y5_N18
\counting_process:cnt_var[8]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[8]~3_combout\ = (\counting_process:cnt_var[8]~regout\ & (\counting_process:cnt_var[7]~2\ $ (GND))) # (!\counting_process:cnt_var[8]~regout\ & (!\counting_process:cnt_var[7]~2\ & VCC))
-- \counting_process:cnt_var[8]~4\ = CARRY((\counting_process:cnt_var[8]~regout\ & !\counting_process:cnt_var[7]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[8]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[7]~2\,
	combout => \counting_process:cnt_var[8]~3_combout\,
	cout => \counting_process:cnt_var[8]~4\);

-- Location: LCCOMB_X1_Y5_N22
\counting_process:cnt_var[10]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[10]~1_combout\ = (\counting_process:cnt_var[10]~regout\ & (\counting_process:cnt_var[9]~2\ $ (GND))) # (!\counting_process:cnt_var[10]~regout\ & (!\counting_process:cnt_var[9]~2\ & VCC))
-- \counting_process:cnt_var[10]~2\ = CARRY((\counting_process:cnt_var[10]~regout\ & !\counting_process:cnt_var[9]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[10]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[9]~2\,
	combout => \counting_process:cnt_var[10]~1_combout\,
	cout => \counting_process:cnt_var[10]~2\);

-- Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clr~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clr,
	combout => \clr~combout\);

-- Location: PIN_22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\en~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_en,
	combout => \en~combout\);

-- Location: LCCOMB_X1_Y6_N16
\counting_process:cnt_var[8]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[8]~2_combout\ = (\clr~combout\) # (\en~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clr~combout\,
	datad => \en~combout\,
	combout => \counting_process:cnt_var[8]~2_combout\);

-- Location: LCFF_X1_Y5_N23
\counting_process:cnt_var[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[10]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[10]~regout\);

-- Location: LCCOMB_X1_Y5_N24
\counting_process:cnt_var[11]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[11]~1_combout\ = (\counting_process:cnt_var[11]~regout\ & (!\counting_process:cnt_var[10]~2\)) # (!\counting_process:cnt_var[11]~regout\ & ((\counting_process:cnt_var[10]~2\) # (GND)))
-- \counting_process:cnt_var[11]~2\ = CARRY((!\counting_process:cnt_var[10]~2\) # (!\counting_process:cnt_var[11]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[11]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[10]~2\,
	combout => \counting_process:cnt_var[11]~1_combout\,
	cout => \counting_process:cnt_var[11]~2\);

-- Location: LCFF_X1_Y5_N25
\counting_process:cnt_var[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[11]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[11]~regout\);

-- Location: LCCOMB_X1_Y5_N26
\counting_process:cnt_var[12]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[12]~1_combout\ = (\counting_process:cnt_var[12]~regout\ & (\counting_process:cnt_var[11]~2\ $ (GND))) # (!\counting_process:cnt_var[12]~regout\ & (!\counting_process:cnt_var[11]~2\ & VCC))
-- \counting_process:cnt_var[12]~2\ = CARRY((\counting_process:cnt_var[12]~regout\ & !\counting_process:cnt_var[11]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[12]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[11]~2\,
	combout => \counting_process:cnt_var[12]~1_combout\,
	cout => \counting_process:cnt_var[12]~2\);

-- Location: LCFF_X1_Y5_N27
\counting_process:cnt_var[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[12]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[12]~regout\);

-- Location: LCCOMB_X2_Y5_N24
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\counting_process:cnt_var[9]~regout\) # ((\counting_process:cnt_var[11]~regout\) # ((\counting_process:cnt_var[12]~regout\) # (\counting_process:cnt_var[10]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[9]~regout\,
	datab => \counting_process:cnt_var[11]~regout\,
	datac => \counting_process:cnt_var[12]~regout\,
	datad => \counting_process:cnt_var[10]~regout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X1_Y5_N28
\counting_process:cnt_var[13]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[13]~1_combout\ = (\counting_process:cnt_var[13]~regout\ & (!\counting_process:cnt_var[12]~2\)) # (!\counting_process:cnt_var[13]~regout\ & ((\counting_process:cnt_var[12]~2\) # (GND)))
-- \counting_process:cnt_var[13]~2\ = CARRY((!\counting_process:cnt_var[12]~2\) # (!\counting_process:cnt_var[13]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[13]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[12]~2\,
	combout => \counting_process:cnt_var[13]~1_combout\,
	cout => \counting_process:cnt_var[13]~2\);

-- Location: LCFF_X2_Y4_N25
\counting_process:cnt_var[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \counting_process:cnt_var[13]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	sload => VCC,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[13]~regout\);

-- Location: LCCOMB_X1_Y4_N0
\counting_process:cnt_var[15]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[15]~1_combout\ = (\counting_process:cnt_var[15]~regout\ & (!\counting_process:cnt_var[14]~2\)) # (!\counting_process:cnt_var[15]~regout\ & ((\counting_process:cnt_var[14]~2\) # (GND)))
-- \counting_process:cnt_var[15]~2\ = CARRY((!\counting_process:cnt_var[14]~2\) # (!\counting_process:cnt_var[15]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[15]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[14]~2\,
	combout => \counting_process:cnt_var[15]~1_combout\,
	cout => \counting_process:cnt_var[15]~2\);

-- Location: LCFF_X2_Y4_N21
\counting_process:cnt_var[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \counting_process:cnt_var[15]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	sload => VCC,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[15]~regout\);

-- Location: LCCOMB_X1_Y4_N2
\counting_process:cnt_var[16]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[16]~1_combout\ = (\counting_process:cnt_var[16]~regout\ & (\counting_process:cnt_var[15]~2\ $ (GND))) # (!\counting_process:cnt_var[16]~regout\ & (!\counting_process:cnt_var[15]~2\ & VCC))
-- \counting_process:cnt_var[16]~2\ = CARRY((\counting_process:cnt_var[16]~regout\ & !\counting_process:cnt_var[15]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[16]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[15]~2\,
	combout => \counting_process:cnt_var[16]~1_combout\,
	cout => \counting_process:cnt_var[16]~2\);

-- Location: LCFF_X2_Y4_N31
\counting_process:cnt_var[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \counting_process:cnt_var[16]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	sload => VCC,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[16]~regout\);

-- Location: LCCOMB_X1_Y4_N4
\counting_process:cnt_var[17]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[17]~1_combout\ = (\counting_process:cnt_var[17]~regout\ & (!\counting_process:cnt_var[16]~2\)) # (!\counting_process:cnt_var[17]~regout\ & ((\counting_process:cnt_var[16]~2\) # (GND)))
-- \counting_process:cnt_var[17]~2\ = CARRY((!\counting_process:cnt_var[16]~2\) # (!\counting_process:cnt_var[17]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[17]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[16]~2\,
	combout => \counting_process:cnt_var[17]~1_combout\,
	cout => \counting_process:cnt_var[17]~2\);

-- Location: LCFF_X2_Y4_N9
\counting_process:cnt_var[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \counting_process:cnt_var[17]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	sload => VCC,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[17]~regout\);

-- Location: LCCOMB_X1_Y4_N6
\counting_process:cnt_var[18]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[18]~1_combout\ = (\counting_process:cnt_var[18]~regout\ & (\counting_process:cnt_var[17]~2\ $ (GND))) # (!\counting_process:cnt_var[18]~regout\ & (!\counting_process:cnt_var[17]~2\ & VCC))
-- \counting_process:cnt_var[18]~2\ = CARRY((\counting_process:cnt_var[18]~regout\ & !\counting_process:cnt_var[17]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[18]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[17]~2\,
	combout => \counting_process:cnt_var[18]~1_combout\,
	cout => \counting_process:cnt_var[18]~2\);

-- Location: LCCOMB_X1_Y4_N8
\counting_process:cnt_var[19]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[19]~1_combout\ = (\counting_process:cnt_var[19]~regout\ & (!\counting_process:cnt_var[18]~2\)) # (!\counting_process:cnt_var[19]~regout\ & ((\counting_process:cnt_var[18]~2\) # (GND)))
-- \counting_process:cnt_var[19]~2\ = CARRY((!\counting_process:cnt_var[18]~2\) # (!\counting_process:cnt_var[19]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[19]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[18]~2\,
	combout => \counting_process:cnt_var[19]~1_combout\,
	cout => \counting_process:cnt_var[19]~2\);

-- Location: LCFF_X1_Y4_N9
\counting_process:cnt_var[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[19]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[19]~regout\);

-- Location: LCCOMB_X1_Y4_N12
\counting_process:cnt_var[21]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[21]~1_combout\ = (\counting_process:cnt_var[21]~regout\ & (!\counting_process:cnt_var[20]~2\)) # (!\counting_process:cnt_var[21]~regout\ & ((\counting_process:cnt_var[20]~2\) # (GND)))
-- \counting_process:cnt_var[21]~2\ = CARRY((!\counting_process:cnt_var[20]~2\) # (!\counting_process:cnt_var[21]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[21]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[20]~2\,
	combout => \counting_process:cnt_var[21]~1_combout\,
	cout => \counting_process:cnt_var[21]~2\);

-- Location: LCCOMB_X1_Y4_N14
\counting_process:cnt_var[22]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[22]~1_combout\ = (\counting_process:cnt_var[22]~regout\ & (\counting_process:cnt_var[21]~2\ $ (GND))) # (!\counting_process:cnt_var[22]~regout\ & (!\counting_process:cnt_var[21]~2\ & VCC))
-- \counting_process:cnt_var[22]~2\ = CARRY((\counting_process:cnt_var[22]~regout\ & !\counting_process:cnt_var[21]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[22]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[21]~2\,
	combout => \counting_process:cnt_var[22]~1_combout\,
	cout => \counting_process:cnt_var[22]~2\);

-- Location: LCFF_X1_Y4_N15
\counting_process:cnt_var[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[22]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[22]~regout\);

-- Location: LCCOMB_X1_Y4_N16
\counting_process:cnt_var[23]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[23]~1_combout\ = (\counting_process:cnt_var[23]~regout\ & (!\counting_process:cnt_var[22]~2\)) # (!\counting_process:cnt_var[23]~regout\ & ((\counting_process:cnt_var[22]~2\) # (GND)))
-- \counting_process:cnt_var[23]~2\ = CARRY((!\counting_process:cnt_var[22]~2\) # (!\counting_process:cnt_var[23]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[23]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[22]~2\,
	combout => \counting_process:cnt_var[23]~1_combout\,
	cout => \counting_process:cnt_var[23]~2\);

-- Location: LCCOMB_X1_Y4_N18
\counting_process:cnt_var[24]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[24]~1_combout\ = (\counting_process:cnt_var[24]~regout\ & (\counting_process:cnt_var[23]~2\ $ (GND))) # (!\counting_process:cnt_var[24]~regout\ & (!\counting_process:cnt_var[23]~2\ & VCC))
-- \counting_process:cnt_var[24]~2\ = CARRY((\counting_process:cnt_var[24]~regout\ & !\counting_process:cnt_var[23]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[24]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[23]~2\,
	combout => \counting_process:cnt_var[24]~1_combout\,
	cout => \counting_process:cnt_var[24]~2\);

-- Location: LCFF_X1_Y4_N19
\counting_process:cnt_var[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[24]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[24]~regout\);

-- Location: LCCOMB_X1_Y4_N22
\counting_process:cnt_var[26]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[26]~1_combout\ = (\counting_process:cnt_var[26]~regout\ & (\counting_process:cnt_var[25]~2\ $ (GND))) # (!\counting_process:cnt_var[26]~regout\ & (!\counting_process:cnt_var[25]~2\ & VCC))
-- \counting_process:cnt_var[26]~2\ = CARRY((\counting_process:cnt_var[26]~regout\ & !\counting_process:cnt_var[25]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[26]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[25]~2\,
	combout => \counting_process:cnt_var[26]~1_combout\,
	cout => \counting_process:cnt_var[26]~2\);

-- Location: LCFF_X1_Y4_N23
\counting_process:cnt_var[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[26]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[26]~regout\);

-- Location: LCCOMB_X1_Y4_N24
\counting_process:cnt_var[27]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[27]~1_combout\ = (\counting_process:cnt_var[27]~regout\ & (!\counting_process:cnt_var[26]~2\)) # (!\counting_process:cnt_var[27]~regout\ & ((\counting_process:cnt_var[26]~2\) # (GND)))
-- \counting_process:cnt_var[27]~2\ = CARRY((!\counting_process:cnt_var[26]~2\) # (!\counting_process:cnt_var[27]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[27]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[26]~2\,
	combout => \counting_process:cnt_var[27]~1_combout\,
	cout => \counting_process:cnt_var[27]~2\);

-- Location: LCCOMB_X1_Y4_N26
\counting_process:cnt_var[28]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[28]~1_combout\ = (\counting_process:cnt_var[28]~regout\ & (\counting_process:cnt_var[27]~2\ $ (GND))) # (!\counting_process:cnt_var[28]~regout\ & (!\counting_process:cnt_var[27]~2\ & VCC))
-- \counting_process:cnt_var[28]~2\ = CARRY((\counting_process:cnt_var[28]~regout\ & !\counting_process:cnt_var[27]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[28]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[27]~2\,
	combout => \counting_process:cnt_var[28]~1_combout\,
	cout => \counting_process:cnt_var[28]~2\);

-- Location: LCFF_X1_Y4_N27
\counting_process:cnt_var[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[28]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[28]~regout\);

-- Location: LCCOMB_X1_Y4_N28
\counting_process:cnt_var[29]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[29]~1_combout\ = (\counting_process:cnt_var[29]~regout\ & (!\counting_process:cnt_var[28]~2\)) # (!\counting_process:cnt_var[29]~regout\ & ((\counting_process:cnt_var[28]~2\) # (GND)))
-- \counting_process:cnt_var[29]~2\ = CARRY((!\counting_process:cnt_var[28]~2\) # (!\counting_process:cnt_var[29]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[29]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[28]~2\,
	combout => \counting_process:cnt_var[29]~1_combout\,
	cout => \counting_process:cnt_var[29]~2\);

-- Location: LCFF_X1_Y4_N29
\counting_process:cnt_var[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[29]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[29]~regout\);

-- Location: LCCOMB_X1_Y4_N30
\counting_process:cnt_var[30]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[30]~1_combout\ = \counting_process:cnt_var[29]~2\ $ (!\counting_process:cnt_var[30]~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \counting_process:cnt_var[30]~regout\,
	cin => \counting_process:cnt_var[29]~2\,
	combout => \counting_process:cnt_var[30]~1_combout\);

-- Location: LCFF_X1_Y4_N31
\counting_process:cnt_var[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[30]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[30]~regout\);

-- Location: LCFF_X1_Y4_N7
\counting_process:cnt_var[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[18]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[18]~regout\);

-- Location: LCCOMB_X2_Y4_N0
\Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (\counting_process:cnt_var[20]~regout\) # ((\counting_process:cnt_var[17]~regout\) # ((\counting_process:cnt_var[19]~regout\) # (\counting_process:cnt_var[18]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[20]~regout\,
	datab => \counting_process:cnt_var[17]~regout\,
	datac => \counting_process:cnt_var[19]~regout\,
	datad => \counting_process:cnt_var[18]~regout\,
	combout => \Equal0~2_combout\);

-- Location: LCFF_X1_Y4_N25
\counting_process:cnt_var[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[27]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[27]~regout\);

-- Location: LCCOMB_X2_Y4_N16
\Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\counting_process:cnt_var[25]~regout\) # ((\counting_process:cnt_var[26]~regout\) # ((\counting_process:cnt_var[27]~regout\) # (\counting_process:cnt_var[28]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[25]~regout\,
	datab => \counting_process:cnt_var[26]~regout\,
	datac => \counting_process:cnt_var[27]~regout\,
	datad => \counting_process:cnt_var[28]~regout\,
	combout => \Equal0~4_combout\);

-- Location: LCFF_X1_Y4_N17
\counting_process:cnt_var[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[23]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[23]~regout\);

-- Location: LCFF_X1_Y4_N13
\counting_process:cnt_var[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[21]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[21]~regout\);

-- Location: LCCOMB_X2_Y4_N6
\Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (\counting_process:cnt_var[22]~regout\) # ((\counting_process:cnt_var[23]~regout\) # ((\counting_process:cnt_var[21]~regout\) # (\counting_process:cnt_var[24]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[22]~regout\,
	datab => \counting_process:cnt_var[23]~regout\,
	datac => \counting_process:cnt_var[21]~regout\,
	datad => \counting_process:cnt_var[24]~regout\,
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X2_Y4_N2
\Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (\Equal0~1_combout\) # ((\Equal0~2_combout\) # ((\Equal0~4_combout\) # (\Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~2_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~3_combout\,
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X2_Y4_N12
\Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (\counting_process:cnt_var[29]~regout\) # ((\counting_process:cnt_var[30]~regout\) # (\Equal0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[29]~regout\,
	datac => \counting_process:cnt_var[30]~regout\,
	datad => \Equal0~5_combout\,
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X2_Y4_N26
\counting_process:cnt_var[8]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[8]~1_combout\ = (\clr~combout\) # ((\Equal1~2_combout\ & (!\Equal0~0_combout\ & !\Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clr~combout\,
	datab => \Equal1~2_combout\,
	datac => \Equal0~0_combout\,
	datad => \Equal0~6_combout\,
	combout => \counting_process:cnt_var[8]~1_combout\);

-- Location: LCFF_X1_Y5_N3
\counting_process:cnt_var[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[0]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[0]~regout\);

-- Location: LCCOMB_X1_Y5_N4
\counting_process:cnt_var[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[1]~1_combout\ = (\counting_process:cnt_var[1]~regout\ & (!\counting_process:cnt_var[0]~2\)) # (!\counting_process:cnt_var[1]~regout\ & ((\counting_process:cnt_var[0]~2\) # (GND)))
-- \counting_process:cnt_var[1]~2\ = CARRY((!\counting_process:cnt_var[0]~2\) # (!\counting_process:cnt_var[1]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[1]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[0]~2\,
	combout => \counting_process:cnt_var[1]~1_combout\,
	cout => \counting_process:cnt_var[1]~2\);

-- Location: LCFF_X1_Y5_N5
\counting_process:cnt_var[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[1]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[1]~regout\);

-- Location: LCCOMB_X1_Y5_N6
\counting_process:cnt_var[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[2]~1_combout\ = (\counting_process:cnt_var[2]~regout\ & (\counting_process:cnt_var[1]~2\ $ (GND))) # (!\counting_process:cnt_var[2]~regout\ & (!\counting_process:cnt_var[1]~2\ & VCC))
-- \counting_process:cnt_var[2]~2\ = CARRY((\counting_process:cnt_var[2]~regout\ & !\counting_process:cnt_var[1]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[2]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[1]~2\,
	combout => \counting_process:cnt_var[2]~1_combout\,
	cout => \counting_process:cnt_var[2]~2\);

-- Location: LCCOMB_X1_Y5_N8
\counting_process:cnt_var[3]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[3]~1_combout\ = (\counting_process:cnt_var[3]~regout\ & (!\counting_process:cnt_var[2]~2\)) # (!\counting_process:cnt_var[3]~regout\ & ((\counting_process:cnt_var[2]~2\) # (GND)))
-- \counting_process:cnt_var[3]~2\ = CARRY((!\counting_process:cnt_var[2]~2\) # (!\counting_process:cnt_var[3]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[3]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[2]~2\,
	combout => \counting_process:cnt_var[3]~1_combout\,
	cout => \counting_process:cnt_var[3]~2\);

-- Location: LCFF_X1_Y5_N9
\counting_process:cnt_var[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[3]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[3]~regout\);

-- Location: LCCOMB_X1_Y5_N10
\counting_process:cnt_var[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[4]~1_combout\ = (\counting_process:cnt_var[4]~regout\ & (\counting_process:cnt_var[3]~2\ $ (GND))) # (!\counting_process:cnt_var[4]~regout\ & (!\counting_process:cnt_var[3]~2\ & VCC))
-- \counting_process:cnt_var[4]~2\ = CARRY((\counting_process:cnt_var[4]~regout\ & !\counting_process:cnt_var[3]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[4]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[3]~2\,
	combout => \counting_process:cnt_var[4]~1_combout\,
	cout => \counting_process:cnt_var[4]~2\);

-- Location: LCCOMB_X1_Y5_N12
\counting_process:cnt_var[5]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[5]~1_combout\ = (\counting_process:cnt_var[5]~regout\ & (!\counting_process:cnt_var[4]~2\)) # (!\counting_process:cnt_var[5]~regout\ & ((\counting_process:cnt_var[4]~2\) # (GND)))
-- \counting_process:cnt_var[5]~2\ = CARRY((!\counting_process:cnt_var[4]~2\) # (!\counting_process:cnt_var[5]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[5]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[4]~2\,
	combout => \counting_process:cnt_var[5]~1_combout\,
	cout => \counting_process:cnt_var[5]~2\);

-- Location: LCCOMB_X1_Y5_N14
\counting_process:cnt_var[6]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[6]~1_combout\ = (\counting_process:cnt_var[6]~regout\ & (\counting_process:cnt_var[5]~2\ $ (GND))) # (!\counting_process:cnt_var[6]~regout\ & (!\counting_process:cnt_var[5]~2\ & VCC))
-- \counting_process:cnt_var[6]~2\ = CARRY((\counting_process:cnt_var[6]~regout\ & !\counting_process:cnt_var[5]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counting_process:cnt_var[6]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[5]~2\,
	combout => \counting_process:cnt_var[6]~1_combout\,
	cout => \counting_process:cnt_var[6]~2\);

-- Location: LCFF_X1_Y5_N15
\counting_process:cnt_var[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[6]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[6]~regout\);

-- Location: LCCOMB_X1_Y5_N16
\counting_process:cnt_var[7]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \counting_process:cnt_var[7]~1_combout\ = (\counting_process:cnt_var[7]~regout\ & (!\counting_process:cnt_var[6]~2\)) # (!\counting_process:cnt_var[7]~regout\ & ((\counting_process:cnt_var[6]~2\) # (GND)))
-- \counting_process:cnt_var[7]~2\ = CARRY((!\counting_process:cnt_var[6]~2\) # (!\counting_process:cnt_var[7]~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[7]~regout\,
	datad => VCC,
	cin => \counting_process:cnt_var[6]~2\,
	combout => \counting_process:cnt_var[7]~1_combout\,
	cout => \counting_process:cnt_var[7]~2\);

-- Location: LCFF_X1_Y5_N19
\counting_process:cnt_var[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[8]~3_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[8]~regout\);

-- Location: LCFF_X1_Y5_N7
\counting_process:cnt_var[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[2]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[2]~regout\);

-- Location: LCCOMB_X2_Y4_N14
\Equal1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (\counting_process:cnt_var[1]~regout\ & (\counting_process:cnt_var[0]~regout\ & (\counting_process:cnt_var[3]~regout\ & \counting_process:cnt_var[2]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[1]~regout\,
	datab => \counting_process:cnt_var[0]~regout\,
	datac => \counting_process:cnt_var[3]~regout\,
	datad => \counting_process:cnt_var[2]~regout\,
	combout => \Equal1~0_combout\);

-- Location: LCFF_X1_Y5_N17
\counting_process:cnt_var[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[7]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[7]~regout\);

-- Location: LCFF_X1_Y5_N13
\counting_process:cnt_var[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[5]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[5]~regout\);

-- Location: LCCOMB_X1_Y5_N0
\Equal1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (\counting_process:cnt_var[4]~regout\ & (\counting_process:cnt_var[6]~regout\ & (\counting_process:cnt_var[7]~regout\ & \counting_process:cnt_var[5]~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[4]~regout\,
	datab => \counting_process:cnt_var[6]~regout\,
	datac => \counting_process:cnt_var[7]~regout\,
	datad => \counting_process:cnt_var[5]~regout\,
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X2_Y4_N4
\Equal1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (!\counting_process:cnt_var[8]~regout\ & (\Equal1~0_combout\ & \Equal1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counting_process:cnt_var[8]~regout\,
	datac => \Equal1~0_combout\,
	datad => \Equal1~1_combout\,
	combout => \Equal1~2_combout\);

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCFF_X1_Y5_N11
\counting_process:cnt_var[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \counting_process:cnt_var[4]~1_combout\,
	aclr => \ALT_INV_rst_n~clkctrl_outclk\,
	sclr => \counting_process:cnt_var[8]~1_combout\,
	ena => \counting_process:cnt_var[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \counting_process:cnt_var[4]~regout\);

-- Location: PIN_42,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\tc~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Equal1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_tc);

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cnt[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \counting_process:cnt_var[0]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cnt(0));

-- Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cnt[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \counting_process:cnt_var[1]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cnt(1));

-- Location: PIN_32,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cnt[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \counting_process:cnt_var[2]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cnt(2));

-- Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cnt[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \counting_process:cnt_var[3]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cnt(3));

-- Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cnt[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \counting_process:cnt_var[4]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cnt(4));

-- Location: PIN_25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cnt[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \counting_process:cnt_var[5]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cnt(5));

-- Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cnt[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \counting_process:cnt_var[6]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cnt(6));

-- Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cnt[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \counting_process:cnt_var[7]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cnt(7));

-- Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cnt[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \counting_process:cnt_var[8]~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cnt(8));
END structure;


