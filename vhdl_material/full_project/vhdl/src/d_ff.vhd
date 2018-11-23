-----------------
-- D flip flop --
-----------------
-- SIGNALS --
-------------
-- clk: the clock of the ff
-- rst_n: asynchrounous reset for power-on only
-- en: enable of the ff
-- clr: clear signal, used as a synchrounous reset
-- d: input data of the ff
-- q: output data of the ff
---------------
-- BEHAVIOUR --
---------------
-- q <= '0' on each instant in which rst_n <= '0'
-- q <= '0' if at rising clock edge clr == '1'
-- q_n <= q_(n-1) if at rising clock edge en == '0' and clr == '0'
-- q_n <= d_n if at rising clock edge en == '1' and clr == '0'
----------------------
-- VHDL DESCRIPTION --
----------------------

library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
	port ( clk, 
		   rst_n,
		   en, 
		   clr: in std_logic; -- control signals
 
		   d: in std_logic; -- input data signal

		   q: out std_logic ); -- output data signal
end d_ff;

architecture behaviour of d_ff is
begin
	process (clk, rst_n)
	begin
		if (rst_n = '0') then
			q <= '0';
		elsif (clk'event and clk='1') then
			if (clr = '1') then
				q <= '0';
			else
				if (en = '1') then
					q <= d;
				end if;
			end if;
		end if;
	end process;
end behaviour;
