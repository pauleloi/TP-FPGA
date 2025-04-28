-- Top-level pour l’additionneur complet 4 bits
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel is
    port (
        LEDR : out std_logic_vector(9 downto 0);  -- LEDs rouges (affichage des entrées)
        LEDG : out std_logic_vector(7 downto 0);  -- LEDs vertes (affichage de la sortie)
        SW   : in  std_logic_vector(9 downto 0)   -- Switches (entrées A[3:0], B[3:0], Cin)
    );
end entity toplevel;

architecture structural of toplevel is
begin
    -- Affichage des entrées sur LEDs rouges
    LEDR(3 downto 0) <= SW(3 downto 0);  -- A sur LEDR0-3
    LEDR(7 downto 4) <= SW(7 downto 4);  -- B sur LEDR4-7
    LEDR(9)          <= SW(9);          -- Cin sur LEDR9
    LEDR(8)          <= '0';            -- LEDR8 non utilisée

    -- Instanciation de full_adder_4b
    adder4b: entity work.full_adder_4b
        port map (
            A    => SW(3 downto 0),
            B    => SW(7 downto 4),
            Cin  => SW(9),
            S    => LEDG(3 downto 0),
            Cout => LEDG(7)
        );
end architecture structural;