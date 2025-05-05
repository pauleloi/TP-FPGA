--***************************
-- Part I.A.2 Question 2
--***************************
-- Fonctionnement de la bascule JK avec Reset et Set asynchrones :
--
-- Priorité :
-- 1. RSTn = 0 : Reset immédiat (Q = 0, Qn = 1)
-- 2. SETn = 0 : Set immédiat (Q = 1, Qn = 0)
-- 3. Sinon : Fonctionnement normal au front montant de CLK
--
-- Fonctionnement normal :
-- | J | K | Q(n+1) | Qn(n+1) | Description         |
-- |---|---|--------|---------|---------------------|
-- | 0 | 0 |   Q    |   Qn    | Mémorisation         |
-- | 0 | 1 |   0    |   1     | Réinitialisation     |
-- | 1 | 0 |   1    |   0     | Mise à 1             |
-- | 1 | 1 |   Qn   |   Q     | Inversion (toggle)   |

--***************************
-- Part I.A.2 Question 3
--***************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flipflop_JKrs is
    port(
        J    : in  std_logic;  -- Entrée J
        K    : in  std_logic;  -- Entrée K
        CLK  : in  std_logic;  -- Horloge (front montant)
        SETn : in  std_logic;  -- Set asynchrone actif à 0
        RSTn : in  std_logic;  -- Reset asynchrone actif à 0
        Q    : out std_logic;  -- Sortie directe
        Qn   : out std_logic   -- Sortie complémentée
    );
end entity flipflop_JKrs;

architecture Behavioral of flipflop_JKrs is
    signal Q_int : std_logic := '0';  -- Signal interne
begin
    process (CLK, SETn, RSTn)
    begin
        -- Priorité aux resets asynchrones
        if (RSTn = '0') then
            Q_int <= '0';   -- Reset immédiat
        elsif (SETn = '0') then
            Q_int <= '1';   -- Set immédiat
        elsif (CLK'event and CLK = '1') then
            -- Fonctionnement synchrone classique
            case std_logic_vector'(J & K) is
                when "00" => -- Mémorisation
                    Q_int <= Q_int;
                when "01" => -- Réinitialisation
                    Q_int <= '0';
                when "10" => -- Mise à 1
                    Q_int <= '1';
                when "11" => -- Inversion (toggle)
                    Q_int <= not Q_int;
                when others =>
                    Q_int <= Q_int;
            end case;
        end if;
    end process;

    -- Sorties
    Q  <= Q_int;
    Qn <= not Q_int;
end architecture Behavioral;
