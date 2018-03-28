-- brief : lab05 - question 2

library ieee;
use ieee.std_logic_1164.all;

entity cla_4bits is
  port(
    x    : in  std_logic_vector(3 downto 0);
    y    : in  std_logic_vector(3 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(3 downto 0);
    cout : out std_logic
  );
end cla_4bits;

architecture rtl of cla_4bits is
	component adder 
	port (
		x, y : in std_logic;
		r : out std_logic;
		cin : in std_logic
	);
	end component;

	signal c: std_logic_vector(4 downto 0);
	signal g: std_logic_vector(3 downto 0);
	signal p: std_logic_vector(3 downto 0);
begin

	inicializePG: for i in 0 to 3 generate		
		g(i) <= x(i) or y(i);
		p(i) <= x(i) and y(i);
	end generate inicializePG;	
	
	c(0) <= cin;
	
	calcCi: for i in 1 to 4 generate
		c(i) <= (c(i-1) and p(i)) or g(i);
	end generate calcCi;
  
	add: for i in 0 to 3 generate
		adde: adder port map (
			x => x(i),
			y => y(i),
			r => sum(i),
			cin => c(i)			
		);
	end generate;
	
	cout <= c(4);
end rtl;

