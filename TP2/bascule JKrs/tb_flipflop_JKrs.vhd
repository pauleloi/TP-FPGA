library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_flipflop_JKrs is
end entity tb_flipflop_JKrs;

architecture tb of tb_flipflop_JKrs is
    signal J, K, CLK, SETn, RSTn : std_logic := '1';
    signal Q, Qn                 : std_logic;
begin
    -- Instanciation de l'unité sous test (UUT)
    UUT: entity work.flipflop_JKrs
        port map (
            J    => J,
            K    => K,
            CLK  => CLK,
            SETn => SETn,
            RSTn => RSTn,
            Q    => Q,
            Qn   => Qn
        );

    -- Processus de stimulation
    stimulus: process
    begin
        -- Initialisation
        J <= '0'; K <= '0'; CLK <= '0'; SETn <= '1'; RSTn <= '1';
        wait for 5 ns;

        -- Test 1 : Reset asynchrone
        RSTn <= '0'; wait for 5 ns;
        assert Q = '0' report "Error: Q should be 0 after reset async" severity error;
        assert Qn = '1' report "Error: Qn should be 1 after reset async" severity error;
        RSTn <= '1'; wait for 5 ns; -- Relever le reset

        -- Test 2 : Set asynchrone
        SETn <= '0'; wait for 5 ns;
        assert Q = '1' report "Error: Q should be 1 after set async" severity error;
        assert Qn = '0' report "Error: Qn should be 0 after set async" severity error;
        SETn <= '1'; wait for 5 ns; -- Relever le set

        -- Test 3 : Fonctionnement normal JK
        -- J=0, K=1 -> Reset synchrone
        J <= '0'; K <= '1';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Q = '0' report "Error: Q should be 0 after J=0 K=1" severity error;
        assert Qn = '1' report "Error: Qn should be 1 after J=0 K=1" severity error;

        -- J=1, K=0 -> Set synchrone
        J <= '1'; K <= '0';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Q = '1' report "Error: Q should be 1 after J=1 K=0" severity error;
        assert Qn = '0' report "Error: Qn should be 0 after J=1 K=0" severity error;

        -- J=1, K=1 -> Toggle
        J <= '1'; K <= '1';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Q = '0' report "Error: Q should toggle to 0 after J=1 K=1" severity error;
        assert Qn = '1' report "Error: Qn should toggle to 1 after J=1 K=1" severity error;

        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Q = '1' report "Error: Q should toggle to 1 after second J=1 K=1" severity error;
        assert Qn = '0' report "Error: Qn should toggle to 0 after second J=1 K=1" severity error;

        -- Fin de la simulation
        wait;
    end process stimulus;
end architecture tb;
