library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_shift_register_universal8 is
end entity tb_shift_register_universal8;

architecture tb of tb_shift_register_universal8 is
    signal Pi    : std_logic_vector(7 downto 0) := (others => '0');
    signal SSR   : std_logic := '0';
    signal SSL   : std_logic := '0';
    signal CLK   : std_logic := '0';
    signal SEL   : std_logic_vector(2 downto 0) := "000";
    signal SETn  : std_logic := '1';
    signal RSTn  : std_logic := '1';
    signal Qo    : std_logic_vector(7 downto 0);
    signal SOR   : std_logic;
    signal SOL   : std_logic;
begin
    -- Instanciation du DUT (Design Under Test)
    UUT: entity work.shift_register_universal8
        port map (
            Pi   => Pi,
            SSR  => SSR,
            SSL  => SSL,
            CLK  => CLK,
            SEL  => SEL,
            SETn => SETn,
            RSTn => RSTn,
            SOR  => SOR,
            SOL  => SOL,
            Qo   => Qo
        );

    -- Processus de test
    stimulus: process
    begin
        -- Initialisation
        Pi <= (others => '0'); SSR <= '0'; SSL <= '0';
        SEL <= "000"; SETn <= '1'; RSTn <= '1'; CLK <= '0';
        wait for 5 ns;

        -- 1. Test Reset asynchrone
        RSTn <= '0'; wait for 5 ns;
        assert Qo = std_logic_vector(to_unsigned(0, 8)) report "Reset failed" severity error;
        RSTn <= '1'; wait for 5 ns;

        -- 2. Test Set asynchrone
        SETn <= '0'; wait for 5 ns;
        assert Qo = (7 downto 0 => '1') report "Set failed" severity error;
        SETn <= '1'; wait for 5 ns;

        -- 3. Test chargement parallèle (SEL = 011)
        Pi <= "10110011";
        SEL <= "011";
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Qo = "10110011" report "Parallel load failed" severity error;

        -- 4. Test maintien (SEL = 000)
        Pi <= "00000000"; -- Ne doit pas affecter Qo
        SEL <= "000";
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Qo = "10110011" report "Hold failed" severity error;

        -- 5. Test décalage à droite (SEL = 001)
        SSR <= '1';
        SEL <= "001";
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Qo = "11011001" report "Shift right failed" severity error;
        assert SOR = '1' report "SOR incorrect after shift right" severity error;

        -- 6. Test décalage à gauche (SEL = 010)
        SSL <= '0';
        SEL <= "010";
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Qo = "10110010" report "Shift left failed" severity error;
        assert SOL = '1' report "SOL incorrect after shift left" severity error;

        -- 7. Test rotation à droite (SEL = 101)
        SEL <= "101";
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Qo = "01011001" report "Rotate right failed" severity error;

        -- 8. Test rotation à gauche (SEL = 110)
        SEL <= "110";
        CLK <= '1'; wait for 5 ns; CLK <= '0'; wait for 5 ns;
        assert Qo = "10110010" report "Rotate left failed" severity error;

        -- Fin du test
        wait;
    end process stimulus;
end architecture tb;