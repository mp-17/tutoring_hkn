-------------------------------------
-- Register with n_bit parallelism --
-------------------------------------
-- GENERICS --
--------------
-- n_bit: the parallelism of the data signals 'd' and 'q'
-------------
-- SIGNALS --
-------------
-- clk: the clock of the reg
-- rst_n: asynchrounous reset for power-on only
-- en: enable of the reg
-- clr: clear signal, used as a synchrounous reset
-- d: input data of the reg
-- q: output data of the reg
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

entity reg is
	generic ( n_bit: positive := 8 ); -- the parallelism of the signal lines
	port ( clk,
		   rst_n,
	       en,
	       clr: in std_logic; -- control signals

	       d: in std_logic_vector(n_bit-1 downto 0); -- input signal

           q: out std_logic_vector(n_bit-1 downto 0) ); -- output signal
end reg;

architecture behaviour of reg is
begin
	process(clk, rst_n)
	begin
		if (rst_n = '0') then
			q <= (others => '0');
		elsif (clk'event and clk = '1') then
			if (clr = '1') then
				q <= (others => '0');
			elsif (en = '1') then
				q <= d;
			end if;
		end if;
	end process;
end architecture;