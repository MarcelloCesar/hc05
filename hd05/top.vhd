library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is
-- componente RAM
component ram is 
	Port( clk  : in STD_LOGIC;
			rst  : in STD_LOGIC;
			addr : in STD_LOGIC_VECTOR (7 downto 0);
			din  : in STD_LOGIC_VECTOR (7 downto 0);
			rw   : in STD_LOGIC;
			dout : out STD_LOGIC_VECTOR (7 downto 0)
);
end component;

-- componente HC05
component hc05 is 
	Port ( clk  : in STD_LOGIC;
		    rst  : in STD_LOGIC;
			 dout : in STD_LOGIC_VECTOR (7 downto 0);
			 din  : in STD_LOGIC_VECTOR (7 downto 0);
			 addr : out STD_LOGIC_VECTOR (7 downto 0);
			 rw : out STD_LOGIC);
end component;			 

-- componente divisor de clock
component dvclk is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clkdiv : out  STD_LOGIC);
end component;
 
signal srw   : STD_LOGIC;
signal sdin  : STD_LOGIC_VECTOR (7 downto 0);
signal sdout : STD_LOGIC_VECTOR (7 downto 0);
signal saddr : STD_LOGIC_VECTOR (7 downto 0);
signal sclk  : STD_LOGIC;

begin

ram1   : ram   port map(sclk, rst, saddr, sdin, srw, sdout); -- nao é o do componente, é o do top
hc051  : hc05  port map(sclk, rst, sdout, sdin, saddr, srw); 
dvclk1 : dvclk port map(clk, rst, sclk);


end Behavioral;

