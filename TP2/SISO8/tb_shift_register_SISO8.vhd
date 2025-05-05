library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_shift_register_SISO8 is
end entity tb_shift_register_SISO8;

architecture tb of tb_shift_register_SISO8 is
    signal Si, CLK, SETn, RSTn : std_logic := '1';
    signal So                  : std_logic;
begin
    -- Instanciation de l'unité sous test (UUT)
    UUT: entity work.shift_register_SISO8
        port map (
            Si   => Si,
            CLK  => CLK,
            SETn => SETn,
            RSTn => RSTn,
            So   => So
        );

    -- Processus de stimulation
    stimulus: process
    begin
        -- Initialisation
        Si <= '0'; CLK <= '0'; SETn <= '1'; RSTn <= '1';
        wait for 5 ns;

        -- Test 1 : Reset asynchrone
        RSTn <= '0'; wait for 5 ns;
        assert So = '0'
            report "Error: After reset, So should be 0" severity error;
        RSTn <= '1'; wait for 5 ns; -- Fin du reset

        -- Test 2 : Set asynchrone
        SETn <= '0'; wait for 5 ns;
        assert So = '1'
            report "Error: After set, So should be 1" severity error;
        SETn <= '1'; wait for 5 ns; -- Fin du set

        -- Test 3 : Défilement des bits
        -- Charger une série connue de bits : 1, 0, 1, 1, 0, 0, 1, 0
        -- On injecte à gauche (bit après bit)

        -- Injection de 1
        Si <= '1';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        -- Injection de 0
        Si <= '0';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        -- Injection de 1
        Si <= '1';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        -- Injection de 1
        Si <= '1';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        -- Injection de 0
        Si <= '0';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        -- Injection de 0
        Si <= '0';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        -- Injection de 1
        Si <= '1';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        -- Injection de 0
        Si <= '0';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;

        -- À ce stade, le registre contient "10110010" (bit le plus récent à gauche)

        -- Test du décalage de sortie
        -- On attend 8 clocks pour voir sortir les bits un par un sur So
        for i in 0 to 7 loop
            CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        end loop;

        -- Fin de la simulation
        wait;
    end process stimulus;
end architecture tb;
