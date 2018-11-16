library IEEE;
use ieee.std_logic_1164.all;

entity reg_n is
	generic ( n : integer := 3 );
	port (
	       clk,
	       en,
			 rst_n : in std_logic;

	       D : in std_logic_vector(n-1 downto 0);

          Q : out std_logic_vector(n-1 downto 0)
			);
end reg_n;

architecture behaviour of reg_n is
begin

	process(clk, rst_n, en)
	begin
		if (clk'event and clk = '1') then
			if (rst_n = '0') then
				Q <= (others => '0');
			elsif (en = '1') then
				Q <= D;
			end if;
		end if;
	end process;
end architecture;
