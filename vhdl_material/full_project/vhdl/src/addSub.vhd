library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addSub is
generic (
	nBit: positive := 10 );
port (
	sub: std_logic;
	add0,
	add1: std_logic_vector(nBit-1 downto 0);
	sum: std_logic_vector(nBit downto 0) );
end entity;

architecture beh of addSub is

	signal add0Ext, add1Ext: std_logic_vector(nBit downto 0);

begin

add0Ext <= add0(nBit-1) & add0;

add1Ext <= add1(nBit-1) & add1;

process(sub, add0, add1)
begin
	if (sub = '0') then
		sum <= std_logic_vector( signed(add0Ext) + signed(add1Ext) );
	else
		sum <= std_logic_vector( signed(add0Ext) - signed(add1Ext) );
	end if;
end process;

end architecture ; -- beh