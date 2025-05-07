library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_bistable is
end entity;

architecture tb of tb_bistable is
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal X   : std_logic := '0';
    signal Y   : std_logic;

    -- Type pour historique attendu (état Y)
    type y_array is array (natural range <>) of std_logic;
    constant expected_Y : y_array := (
        '0',  -- T0: A
        '1',  -- T1: B
        '1',  -- T2: B
        '1',  -- T3: C
        '0',  -- T4: D
        '0'   -- T5: A (reset)
    );
begin
    -- Instanciation du bistable
    UUT: entity work.bistable
        port map (
            clk => clk,
            rst => rst,
            X   => X,
            Y   => Y
        );

    -- Horloge de test : période 20 ns
    clk_gen: process
    begin
        while now < 200 ns loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
        wait;
    end process;

    -- Stimulus principal
    stim_proc: process
        variable step : integer := 0;
    begin
        -- Reset initial actif
        rst <= '1';
        wait for 25 ns;  -- quelques cycles
        rst <= '0';
        wait for 20 ns;  -- relâche le reset après front d'horloge

        -- Étape 1: X=1 → A → B
        X <= '1';
        wait for 20 ns;  -- T1
        assert Y = expected_Y(step) report "Erreur Y à T1" severity error; step := step + 1;

        -- Étape 2: X=1 → B reste B
        wait for 20 ns;  -- T2
        assert Y = expected_Y(step) report "Erreur Y à T2" severity error; step := step + 1;

        -- Étape 3: X=0 → B → C
        X <= '0';
        wait for 20 ns;  -- T3
        assert Y = expected_Y(step) report "Erreur Y à T3" severity error; step := step + 1;

        -- Étape 4: X=1 → C → D
        X <= '1';
        wait for 20 ns;  -- T4
        assert Y = expected_Y(step) report "Erreur Y à T4" severity error; step := step + 1;

        -- Étape 5: X=0 → D → A
        X <= '0';
        wait for 20 ns;  -- T5
        assert Y = expected_Y(step) report "Erreur Y à T5" severity error; step := step + 1;

        -- Étape 6: Reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait for 20 ns;
        assert Y = expected_Y(step) report "Erreur Y après reset" severity error;

        wait;
    end process;
end architecture;