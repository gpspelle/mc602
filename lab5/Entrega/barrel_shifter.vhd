-- brief : lab05 - question 1

library ieee;
use ieee.std_logic_1164.all;

entity barrel_shifter is
  port(
    w : in  std_logic_vector (3 downto 0);
    s : in  std_logic_vector (1 downto 0);
    y : out std_logic_vector (3 downto 0)
  );
end barrel_shifter;

architecture rtl of barrel_shifter is
begin
  y(3) <= w(3) when s = "00" else
			 w(0) when s = "01" else
			 w(1) when s = "10" else
			 w(2) when s = "11";
			
   y(2) <= w(2) when s = "00" else
			 w(3) when s = "01" else
			 w(0) when s = "10" else
			 w(1) when s = "11";
			 
	y(1) <= w(1) when s = "00" else
			 w(2) when s = "01" else
			 w(3) when s = "10" else
			 w(0) when s = "11";
			 
	y(0) <= w(0) when s = "00" else
			 w(1) when s = "01" else
			 w(2) when s = "10" else
			 w(3) when s = "11";
			 
end rtl;

