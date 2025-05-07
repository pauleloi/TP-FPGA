library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_chenillard is
end entity tb_chenillard;

architecture tb of tb_chenillard is
    signal CLK  : std_logic := '0';
    signal RST  : std_logic := '0';
    signal CHEN : std_logic_vector(9 downto 0);
    
    -- Tableau des valeurs attendues sur CHEN (T=0 à T=10)
    type pattern_array is array (0 to 10) of std_logic_vector(9 downto 0);
    constant expected : pattern_array := (
        "0000001111",  -- T=0
        "0000011110",  -- T=1
        "0000111100",  -- T=2
        "0001111000",  -- T=3
        "0011110000",  -- T=4
        "0111100000",  -- T=5
        "1111000000",  -- T=6
        "1110000001",  -- T=7
        "1100000011",  -- T=8
        "1000000111",  -- T=9
        "0000001111"   -- T=10 (boucle)
    );
begin
    -- Instanciation du module chenillard
    UUT: entity work.chenillard
        port map (
            CLK  => CLK,
            RST  => RST,
            CHEN => CHEN
        );

    -- Horloge simulée : période 20 ns
    clk_gen: process
    begin
        while now < 3000 ns loop
            CLK <= '0';
            wait for 10 ns;
            CLK <= '1';
            wait for 10 ns;
        end loop;
        wait;
    end process;

    -- Stimuli + vérification des états
    stim_proc: process
    begin
        -- Maintien du reset quelques cycles
        RST <= '0';
        wait for 30 ns;
        RST <= '1';

        -- Vérification des 11 premières transitions (T=0 à T=10)
        for i in 0 to 10 loop
            wait until rising_edge(CLK);
            wait for 1 ns; -- stabilisation
            assert CHEN = expected(i)
						report "CHEN incorrect à T=" & integer'image(i)
                severity error;
        end loop;

        wait;
    end process;
end architecture tb;
