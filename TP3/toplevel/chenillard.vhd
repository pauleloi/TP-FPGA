--***************************
-- Part I.A.2 Question 2
--***************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity chenillard is
    port (
        CLK  : in  std_logic;                     -- Horloge
        RST  : in  std_logic;                     -- Reset synchrone, actif bas
        CHEN : out std_logic_vector(9 downto 0)   -- Sortie chenillard
    );
end entity chenillard;

architecture Behavioral of chenillard is
    signal state : integer range 0 to 9 := 0;
begin
	process(CLK, RST)
	begin
		 if RST = '0' then
			  state <= 0;
		 elsif rising_edge(CLK) then
			  if state = 9 then
					state <= 0;
			  else
					state <= state + 1;
			  end if;
		 end if;
	end process;

    -- Décodeur de sortie CHEN en fonction de l’état
    with state select
        CHEN <= "0000001111" when 0,
                "0000011110" when 1,
                "0000111100" when 2,
                "0001111000" when 3,
                "0011110000" when 4,
                "0111100000" when 5,
                "1111000000" when 6,
                "1110000001" when 7,
                "1100000011" when 8,
                "1000000111" when 9,
                "0000000000" when others; -- sécurité
end architecture Behavioral;
