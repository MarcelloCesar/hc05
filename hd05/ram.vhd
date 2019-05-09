----------------------------------------------------------------------------------
-- Author:  Bruno Passos
-- Module:  Top
-- Version: 0.1 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (7 downto 0);
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           rw : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (7 downto 0));
end ram;

architecture Behavioral of ram is
type type_ram is array (0 to 255) of STD_LOGIC_VECTOR (7 downto 0);
signal ram8x8: type_ram;

begin

process(clk, rst)
begin
	if rst = '1' then
		ram8x8(0) <= "10100111";
		ram8x8(1) <= "00000111";
		ram8x8(2) <= "01001100";
		ram8x8(3) <= "01001100";
		ram8x8(4) <= "01001100";
		ram8x8(5) <= "01001100";
		ram8x8(6) <= "01001100";
		ram8x8(7) <= "00000011";
		
	elsif clk'event and clk = '1' then
		-- Operação de escrita
		if rw = '1' then
			ram8x8(to_integer(unsigned(addr))) <= din;
		end if;
	end if;
	
end process;
dout <= ram8x8(to_integer(unsigned(addr)));
end Behavioral;

