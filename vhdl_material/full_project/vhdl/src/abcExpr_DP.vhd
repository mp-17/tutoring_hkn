library ieee;
use ieee.std_logic_1164.all

entity abcExpr_DP is
	generic (
		nBitIn: positive := 10;
		nBitOut: positive := 13);
	port (
		clk,
		rst_n,
		clr,
		en,
		REG_IN_en,
		REG_OUT_en: in std_logic;

		a, bc: in std_logic_vector(nBitIn-1 downto 0);

		data_out: out std_logic_vector(nBitOut-1 downto 0) );
end entity; -- abcExpr_DP

architecture struc of abcExpr_DP is

	component reg is
	generic ( 
		n_bit: positive := 8 ); -- the parallelism of the signal lines
	port ( 
		clk,
		rst_n,
		en,
		clr: in std_logic; -- control signals

		d: in std_logic_vector(n_bit-1 downto 0); -- input signal

		q: out std_logic_vector(n_bit-1 downto 0) ); -- output signal
	end component;

	component addSub is
	generic (
		nBit: positive := 10 );
	port (
		sub: std_logic;

		add0,
		add1: std_logic_vector(nBit-1 downto 0);

		sum: std_logic_vector(nBit downto 0) );
	end component;

	signal
		REG_BUF_A_q,
		REG_BUF_BC_q: std_logic_vector(nBitIn-1 downto 0);

	signal
		REG_A_q,
		REG_BC_q: std_logic_vector(nBitIn-1 downto 0);

	signal
		add_2a,
		add_b,
		add_2b: std_logic_vector(nBitIn downto 0);
	
	signal
		add_3b,
		REG_PART_d,
		REG_PART_q,
		add_c: std_logic_vector(nBitIn+1 downto 0);

	signal
		REG_OUT_d: std_logic_vector(nBitOut-1 downto 0);

	signal
		bufOut: std_logic_vector(nBitOut downto 0);

begin

REG_BUF_A: reg
	generic map ( 
		n_bit => nBitIn )
	port map ( 
		clk => clk,
		rst_n => rst_n,
		en => '1',
		clr => clr,
		d => a,
		q => REG_BUF_A_q );

REG_BUF_BC: reg
	generic map ( 
		n_bit => nBitIn )
	port map ( 
		clk => clk,
		rst_n => rst_n,
		en => '1',
		clr => clr,
		d => a,
		q => REG_BUF_BC_q );

REG_A: reg
	generic map ( 
		n_bit => nBitIn )
	port map ( 
		clk => clk,
		rst_n => rst_n,
		en => REG_IN_en,
		clr => clr,
		d => REG_BUF_A_q,
		q => REG_A_q );

REG_BC: reg
	generic map ( 
		n_bit => nBitIn )
	port map ( 
		clk => clk,
		rst_n => rst_n,
		en => REG_IN_en,
		clr => clr,
		d => REG_BUF_BC_q,
		q => REG_BC_q );

add_b <= REG_BC_q(nBitIn-1) & REG_BC_q;
add_2b <= REG_BC_q & '0';

ADD_3B: addSub
	generic map (
		nBit => nBitIn+1 )
	port map (
		sub => '0',
		add0 => add_2b,
		add1 => add_b,
		sum => add_3b );

add_2a <= REG_A_q & '0';

ADD_2An: addSub
	generic map (
		nBit => nBitIn+2 )
	port map (
		sub => '1',
		add0 => add_3b,
		add1 => add_2a,
		sum => REG_PART_d );

REG_PART: reg
	generic map ( 
		n_bit => nBitIn+3 )
	port map ( 
		clk => clk,
		rst_n => rst_n,
		en => en,
		clr => clr,
		d => REG_PART_d,
		q => REG_PART_q );

add_c <= REG_BC_q(nBitIn-1) & REG_BC_q(nBitIn-1) & REG_BC_q(nBitIn-1) & REG_BC_q;

ADD_OUT: addSub
	generic map (
		nBit => nBitOut )
	port map (
		sub => '1',
		add0 => REG_PART_q,
		add1 => add_c,
		sum => bufOut );

REG_OUT_d <= bufOut(nBitOut-1 downto 0);

REG_OUT: reg
	generic map ( 
		n_bit => nBitOut )
	port map ( 
		clk => clk,
		rst_n => rst_n,
		en => REG_OUT_en,
		clr => clr,
		d => REG_OUT_d,
		q => data_out );

end architecture;