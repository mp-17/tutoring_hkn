library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------- INFO --------------------------------------
-- EXAMPLE PROJECT FOR HKN TUTORING SESSIONS: add_sub_ABC.
-- This simple design... 

entity add_sub_ABC is
	generic (
	            -- input signals number of bits
				nBit_in : integer := 3
	        );
				
	port 	( 
	       	-- INPUTS
				-- main signals to DP/CU
				clk,
				rst_n : in std_logic;
				
				-- signals to CU
				start,
				sign : in std_logic;
				
				-- data to DP
				A, 
				B, 
				C : in std_logic_vector(nBit_in-1 downto 0);
			 
			-- OUTPUTS
				-- signals from CU
				done : out std_logic;
				
				-- data from DP
				data_out : out std_logic_vector(nBit_in downto 0)
			);
end add_sub_ABC;

architecture structure of add_sub_ABC is

	component CU_add_sub_ABC is
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
				done : out std_logic
	      	);
	end component;

	component DP_add_sub_ABC is
		generic ( n : integer := 3 );
		port (
				-- INPUTS
				-- main signals
				clk,
				rst_n_regs,
				rst_n_regSum,
				en_regA,
				en_regB,
				en_regC,
				en_regSum,
				sel,
				sub : in std_logic;
				
				-- data signals
				A,
				B,
				C : in std_logic_vector(n-1 downto 0);
				
				-- OUTPUTS
				data_out : out std_logic_vector(n downto 0)
			);
	end component;
	
	signal 
	sign_wire,
   	en_regA,
	en_regB,
	en_regC,
	en_regSum,
	rst_n_regs,
	rst_n_regSum,
	sel : std_logic;
	
begin

	CU : CU_add_sub_ABC 
		port map 
		(
			clk => clk,
			rst_n => rst_n,
			start => start,
			sign => sign,
			sub => sign_wire,
			en_regA => en_regA,
			en_regB => en_regB,
			en_regC => en_regC,
			en_regSum => en_regSum,
			rst_n_regs => rst_n_regs,
			rst_n_regSum => rst_n_regSum,
			sel => sel,
			done => done
		);
	 
	DP : DP_add_sub_ABC 
		generic map 
			( n => nBit_in )
	port map
			(
			clk => clk,
			rst_n_regs => rst_n_regs,
			rst_n_regSum => rst_n_regSum,
			en_regA => en_regA,
			en_regB => en_regB,
			en_regC => en_regC,
			en_regSum => en_regSum,
			sel => sel,
			sub => sign_wire,
			A => A,
			B => B,
			C => C,
			data_out => data_out
		);
	
end architecture;
