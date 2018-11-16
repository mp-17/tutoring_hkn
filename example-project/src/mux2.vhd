library IEEE;
use ieee.std_logic_1164.all;

entity mux2 is
	generic (n : integer := 3);
	port ( 
	       sel : in std_logic;
	
	       in0,
          in1	: in std_logic_vector(n-1 downto 0);
			 
			 out0 : out std_logic_vector(n-1 downto 0)
	      );
end mux2;

architecture behaviour of mux2 is
begin

	process(in0, in1, sel)
	begin
		if (sel = '0') then
			out0 <= in0;
		else
			out0 <= in1;
		end if;
	end process;

end architecture;