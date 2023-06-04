---------------------------------------------
--  Lab Work #5: compact reversive S-box kxx 
---------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all; -- old solution
--use IEEE.std_logic_unsigned.all; -- old solution
use IEEE.numeric_std.all; -- new solution

entity k20_rom is
	port (
		R : in STD_LOGIC;
		X : in STD_LOGIC_VECTOR(3 downto 0);
		Y : out STD_LOGIC_VECTOR(3 downto 0)
	);
end entity;

architecture k20_rom_arc of k20_rom is  
	signal inp_addr : STD_LOGIC_VECTOR(4 downto 0);
	type sbox_array is array (0 to 31) of STD_LOGIC_VECTOR(3 downto 0);
	constant k20 : sbox_array := (
	    x"5", x"8", x"1", x"d", x"a", x"3", x"4", x"2",  --R=0;X:0-7
	    x"e", x"f", x"c", x"7", x"6", x"0", x"9", x"b",  --R=0;X:8-15
	    x"d", x"2", x"7", x"5", x"6", x"0", x"c", x"b",  --R=1;X:0-7
	    x"1", x"e", x"4", x"f", x"a", x"3", x"8", x"9"	 --R=1;X:8-15
	); 
begin
	inp_addr <= R & X;
	-- Y <= kxx(conv_integer(inp_vec)); -- old solution
	Y <= k20(to_integer(unsigned(inp_addr))); -- new solution
end architecture;