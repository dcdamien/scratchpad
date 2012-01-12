	
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
	signal divCounter: std_logic_vector (25 downto 0);
	signal pwmLevel: std_logic_vector (5 downto 0);
	signal pwm: std_logic_vector (6 downto 0);
begin
	clkDiv: process (clk)
	begin
		if clk'event and clk = '1'  then
			divCounter <= divCounter + '1';
		end if;
	end process;

	setLevel: process (clk)
	begin
		if clk'event and clk = '1'  then
			if divCounter (25) = '1' then
				pwmLevel <= divCounter (24 downto 19);
			else
				pwmLevel <= not divCounter (24 downto 19);
			end if;
		end if;
	end process;
	
	pwmLoop: process (clk, pwmLevel)
	begin
		if clk'event and clk = '1'  then
			pwm <= pwm + pwmLevel;
		end if;
	end process;
		
	led <= pwm (6); 
end Behavioral;

