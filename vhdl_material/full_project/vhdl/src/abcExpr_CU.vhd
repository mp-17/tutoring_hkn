library ieee;
use ieee.std_logic_1164.all

entity abcExpr_CU is
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
end entity; -- abcExpr_CU

architecture beh of abcExpr_CU is

	type state is (
		RESET, 
		SAMPLE, 
		FIRST_OP, 
		SECOND_OP, 
		FIRST_OP_VALID, 
		LAST_FIRST_OP, 
		LAST_FIRST_OP_VALID, 
		LAST_SECOND_OP, 
		DONE );

	signal ps, ns: state;

begin

ps_process: process(rst_n, clk)
	begin
		if rst_n = '0' then
			ps <= RESET;
		else
			if clk'event and clk = '1' then
				ps <= ns;
			end if;
		end if;
	end process;

ns_process: process(ps, start, stop)
	begin
		case ps is
			when RESET => 
				if start = '1' then
					ns <= SAMPLE;
				else
					ns <= RESET;
				end if;
			when SAMPLE => 
				if stop = '1' then
					ns <= LAST_FIRST_OP;
				else
					ns <= FIRST_OP;
				end if;
			when FIRST_OP => 
				ns <= SECOND_OP;
			when SECOND_OP => 
				if stop = '0' then
					ns <= FIRST_OP_VALID;
				else
					ns <= LAST_FIRST_OP_VALID;
				end if;
			when FIRST_OP_VALID => 
				ns <= SECOND_OP;
			when LAST_FIRST_OP =>
				ns <= LAST_SECOND_OP;
			when LAST_FIRST_OP_VALID =>
				ns <= LAST_SECOND_OP;
			when LAST_SECOND_OP =>
				ns <= DONE;
			when DONE =>
				ns <= RESET;
			when others => 
				ns <= RESET;
		end case; 

out_process: process(ps)
	begin

		REG_IN_en <= '0';
		clr <= '0';
		valid <= '0';
		done <= '0';
		en <= '0';
		REG_OUT_en <= '0';

		case ps is
			when RESET => 
				clr <= '1';
				REG_IN_en <= '0';
			when SAMPLE => 
				REG_IN_en <= '1';
			when FIRST_OP => 
				REG_IN_en <= '1';
				en <= '1';
			when SECOND_OP => 
				REG_IN_en <= '1';
				en <= '1';
				REG_OUT_en <= '1';
			when FIRST_OP_VALID => 
				REG_IN_en <= '1';
				en <= '1';
				valid <= '1';
			when LAST_FIRST_OP =>
				REG_IN_en <= '1';
				en <= '1';
			when LAST_FIRST_OP_VALID =>
				REG_IN_en <= '1';
				en <= '1';
				valid <= '1';
			when LAST_SECOND_OP =>
				REG_OUT_en <= '1';
			when DONE =>
				valid <= '1';
				done <= '1';
			when others => 
				clr <= '1';
		end case;
	end process;

end architecture ; -- beh