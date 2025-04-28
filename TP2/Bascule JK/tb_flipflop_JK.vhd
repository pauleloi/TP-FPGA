library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_flipflop_JK is
end entity tb_flipflop_JK;

architecture tb of tb_flipflop_JK is
    signal J, K, CLK : std_logic := '0';
    signal Q, Qn     : std_logic;
begin
    -- Instanciation de la bascule JK
    UUT: entity work.flipflop_JK
        port map (
            J   => J,
            K   => K,
            CLK => CLK,
            Q   => Q,
            Qn  => Qn
        );

    -- Processus de stimulation
    stimulus: process
    begin
        -- Initialisation
        J <= '0'; K <= '0'; CLK <= '0';
        wait for 5 ns;
        
        -- Case 1 : J=0, K=0 (Mémorisation)
        J <= '0'; K <= '0';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        -- Pas d'assert car Q mémorise, état inconnu initialement

        -- Case 2 : J=0, K=1 (Réinitialisation)
        J <= '0'; K <= '1';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Q = '0' report "Error: Q should be 0 after reset (J=0, K=1)" severity error;
        assert Qn = '1' report "Error: Qn should be 1 after reset (J=0, K=1)" severity error;

        -- Case 3 : J=1, K=0 (Mise à 1)
        J <= '1'; K <= '0';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Q = '1' report "Error: Q should be 1 after set (J=1, K=0)" severity error;
        assert Qn = '0' report "Error: Qn should be 0 after set (J=1, K=0)" severity error;

        -- Case 4 : J=1, K=1 (Inversion / Toggle)
        -- Premier toggle : de 1 -> 0
        J <= '1'; K <= '1';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Q = '0' report "Error: Q should toggle to 0 (J=1, K=1)" severity error;
        assert Qn = '1' report "Error: Qn should toggle to 1 (J=1, K=1)" severity error;

        -- Deuxième toggle : de 0 -> 1
        J <= '1'; K <= '1';
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Q = '1' report "Error: Q should toggle to 1 (J=1, K=1)" severity error;
        assert Qn = '0' report "Error: Qn should toggle to 0 (J=1, K=1)" severity error;

        -- Fin de simulation
        wait;
    end process stimulus;
end architecture tb;
