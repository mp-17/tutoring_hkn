library ieee;
use ieee.std_logic_1164.all

entity abcExpr is
	generic (
		nBitIn: positive := 10;
		nBitOut: positive := 13);
	port (
		clk,
		rst_n,
		start,
		stop: in std_logic;

		a, bc: in std_logic_vector(nBitIn-1 downto 0);

		valid: out std_logic;

		done: out std_logic

		data_out: out std_logic_vector(nBitOut-1 downto 0) );
end entity ; -- abcExpr

architecture beh of abcExpr is

	component abcExpr_CU is
		port (
			clk,
			rst_n,
			start,
			stop: in std_logic;

			valid,
			done: out std_logic;

			clr,
			en,
			REG_OUT_en,
			REG_IN_en: out std_logic );
	end component; -- abcExpr_CU

	component abcExpr_DP is
		generic (
			nBitIn: positive := nBitIn;
			nBitOut: positive := nBitOut);
		port (
			clk,
			rst_n,
			clr,
			en,
			REG_IN_en,
			REG_OUT_en: in std_logic;

			a, bc: in std_logic_vector(nBitIn-1 downto 0);

			data_out: out std_logic_vector(nBitOut-1 downto 0) );
	end component; -- abcExpr_DP

	signal clr, en, REG_OUT_en, REG_IN_en: std_logic;

begin

CU: abcExpr_DP 
	port map (
		clk => clk,
		rst_n => rst_n,
		start => start,
		stop => stop,
		valid => valid,
		done => done, 
		clr => clr,
		en => en,
		REG_OUT_en => REG_OUT_en,
		REG_IN_en => REG_IN_en );

DP: abcExpr_DP 
	generic map (
		nBitIn => nBitIn;
		nBitOut => nBitOut )
	port map (
		clk => clk,
		rst_n => rst_n,
		clr => clr,
		en => en,
		REG_IN_en => REG_IN_en,
		REG_OUT_en => REG_OUT_en,
		a => a, 
		bc => bc,
		data_out => data_out );

end architecture ; -- beh