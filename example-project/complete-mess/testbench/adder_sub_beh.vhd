library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------ SIGNED ADDER ------------------------------------
-- This file contains a behavioural description af a n_bit signed adder. Since
-- the output signal has one additional bit with respect to the input ones,
-- overflow is handled.
--------------------------------------------------------------------------------

entity adder_sub_beh is
	generic ( n : integer := 3 );
	port (
	       sub : in std_logic;

	       in0,
			 in1 : in std_logic_vector(n-1 downto 0);

			 out0 : out std_logic_vector(n downto 0)
	      );
end adder_sub_beh;

architecture behaviour of adder_sub_beh is

signal temp0, temp1: std_logic_vector(n downto 0);
signal add0, add1 : signed(n downto 0);

begin
	temp0 <= in0(n-1) & in0;
	temp1 <= in1(n-1) & in1;
    add0 <= signed(temp0);
    add1 <= signed(temp1);

	out0 <= std_logic_vector(add0 + add1) when sub = '0' else
			std_logic_vector(add0 - add1);

  end architecture;
