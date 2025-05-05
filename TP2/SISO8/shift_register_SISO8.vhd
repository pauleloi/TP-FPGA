--***************************
-- Part I.B.1 Question 2
--***************************
-- Fonctionnement d'un registre à décalage SISO 8 bits :
-- - Entrée série (Si) est injectée à chaque front montant de CLK
-- - Chaque bit se décale vers la droite à chaque coup d'horloge
-- - Sortie série (So) est le bit de poids faible (registre(0))
-- - Reset et Set asynchrones prioritaire sur horloge
--
-- Priorités :
-- 1. RSTn = 0 -> Tous les bits passent à '0'
-- 2. SETn = 0 -> Tous les bits passent à '1'
-- 3. rising_edge(CLK) -> Décalage vers la droite et insertion de Si

--***************************
-- Part I.B.1 Question 3
--***************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register_SISO8 is
    port (
        Si   : in  std_logic;                  -- Entrée série
        CLK  : in  std_logic;                  -- Horloge
        SETn : in  std_logic;                  -- Set asynchrone actif bas
        RSTn : in  std_logic;                  -- Reset asynchrone actif bas
        So   : out std_logic                   -- Sortie série
    );
end entity shift_register_SISO8;

architecture Behavioral of shift_register_SISO8 is
    signal reg : std_logic_vector(7 downto 0) := (others => '0');  -- Registre interne
begin
    process (CLK, SETn, RSTn)
    begin
        if (RSTn = '0') then
            reg <= (others => '0');
        elsif (SETn = '0') then
            reg <= (others => '1');
        elsif (CLK'event and CLK = '1') then
            reg <= Si & reg(7 downto 1);  -- Décalage vers la droite, Si entre en tête
        end if;
    end process;

    -- Sortie série = bit de poids faible
    So <= reg(0);
end architecture Behavioral;
