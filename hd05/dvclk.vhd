library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dvclk is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clkdiv : out  STD_LOGIC);
end dvclk;

architecture Behavioral of dvclk is
signal cont : integer range 0 to 100000001;
begin

process(clk, rst)
begin
	if rst='1' then
		cont <= 0;
	elsif clk'event and clk='1' then
		cont <= cont + 1;
		if cont <= 50000000 then
			clkdiv <= '0';
		else
			clkdiv <= '1';
		end if;
		
		if cont = 100000000 then
			cont <= 0;
		end if;
	end if;
end process;


end Behavioral;

