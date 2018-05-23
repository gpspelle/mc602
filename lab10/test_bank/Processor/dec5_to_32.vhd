library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec5_to_32 is 		
	port (		
		en: in std_logic;
		Xin: in std_logic_vector(4 downto 0);
		Xout: out std_logic_vector(31 downto 0)
	);
end dec5_to_32;

architecture implement of dec5_to_32 is 	
begin	
	Xout <= "00000000000000000000000000000000" when en = '0' else
			"00000000000000000000000000000001" when Xin = "00000" else
			"00000000000000000000000000000010" when Xin = "00001" else
			"00000000000000000000000000000100" when Xin = "00010" else
			"00000000000000000000000000001000" when Xin = "00011" else
			"00000000000000000000000000010000" when Xin = "00100" else
			"00000000000000000000000000100000" when Xin = "00101" else
			"00000000000000000000000001000000" when Xin = "00110" else
			"00000000000000000000000010000000" when Xin = "00111" else
			"00000000000000000000000100000000" when Xin = "01000" else
			"00000000000000000000001000000000" when Xin = "01001" else
			"00000000000000000000010000000000" when Xin = "01010" else
			"00000000000000000000100000000000" when Xin = "01011" else
			"00000000000000000001000000000000" when Xin = "01100" else
			"00000000000000000010000000000000" when Xin = "01101" else
			"00000000000000000100000000000000" when Xin = "01110" else
			"00000000000000001000000000000000" when Xin = "01111" else
			"00000000000000010000000000000000" when Xin = "10000" else
			"00000000000000100000000000000000" when Xin = "10001" else
			"00000000000001000000000000000000" when Xin = "10010" else
			"00000000000010000000000000000000" when Xin = "10011" else
			"00000000000100000000000000000000" when Xin = "10100" else
			"00000000001000000000000000000000" when Xin = "10101" else
			"00000000010000000000000000000000" when Xin = "10110" else
			"00000000100000000000000000000000" when Xin = "10111" else
			"00000001000000000000000000000000" when Xin = "11000" else
			"00000010000000000000000000000000" when Xin = "11001" else
			"00000100000000000000000000000000" when Xin = "11010" else
			"00001000000000000000000000000000" when Xin = "11011" else
			"00010000000000000000000000000000" when Xin = "11100" else
			"00100000000000000000000000000000" when Xin = "11101" else
			"01000000000000000000000000000000" when Xin = "11110" else
			"10000000000000000000000000000000" when Xin = "11111";
end implement;