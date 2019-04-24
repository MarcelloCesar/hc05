library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ram is
    Port ( addr : in  STD_LOGIC_VECTOR (7 downto 0);
           rw : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end ram;

architecture Behavioral of ram is

begin


end Behavioral;

