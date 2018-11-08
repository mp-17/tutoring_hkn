----------------------------------------
-- SYNCHROUNOUS n_bit COUNTER with TC --
----------------------------------------
-- SIGNALS --
-------------
-- clk: the clock of the ff
-- rst_n: asynchrounous reset for power-on only
-- en: enable of the ff
-- clr: clear signal, used as a synchrounous reset
-- tc: terminal count
-- cnt: counting signal
---------------
-- BEHAVIOUR --
---------------
-- cnt <= (others => '0') on each instant in which rst_n <= '0'
-- cnt <= (others => '0') if at rising clock edge clr == '1'
-- cnt <= cnt if at rising clock edge en == '0' and clr == '0'
-- cnt <= cnt+1 if at rising clock edge en == '1' and clr == '0'
-- cnt <= (others => '0') if at rising clock edge cnt == (others => '1')
-- tc <= '1' if cnt == (others => '1')
----------------------
-- VHDL DESCRIPTION --
----------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sync_cnt is
generic ( n_bit: positive := 8 ); -- parallelism of "cnt" signal
port ( clk,
       rst_n,
       en,
       clr: in std_logic; -- control signals

       tc: out std_logic; -- terminal count status signal

       cnt: out std_logic_vector(n_bit-1 downto 0) ); -- count output data signal
end entity;

architecture behaviour of sync_cnt is
begin
	counting_process: process(clk, rst_n) 
	variable cnt_var: natural := 0;
	variable cnt_max: natural := (2**n_bit) - 1;
	begin
		-- reset, clear and count flow
		if (rst_n = '0') then
			cnt_var := 0;
		elsif (clk'event and clk = '1') then
			if (clr = '1') then
				cnt_var := 0;
			elsif (en = '1') then
				cnt_var := cnt_var + 1;
			end if;
		end if;
		-- clear-from-overflow check
		if (cnt_var > cnt_max) then
			cnt_var := 0;
		end if;
		-- terminal count check
		if (cnt_var = cnt_max) then
			tc <= '1';
		else
			tc <= '0';
		end if;
		-- variable-to-signal assignments
		cnt <= std_logic_vector(to_unsigned(cnt_var, n_bit));
	end process;
end architecture;