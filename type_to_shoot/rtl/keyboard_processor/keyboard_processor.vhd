library ieee;
use ieee.std_logic_1164.all;

entity keyboard_processor is
  port (
		ps2_data	: inout std_logic;
		ps2_clk		:	inout	std_logic;
    clock 		: in std_logic;
		key_on		: out std_logic;
		asc_code	: out integer
  );
end keyboard_processor;

architecture rtl of keyboard_processor is

	function to_std_logic(bool: boolean) return std_logic is
	begin
		if bool then
			return ('1');
		else
			return ('0');
		end if;
	end function to_std_logic;

	-- Valor pego do Lab 6
	constant clockfreq: integer := 50000;

	component kbdex_ctrl 
		generic(
			clkfreq : integer
		);
		port (
			ps2_data	:	inout	std_logic;
			ps2_clk		:	inout	std_logic;
			clk				:	in 	std_logic;
			en				:	in 	std_logic;
			resetn		:	in 	std_logic;		
			lights		: in	std_logic_vector(2 downto 0); -- lights(Caps, Nun, Scroll)
			key_on		:	out	std_logic_vector(2 downto 0);
			key_code	:	out	std_logic_vector(47 downto 0)
		);
	end component;
	
	signal key_code: std_logic_vector(47 downto 0);
	signal key_on_aux: std_logic_vector(2 downto 0);
	signal asc_code_aux: integer;
begin
	controller: kbdex_ctrl
		generic map (
			clkfreq => clockfreq
		)
		port map (
			ps2_data => ps2_data,
			ps2_clk => ps2_clk,
			clk => clock,
			en => '1',
			resetn => '1',
			lights => "000",
			key_on => key_on_aux,
			key_code => key_code
		);
	
		-- key_on eh ativado quando alguma tecla eh pressionada e
		-- quando essa tecla e uma letra		
		key_on <= key_on_aux(0) and to_std_logic(asc_code_aux /= -1);
		
		-- Converte o codigo do kbdex_ctrl para asc
		with key_code(7 downto 0) select asc_code_aux <=
			65 when x"1C",
			66 when x"32",
			67 when x"21",
			68 when x"23",
			69 when x"24",
			70 when x"2B",
			71 when x"34",
			72 when x"33",
			73 when x"43",
			74 when x"3B",
			75 when x"42",
			76 when x"4B",
			77 when x"3A",
			78 when x"31",
			79 when x"44",
			80 when x"4D",
			81 when x"15",
			82 when x"2D",
			83 when x"1B",
			84 when x"2C",
			85 when x"3C",
			86 when x"2A",
			87 when x"1D",
			88 when x"22",
			89 when x"35",
			90 when x"1A",
			-1 when others;
			
		asc_code <= asc_code_aux;
end rtl;