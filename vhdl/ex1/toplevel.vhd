
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel is port
	( clk: in std_logic
	; led1: out std_logic
	; led2: out std_logic
	);
end toplevel;

architecture Behavioral of toplevel is
	component led_glow port
		( clk: in std_logic
		; led: out std_logic
		);
	end component;
begin
	led_glow_1: led_glow port map
		( clk => clk
		, led => led1
		);	
	led_glow_2: led_glow port map
		( clk => clk
		, led => led2
		);
end Behavioral;

