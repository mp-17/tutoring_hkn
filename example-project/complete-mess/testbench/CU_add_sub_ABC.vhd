library IEEE;
use ieee.std_logic_1164.all;

----------------------------- add_sub_ABC COTROL UNIT --------------------------
-- This file contains the description of the control unit of the simple add-sub
-- circuit to be tested. This schedules the acquisition of the input data and
-- the generation of the control signals needed to perform the computation
-- of the outputs.
--------------------------------------------------------------------------------

entity CU_add_sub_ABC is
	port (
				-- INPUTS
					-- main signals
					clk,
					rst_n : in std_logic;

					-- from outside
					start,
					sign : in std_logic;

				-- OUTPUTS
					-- to DP
					sub,
				   en_regA,
				   en_regB,
				   en_regC,
					en_regSum,
					rst_n_regs,
					rst_n_regSum,
				   sel : out std_logic;

					-- to outside
					data_ready: out std_logic;
					done : out std_logic
	      );
end CU_add_sub_ABC;

architecture behaviour of CU_add_sub_ABC is

	type states is (reset, idle, ABCsv, Csv_ACpr_sum, Csv_ACpr_diff, out0_BCpr_sum, out0_BCpr_diff, out1_done);

	signal PS,
			 NS : states;

begin
--------------------------------------------------
	-- State transition process
	ns_process : process(PS, start, sign)
	begin
		case PS is

			when reset => NS <= idle;

			when idle => if (start = '1') then
								NS <= ABCsv;
							 else
								NS <= idle;
							 end if;

			when ABCsv => if (sign = '0') then
								 NS <= Csv_ACpr_sum;
						     else
								 NS <= Csv_ACpr_diff;
							  end if;

			when Csv_ACpr_sum => if (sign = '0') then
										  NS <= out0_BCpr_sum;
						            else
										  NS <= out0_BCpr_diff;
							         end if;

			when Csv_ACpr_diff => if (sign = '0') then
											NS <= out0_BCpr_sum;
						             else
											NS <= out0_BCpr_diff;
							          end if;

			when out0_BCpr_sum => NS <= out1_done;

			when out0_BCpr_diff => NS <= out1_done;

			when out1_done => NS <= idle;

			when others => ns <= reset;

		end case;
	end process;
--------------------------------------------------
	ps_process : process(clk, rst_n)
	begin
		if (rst_n = '0') then
			PS <= reset;
		else
			if (clk'event and clk = '1') then
				PS <= NS;
			end if;
		end if;
	end process;
--------------------------------------------------
	out_process : process(PS)
	begin

		-- std assignments
		rst_n_regSum <= '1';
		rst_n_regs <= '1';
		en_regA <= '0';
		en_regB <= '0';
		en_regC <= '0';
		en_regSum <= '0';
		sub <= '0';
		sel <= '0';
		done <= '0';
		data_ready <= '0';

		-- specific assignments
		case PS is
			when reset => 	rst_n_regs <= '0';
							rst_n_regSum <= '0';

			when idle => rst_n_regSum <= '0';

			when ABCsv => en_regA <= '1';
			              en_regB <= '1';
			              en_regC <= '1';

			when Csv_ACpr_sum => 	en_regC <= '1';
									en_regSum <= '1';
									sub <= '0';
									rst_n_regSum <= '1';
									data_ready <= '1';

			when Csv_ACpr_diff => 	en_regC <= '1';
									en_regSum <= '1';
									sub <= '1';
									rst_n_regSum <= '1';
									data_ready <= '1';

			when out0_BCpr_sum => en_regSum <= '1';
			                      sub <= '0';
								  rst_n_regSum <= '1';
								  sel <= '1';

			when out0_BCpr_diff => en_regSum <= '1';
			                       sub <= '1';
								   rst_n_regSum <= '1';
								   sel <= '1';

			when out1_done => 	rst_n_regSum <= '1';
								done <= '1';

		end case;
	end process;
--------------------------------------------------
end architecture;
