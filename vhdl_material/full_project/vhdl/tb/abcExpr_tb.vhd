library ieee;
use ieee.std_logic_1164.all;

entity abcExpr_tb is 
-- Nothing to see here
end abcExpr_tb;

architecture behaviour of abcExpr_tb is 

---------------------------- COMPONENT DECLARATION ----------------------------

-- DUT:
component abcExpr is
	generic (
		nBitIn: positive := 10,
		nBitOut: positive := 13);
	port (
		clk,
		rst_n,
		start,
		stop: in std_logic;

        a: in std_logic_vector(nBitIn-1 downto 0);
        bc: in std_logic_vector(nBitOut-1 downto 0);

        valid: out std_logic;
        done: out std_logic;
		data_out: out std_logic_vector(nBitOut-1 downto 0) );
end component;

-- Text I/O
component text_in is
    generic(bit_n: integer:=16);
    port(
    -- INPUT SIGNALS
        clock: in std_logic; -- clock signal
        enable: in std_logic; -- enable signal
        file_name: in string; -- name of the file to read the files from
        -- mode: in string;
    -- OUTPUT SIGNALS
        data: out std_logic_vector(bit_n-1 downto 0);
        done: out std_logic
    );
end component;

component text_out is
    generic(bit_n: integer:=16);
    port(
    -- INPUT SIGNALS
        clock: in std_logic; -- clock signal
        enable: in std_logic; -- enable signal
        file_name: in string; -- name of the output file
        data_in: in std_logic_vector(bit_n-1 downto 0) -- Data to be written on the file
        -- mode: in string
		  -- done: out std_logic
    );
end component;

-- Register
component reg is
	generic ( n_bit: positive := 8 ); -- the parallelism of the signal lines
	port ( clk,
		   rst_n,
	       en,
	       clr: in std_logic; -- control signals

	       d: in std_logic_vector(n_bit-1 downto 0); -- input signal

           q: out std_logic_vector(n_bit-1 downto 0) ); -- output signal
end component;

------------------------------- SIGNAL DECLARATION ----------------------------

-- Parameters
constant nBitIn: positive := 10;
constant nBitOut: positive := 13;

-- High level signals
signal reset_n,
       clock,
       start: std_logic;
       
-- DUT signals 
signal DUT_start,
       DUT_stop,
       DUT_valid, 
       DUT_done: std_logic;
signal DUT_a, 
       DUT_bc: std_logic_vector(nBitIn-1 downto 0);
signal DUT_out: std_logic_vector(nBitOut-1 downto 0);

-- Readers/writer signals
signal aReader_en,
       bcReader_en,
       aReader_done,
       bcReader_done: std_logic;
signal outWriter_en,
signal reader_a, 
       reader_bc: std_logic_vector(nBitIn-1 downto 0);
       
       
begin 

----------------------------- TESTBCENCH SIGNALS ------------------------------
--Clock generation
clock <= not clock after 20 ns;
-- Reset generation
reset_n <= '1' after 30 ns, '0' after 70 ns;
-- Start generation
start <= '1' after 110 ns, '0' after 200 ns;

-------------------------- TESTBENCH CONTROL UNIT -----------------------------


------------------------------------ DUT --------------------------------------
DUT: abcExpr 
    generic map (
        nBitIn <= nBitIn,
        nBitOut <= nBitOut
    )
    port map (
        clk <= clock,
        rst_n <= reset_n,
        start <= DUT_start,
        stop <= DUT_stop,

        a <= DUT_a, 
        bc <= DUT_bc,

        valid <= DUT_valid,
        done <= DUT_done,
        data_out <= DUT_out 
    );

--------------------------- INPUT FILE READERS --------------------------------
aReader: text_in
    generic map (
        bit_n <= nBitIn
    )
    port map (
    -- INPUT SIGNALS
        clock <= clock
        enable <= aReader_en,
        file_name <= "../common/aInput.txt"
    -- OUTPUT SIGNALS
        data <= reader_a,
        done <= aReader_done
    );
aReader: text_in
    generic map (
        bit_n <= nBitIn
    )
    port map (
    -- INPUT SIGNALS
        clock <= clock
        enable <= bcReader_en,
        file_name <= "../common/bcInput.txt"
    -- OUTPUT SIGNALS
        data <= reader_bc,
        done <= bcReader_done
    );

--------------------------- INPUT DATA REGISTERS-------------------------------
a_reg: reg
    generic map ( 
        n_bit <= nBitIn 
    )
	port map ( 
        clk <= clock,
		rst_n <= reset_n,
	    en <= '1',
	    clr <= '0',
	    d <= reader_a,

        q <= DUT_a
    );
a_reg: reg
    generic map ( 
        n_bit <= nBitIn 
    )
	port map ( 
        clk <= clock,
		rst_n <= reset_n,
	    en <= '1',
	    clr <= '0',
	    d <= reader_bc,

        q <= DUT_bc
    );
    
--------------------------- OUTPUT FILE WRITER --------------------------------
outWriter: text_out
    generic (
        bit_n <= nBitOut
    )
    port map (
    -- INPUT SIGNALS
        clock: in std_logic; -- clock signal
        enable: in std_logic; -- enable signal
        file_name: in string; -- name of the output file
        data_in: in std_logic_vector(bit_n-1 downto 0) -- Data to be written on the file
        -- mode: in string
		  -- done: out std_logic
    );

end behaviour;
