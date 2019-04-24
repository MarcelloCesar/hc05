library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hc05 is
    Port ( dout : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           din : out  STD_LOGIC_VECTOR (7 downto 0);
           addr : out  STD_LOGIC_VECTOR (7 downto 0);
           rw : out  STD_LOGIC);
end hc05;

architecture Behavioral of hc05 is

begin


end Behavioral;

