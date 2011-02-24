
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity led_glow is port
	( clk: in std_logic
	; led: out std_logic
	);
end led_glow;

architecture Behavioral of led_glow is
	signal divCounter: std_logic_vector (23 downto 0);
begin
	clkDiv: process (clk)
	begin
		if clk'event and clk = '1'  then
			divCounter <= divCounter + '1';
		end if;
	end process;

	led <= divCounter (23); 
end Behavioral;

