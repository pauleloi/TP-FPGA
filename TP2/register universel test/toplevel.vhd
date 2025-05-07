library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel is
    port (
        SW   : in  std_logic_vector(9 downto 0);   -- Interrupteurs
        KEY  : in  std_logic_vector(3 downto 0);   -- Boutons
        LEDG : out std_logic_vector(7 downto 0)    -- LEDs vertes (Qo)
        -- LEDR n'est pas utilisé ici
    );
end entity toplevel;

architecture Structural of toplevel is
begin
    -- Instanciation du registre universel
    reg_u: entity work.shift_register_universal8
        port map (
            Pi   => (others => '0'),             -- Entrée parallèle inutilisée (fixée à 0)
            SSR  => SW(9),                       -- SW9 → Shift Right Serial In
            SSL  => SW(8),                       -- SW8 → Shift Left Serial In
            CLK  => not KEY(0),                  -- not(KEY0) → Horloge
            SEL  => SW(2 downto 0),              -- SW2..SW0 → Mode de sélection
            SETn => KEY(2),                      -- KEY2 → SETn (actif bas)
            RSTn => KEY(3),                      -- KEY3 → RSTn (actif bas)
            SOR  => open,                        -- Non utilisé
            SOL  => open,                        -- Non utilisé
            Qo   => LEDG                         -- Sortie parallèle → LEDG
        );
end architecture Structural;
