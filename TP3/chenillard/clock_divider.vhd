--***************************
-- Part I.A.1 Question 2
--***************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity clock_divider is
    port (
        CLKin  : in  std_logic;                    -- Horloge d'entrée
        RST    : in  std_logic;                    -- Reset synchrone, actif bas
        N      : in  std_logic_vector(4 downto 0); -- Position du bit de division (0 à 31)
        CLKout : out std_logic                     -- Horloge divisée
    );
end entity clock_divider;

architecture Behavioral of clock_divider is
    signal counter : unsigned(23 downto 0) := (others => '0'); -- Compteur 24 bits
begin
    process (CLKin)
    begin
        if (CLKin'event and CLKin = '1')  then
            if RST = '0' then
                counter <= (others => '0');
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
	 
	 -- Multiplexage du bit N du compteur pour générer la sortie
    with to_integer(unsigned(N)) select
        CLKout <= counter(0)  when  0,
                  counter(1)  when  1,
                  counter(2)  when  2,
                  counter(3)  when  3,
                  counter(4)  when  4,
                  counter(5)  when  5,
                  counter(6)  when  6,
                  counter(7)  when  7,
                  counter(8)  when  8,
                  counter(9)  when  9,
                  counter(10) when 10,
                  counter(11) when 11,
                  counter(12) when 12,
                  counter(13) when 13,
                  counter(14) when 14,
                  counter(15) when 15,
                  counter(16) when 16,
                  counter(17) when 17,
                  counter(18) when 18,
                  counter(19) when 19,
                  counter(20) when 20,
                  counter(21) when 21,
                  counter(22) when 22,
                  counter(23) when others; -- Valeur par défaut
end architecture Behavioral;
