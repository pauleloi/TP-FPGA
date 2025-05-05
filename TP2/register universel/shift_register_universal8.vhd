--***************************
-- Part I.B.2 Question 2
--***************************
-- Fonctionnement du registre universel 8 bits :
-- Le registre effectue une opération à chaque front montant de CLK,
-- selon la valeur de SEL (priorité aux reset/set asynchrones).
--
-- | SEL      | Opération                            |
-- |----------|--------------------------------------|
-- | xxx_000  | Hold (mémorisation)                  |
-- | 001      | Décalage à droite (SSR -> reg(7))    |
-- | 010      | Décalage à gauche (SSL -> reg(0))    |
-- | 101      | Rotation à droite (reg(0) -> reg(7)) |
-- | 110      | Rotation à gauche (reg(7) -> reg(0)) |
-- | xxx_011  | Chargement parallèle (Pi)            |

--***************************
-- Part I.B.2 Question 2
--***************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register_universal8 is
    port (
        Pi    : in  std_logic_vector(7 downto 0);  -- Entrée parallèle
        SSR   : in  std_logic;                     -- Entrée série droite
        SSL   : in  std_logic;                     -- Entrée série gauche
        CLK   : in  std_logic;                     -- Horloge
        SEL   : in  std_logic_vector(2 downto 0);  -- Sélection de mode
        SETn  : in  std_logic;                     -- Set asynchrone
        RSTn  : in  std_logic;                     -- Reset asynchrone
        SOR   : out std_logic;                     -- Sortie série droite (LSB)
        SOL   : out std_logic;                     -- Sortie série gauche (MSB)
        Qo    : out std_logic_vector(7 downto 0)   -- Sortie parallèle
    );
end entity shift_register_universal8;

architecture Behavioral of shift_register_universal8 is
    signal reg : std_logic_vector(7 downto 0) := (others => '0');
begin
    process (CLK, SETn, RSTn)
    begin
        if RSTn = '0' then
            reg <= (others => '0');
        elsif SETn = '0' then
            reg <= (others => '1');
        elsif rising_edge(CLK) then
            case SEL is
                when "000" =>  -- Hold
                    reg <= reg;

                when "001" =>  -- Shift right (SSR entre en MSB)
                    reg <= SSR & reg(7 downto 1);

                when "010" =>  -- Shift left (SSL entre en LSB)
                    reg <= reg(6 downto 0) & SSL;

                when "011" =>  -- Parallel load
                    reg <= Pi;

                when "101" =>  -- Rotate right (bit 0 revient en haut)
                    reg <= reg(0) & reg(7 downto 1);

                when "110" =>  -- Rotate left (bit 7 revient en bas)
                    reg <= reg(6 downto 0) & reg(7);

                when others =>  -- Par défaut : mémorisation
                    reg <= reg;
            end case;
        end if;
    end process;

    -- Sorties
    Qo  <= reg;
    SOR <= reg(0);  -- LSB
    SOL <= reg(7);  -- MSB
end architecture Behavioral;
