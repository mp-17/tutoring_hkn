library ieee;
use ieee.std_logic_1164.all;

entity abcExpr_tb_CU is
    port (
        reset_n,
        clock,
        start: in std_logic;

        aReader_done: in std_logic;
        
        DUT_start, 
        DUT_stop: out std_logic;
        aReader_en, 
        bcReader_en: out std_logic
    );
end abcExpr_tb_CU;

architecture behaviour of abcExpr_tb_CU is 

------------------------- STATE DECLARATION -----------------------------------
type state_type is (IDLE, READ_A, READ_BC_START, READ_BC);
signal pres_state, next_state: state_type;

begin
    -- State update ns_process
    state_update: process(clock, reset_n)
    begin
        if(clock'event and clock = '1') then
            if(reset_n = '0') then
                pres_state <= IDLE;
                -- pres_state <= RST;
            else
                pres_state <= next_state;
            end if;
        end if;
    end process;

    -- State evolution process
    state_evolution: process(pres_state, start)
    begin
        case pres_state is
            -- when RST => next_state <= IDLE;

            when IDLE => if (start = '1') then
                            next_state <= READ_AB_FIRST;
                        else
                            next_state <= IDLE;
                        end if;

            when READ_AB =>  next_state <= READ_C_CHECK_EOF;

            when READ_AB_FIRST => next_state <= READ_C_CHECK_EOF_START;

            when READ_C_CHECK_EOF_START =>  if (aReader_done = '0') then
                                                next_state <= READ_AB;
                                            else
                                                next_state <= STOP;
                                            end if;

            when START_STATE => next_state <= SEND_ABC0;

            when SEND_ABC0 => next_state <= SEND_ABC1;

            when SEND_ABC1 =>   if (add_sub_ABC_data_ready = '1') then
                                    next_state <= SAVE_OUT0;
                                else
                                    next_state <= SEND_ABC1;
                                end if;

            when SAVE_OUT0 => next_state <= SAVE_OUT1;

            when SAVE_OUT1 =>   next_state <= READ_INPUT;

            when others => next_state <= RST;
        end case;
    end process;

    -- Control signals generation process
    control_process: process(pres_state)
    begin
        -- Default values
        add_sub_ABC_start <= '0';
        add_sub_ABC_rst_n <= '0';
        AB_freader_enable <= '0';
        C_freader_enable <= '0';
        sign_freader_enable <= '0';
        fwriter_enable <= '0';

        case pres_state is
            when RST =>

            when IDLE =>    add_sub_ABC_rst_n <= '1'; 

            when READ_INPUT =>  add_sub_ABC_rst_n <= '1';
                                AB_freader_enable <= '1';
                                C_freader_enable <= '1';
                                sign_freader_enable <= '1';

            when CHECK_EOF =>   add_sub_ABC_rst_n <= '1';

            when START_STATE => add_sub_ABC_start <= '1';
                                add_sub_ABC_rst_n <= '1';

            when SEND_ABC0 =>   add_sub_ABC_rst_n <= '1';
                                C_freader_enable <= '1';
                                sign_freader_enable <= '1';

            when SEND_ABC1 =>   add_sub_ABC_rst_n <= '1';

            when SAVE_OUT0 =>   add_sub_ABC_rst_n <= '1';
                                fwriter_enable <= '1';

            when SAVE_OUT1 =>   add_sub_ABC_rst_n <= '1';
                                fwriter_enable <= '1';
        end case;
    end process;

end architecture behaviour;
