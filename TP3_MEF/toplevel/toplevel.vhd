library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel is
    port (
        CLOCK_50_B6A : in  std_logic;                      -- Horloge 50 MHz
        KEY          : in  std_logic_vector(3 downto 0);   -- Boutons
        LEDG         : out std_logic_vector(7 downto 0)    -- LEDs vertes
    );
end entity toplevel;

architecture structural of toplevel is
    signal clk : std_logic;
    signal rst : std_logic;
    signal X   : std_logic;
    signal Y   : std_logic;
begin
    -- Connexions
    clk <= CLOCK_50_B6A;
    rst <= not KEY(0);    -- Reset actif haut, bouton actif bas → inversion
    X   <= not KEY(3);    -- Entrée X contrôlée par KEY(3), aussi actif bas

    -- Instanciation de la MEF bistable
    fsm_inst : entity work.bistable
        port map (
            clk => clk,
            rst => rst,
            X   => X,
            Y   => Y
        );

    -- Affichage sur LEDG : toutes les LEDs ON/OFF selon Y
    LEDG <= (others => Y);
end architecture structural;
