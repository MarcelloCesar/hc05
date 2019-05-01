----------------------------------------------------------------------------------
-- Author:  Bruno Passos
-- Module:  Top
-- Version: 0.1 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity hc05 is
    Port ( clk  : in   STD_LOGIC;
           rst  : in   STD_LOGIC;
           dout : in   STD_LOGIC_VECTOR (7 downto 0);
           din  : out  STD_LOGIC_VECTOR (7 downto 0);
           addr : out  STD_LOGIC_VECTOR (7 downto 0);
           rw   : out  STD_LOGIC;
			  LED  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end hc05;

architecture Behavioral of hc05 is
--Controle de estados
signal estado : STD_LOGIC_VECTOR (2 downto 0);

--Declaração dos Estados
constant RESET1      : STD_LOGIC_VECTOR (2 downto 0) := "000";
constant RESET2      : STD_LOGIC_VECTOR (2 downto 0) := "001";
constant BUSCA       : STD_LOGIC_VECTOR (2 downto 0) := "010";
constant DECODIFICA  : STD_LOGIC_VECTOR (2 downto 0) := "011";
constant EXECUTA     : STD_LOGIC_VECTOR (2 downto 0) := "100";

--Registradores
signal A  : STD_LOGIC_VECTOR (7 downto 0);
signal PC : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL OPCODE : STD_LOGIC_VECTOR (7 DOWNTO 0);

begin

addr <= PC;
LED <= A;

process(clk, rst)
begin

	if rst = '1' then
		A  <= "00000000";
		PC <= "00000000";
		ESTADO <= RESET1;
	elsif clk'event and clk = '1' then
		--Maquina de Estados
		CASE ESTADO IS
			WHEN RESET1 =>
				PC <= "00000000"; -- PRIMEIRO ENDERECO
				RW <= '0';        -- MODO LEITURA
				ESTADO <= RESET2;	
				
			WHEN RESET2 =>
				
				ESTADO <= BUSCA;
				
			WHEN BUSCA => 
				OPCODE <= DOUT; -- CODIGO DA INSTRUCAO
				ESTADO <= DECODIFICA;
				
			WHEN DECODIFICA =>
				
				CASE OPCODE IS
					WHEN "01001100" => -- INC A - 4C
						A <= A + 1;
						ESTADO <= EXECUTA;
					WHEN OTHERS => NULL;
				END CASE; 
				
				
			WHEN EXECUTA =>
				PC <= PC + 1;
				ESTADO <= BUSCA;		
				
			WHEN OTHERS => NULL;
		END CASE;
			
	end if;
end process;

end Behavioral;

