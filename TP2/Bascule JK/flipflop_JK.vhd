--***************************
-- Part I.A.1 Question 2
--***************************
-- Fonctionnement de la bascule JK :
--
-- | J | K |  Qn  | Description              |
-- |---|---|------|--------------------------|
-- | 0 | 0 |  Q   | Mémorisation             |
-- | 0 | 1 |  1   | Réinitialisation         |
-- | 1 | 0 |  0   | Mise à 1                 |
-- | 1 | 1 |  Ǭ   | Inversion (toggle)       |

--***************************
-- Part I.A.1 Question 3
--***************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	
entity flipflop_JK is
    port(
        J   : in  std_logic;  -- Entrée J
        K   : in  std_logic;  -- Entrée K
        CLK : in  std_logic;  -- Horloge (front montant)
        Q   : out std_logic;  -- Sortie directe
        Qn  : out std_logic   -- Sortie complémentée
    );
end entity flipflop_JK;

architecture Behavioral of flipflop_JK is
    signal Q_int : std_logic := '0';  -- Signal interne pour mémoriser l'état
begin
    process (CLK)
    begin
        if (CLK'event and CLK = '1') then
            case std_logic_vector'(J & K) is
                when "00" => -- Mémorisation
                    Q_int <= Q_int;
                when "01" => -- Réinitialisation
                    Q_int <= '0';
                when "10" => -- Mise à 1
                    Q_int <= '1';
                when "11" => -- Inversion (toggle)
                    Q_int <= not Q_int;
                when others => -- Autre cas
                    Q_int <= Q_int;
            end case;
        end if;
    end process;

    -- Sorties
    Q  <= Q_int;
    Qn <= not Q_int;
end architecture Behavioral;
