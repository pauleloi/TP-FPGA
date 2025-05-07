library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_clock_divider is
end entity tb_clock_divider;

architecture tb of tb_clock_divider is
    -- Signaux pour l'UUT
    signal CLKin  : std_logic := '0';
    signal RST    : std_logic := '1';
    signal N      : std_logic_vector(4 downto 0) := "00010";  -- N = 2
    signal CLKout : std_logic;
    
    -- Compteur d'événements pour vérification manuelle
    signal clkout_transitions : integer := 0;
    signal last_clkout        : std_logic := '0';
begin
    -- Instanciation du diviseur d'horloge
    UUT: entity work.clock_divider
        port map (
            CLKin  => CLKin,
            RST    => RST,
            N      => N,
            CLKout => CLKout
        );

    -- Génération de l'horloge d'entrée (période 20 ns)
    clk_gen: process
    begin
        while now < 2000 ns loop  -- simulation sur 2 us
            CLKin <= '0';
            wait for 10 ns;
            CLKin <= '1';
            wait for 10 ns;
        end loop;
        wait;
    end process clk_gen;

    -- Séquence de test
    stim_proc: process
    begin
        -- Reset actif pendant un moment
        RST <= '0';
        wait for 40 ns;
        RST <= '1';

        -- Attendre que CLKout bascule plusieurs fois
        wait for 1000 ns;
        wait;
    end process stim_proc;

    -- Détection des fronts de CLKout (optionnel)
    monitor: process(CLKout)
    begin
        if rising_edge(CLKout) then
            clkout_transitions <= clkout_transitions + 1;
        end if;
    end process;

end architecture tb;
