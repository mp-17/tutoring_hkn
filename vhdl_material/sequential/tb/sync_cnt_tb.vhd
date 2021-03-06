library ieee;
use ieee.std_logic_1164.all;

entity sync_cnt_tb is
	generic ( T_clk: time := 20 ns;   -- 50 MHz default clock
	          n_bit: positive := 9 ); -- parallelism of the counter
end entity;

architecture beh of sync_cnt_tb is

component sync_cnt is
generic ( n_bit: positive := 9 ); -- parallelism of "cnt" signal
port ( clk,
       rst_n,
       en,
       clr: in std_logic; -- control signals

       tc: out std_logic; -- terminal count status signal

       cnt: out std_logic_vector(n_bit-1 downto 0) ); -- count output data signal
end component;

component sync_cnt_err is
generic ( n_bit: positive := 9 ); -- parallelism of "cnt" signal
port ( clk,
       rst_n,
       en,
       clr: in std_logic; -- control signals

       tc: out std_logic; -- terminal count status signal

       cnt: out std_logic_vector(n_bit-1 downto 0) ); -- count output data signal
end component;

component sync_cnt_right is
generic ( n_bit: positive := 9 ); -- parallelism of "cnt" signal
port ( clk,
       rst_n,
       en,
       clr: in std_logic; -- control signals

       tc: out std_logic; -- terminal count status signal

       cnt: out std_logic_vector(n_bit-1 downto 0) ); -- count output data signal
end component;

signal clk: std_logic := '0';
signal rst_n,
       en,
       clr, 
       tc, err_tc, right_tc: std_logic;
signal cnt, err_cnt, right_cnt: std_logic_vector(n_bit-1 downto 0);

begin

-- System signals generation processes

-- clock generation
clock_process: process
begin
	clk <= not clk;
	wait for T_clk/2;
end process;
-- OR:
-- clock <= not clock after T_clk/2;

-- reset generation
rst_n <= '1', '0' after 1 ns, '1' after 2 ns;

-- clear generation
clr <= '0', '1' after (8*T_clk + 1 ns), '0' after (12*T_clk + 1 ns), '1' after (16*T_clk + 1 ns), '0' after (17*T_clk + 1 ns);

-- enable generation
en <= '0', '1' after 10*T_clk + 1 ns;

-- DUT instantiation
DUT : sync_cnt
generic map ( 
	n_bit => n_bit)
port map ( 
	clk => clk,
	rst_n => rst_n,
	en => en,
	clr => clr,
	tc => tc,
	cnt => cnt);

-- Erroneus DUT instantiation
ERR_DUT : sync_cnt_err
generic map (
	n_bit => n_bit)
port map ( 
	clk => clk,
	rst_n => rst_n,
	en => en,
	clr => clr,
	tc => err_tc,
	cnt => err_cnt);

-- Right DUT instantiation
RIGHT_DUT : sync_cnt_right
generic map (
	n_bit => n_bit)
port map ( 
	clk => clk,
	rst_n => rst_n,
	en => en,
	clr => clr,
	tc => right_tc,
	cnt => right_cnt);

end architecture;