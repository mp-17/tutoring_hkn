library ieee;
use ieee.std_logic_1164.all;

-------------------- add_sub_ABC TESTBENCH -------------------------------------
-- HKN - ESD Tutoring project - May, 2018
-- Michele Caon, Matteo Perotti
--
-- Not synthetizable! This testbench generates the input signals to be sent to
-- the DUT. It reads the input patterns from four file and saves the
-- results on another file ("output.txt").
--------------------------------------------------------------------------------

entity add_sub_ABC_tb is
    generic(bit_n: integer:=8); -- Set this to change data width
    -- Empty entity
end add_sub_ABC_tb;

architecture behaviour of add_sub_ABC_tb is

-- COMPONENT DECLARATION
    component add_sub_ABC -- The device that's going to be tested
        generic (
                -- number of bits of the input signals
    				nBit_in : integer := 3
    	         );
    	port (
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
                    data_ready: out std_logic;
    				done : out std_logic;
    				-- data from DP
    				data_out : out std_logic_vector(nBit_in downto 0)
    			);
    end component;

    component CU_add_sub_ABC_tb
        port(
        -- INPUT SIGNALS
            clock: in std_logic; -- clock (generated in testbench DP)
            reset: in std_logic; -- reset signal
            start: in std_logic; -- testbench start signal
            add_sub_ABC_data_ready: in std_logic; -- DUT done signal
            freader_done: in std_logic; -- file reader done signal
        -- OUTPUT SIGNALS
            -- DUT:
            add_sub_ABC_start: out std_logic; -- DUT start signal
            add_sub_ABC_rst_n: out std_logic; -- DUT reset signal (active low)

            -- FILE reader/writer:
            AB_freader_enable: out std_logic; -- input file reader enable
            C_freader_enable: out std_logic; -- input file reader enable
            sign_freader_enable: out std_logic; -- input sign file reader enable
            fwriter_enable: out std_logic -- output file writer enable
        );
    end component;

    component text_in
        generic(bit_n: integer:=16);
        port(
        -- INPUT SIGNALS
            clock: in std_logic; -- clock signal
            enable: in std_logic; -- enable signal
            file_name: in string; -- name of the file to read the files from
        -- OUTPUT SIGNALS
            data: out std_logic_vector(bit_n-1 downto 0);
            done: out std_logic
        );
    end component;

    component text_out
        generic(bit_n: integer:=16);
        port(
        -- INPUT SIGNALS
            clock: in std_logic; -- clock signal
            enable: in std_logic; -- enable signal
            file_name: in string; -- name of the output file
            data_in: in std_logic_vector(bit_n-1 downto 0) -- Data to be written on the file
        );
    end component;

    -- TESTBENCH SIGNALS
    signal clock: std_logic:='0';
    signal reset: std_logic:='0';
    signal start: std_logic:='0';

    -- CU SIGNALS
    signal add_sub_ABC_rst_n: std_logic;
    signal add_sub_ABC_start: std_logic;
    signal AB_freader_enable: std_logic;
    signal C_freader_enable: std_logic;
    signal sign_freader_enable: std_logic;
    signal fwriter_enable: std_logic;

    -- READERS SIGNALS
    signal sign_freader_data: std_logic_vector(0 downto 0);
    signal A_freader_data: std_logic_vector(bit_n-1 downto 0);
    signal B_freader_data: std_logic_vector(bit_n-1 downto 0);
    signal C_freader_data: std_logic_vector(bit_n-1 downto 0);
    signal sign_freader_done, A_freader_done, B_freader_done, C_freader_done, freader_done: std_logic;

    -- DUT SIGNALS
    signal add_sub_ABC_data_ready: std_logic;
    signal add_sub_ABC_out: std_logic_vector(bit_n downto 0);

begin
    --Clock generation
    clock <= not clock after 20 ns;
    -- Reset generation
    reset <= '1' after 30 ns, '0' after 70 ns;
    -- Start generation
    start <= '1' after 110 ns, '0' after 200 ns;

    -- Here assignation is POSITIONAL. See how messy it is!
    -- Control Unit of the testbench
    control_unit: CU_add_sub_ABC_tb port map (clock, reset, start, add_sub_ABC_data_ready, freader_done, add_sub_ABC_start, add_sub_ABC_rst_n, AB_freader_enable, C_freader_enable, sign_freader_enable, fwriter_enable);

    -- DUT
    device: add_sub_ABC generic map (bit_n) port map (clock, add_sub_ABC_rst_n, add_sub_ABC_start, sign_freader_data(0), A_freader_data, B_freader_data, C_freader_data, add_sub_ABC_data_ready, open, add_sub_ABC_out);

    -- Input files readers
    A_freader: text_in generic map (bit_n) port map (clock, AB_freader_enable, "../common/A.txt", A_freader_data, A_freader_done);
    B_freader: text_in generic map (bit_n) port map (clock, AB_freader_enable, "../common/B.txt", B_freader_data, B_freader_done);
    C_freader: text_in generic map (bit_n) port map (clock, C_freader_enable, "../common/C.txt", C_freader_data, C_freader_done);
    sign_freader: text_in generic map (1) port map (clock, sign_freader_enable, "../common/sign.txt", sign_freader_data, sign_freader_done);

    -- Set this signal whenver a reader reaches the end of the input file
    freader_done <= sign_freader_done or A_freader_done or B_freader_done or C_freader_done;

    -- Output file writer
    output_fwriter: text_out generic map (bit_n+1) port map (clock, fwriter_enable, "../common/output.txt", add_sub_ABC_out);
end architecture behaviour;
