library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_1bit is
    port 
    ( 
	    in0,
	    in1 : in std_logic;

	    sel : in std_logic;

	    out0 : out std_logic 
	);
end mux2to1_1bit;

architecture beh of mux2to1_1bit is
begin

	-- brute definition
	out0 <= (in0 and (not sel)) or (in1 and sel);

--	-- it's allowed not to use brackets
--	out0 <= in0 and not sel or in1 and sel;
--
--	-- when else
--	out0 <= in0 when sel = '0' else in1;
--
--	-- with select when
--	with sel select
--		out0 <= 
--			in0 when '0',
--			in1 when others;
--
--	-- process definition with if
--	mux_process_if : 
--		process(in0, in1, sel)
--		begin
--			if (sel = '0') then
--				out0 <= in0;
--			else
--				out0 <= in1;
--			end if;
--		end process;
--
--	-- process definition with case
--	mux_process_case : 
--		process(in0, in1, sel)
--		begin
--			case sel is
--				when '0' => in0;
--				when others => in1;
--			end case;
--		end process;

end architecture ;