library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_full_adder is
end entity tb_full_adder;

architecture tb of tb_full_adder is
    -- signaux pour piloter le full_adder
    signal A, B, Cin : std_logic := '0';
    signal S, Cout   : std_logic;
begin
    -- instanciation de l’unité sous test
    UUT: entity work.full_adder
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            S    => S,
            Cout => Cout
        );

    stimulus: process
    begin
        -- Case 1: 0 + 0 + 0 = 0, Cout = 0
        A   <= '0'; B   <= '0'; Cin <= '0';
        wait for 10 ns;
        assert S = '0'
            report "Sum error in full_adder (0+0+0)" severity error;
        assert Cout = '0'
            report "Carry error in full_adder (0+0+0)" severity error;

        -- Case 2: 0 + 0 + 1 = 1, Cout = 0
        A   <= '0'; B   <= '0'; Cin <= '1';
        wait for 10 ns;
        assert S = '1'
            report "Sum error in full_adder (0+0+1)" severity error;
        assert Cout = '0'
            report "Carry error in full_adder (0+0+1)" severity error;

        -- Case 3: 0 + 1 + 0 = 1, Cout = 0
        A   <= '0'; B   <= '1'; Cin <= '0';
        wait for 10 ns;
        assert S = '1'
            report "Sum error in full_adder (0+1+0)" severity error;
        assert Cout = '0'
            report "Carry error in full_adder (0+1+0)" severity error;

        -- Case 4: 0 + 1 + 1 = 0, Cout = 1
        A   <= '0'; B   <= '1'; Cin <= '1';
        wait for 10 ns;
        assert S = '0'
            report "Sum error in full_adder (0+1+1)" severity error;
        assert Cout = '1'
            report "Carry error in full_adder (0+1+1)" severity error;

        -- Case 5: 1 + 0 + 0 = 1, Cout = 0
        A   <= '1'; B   <= '0'; Cin <= '0';
        wait for 10 ns;
        assert S = '1'
            report "Sum error in full_adder (1+0+0)" severity error;
        assert Cout = '0'
            report "Carry error in full_adder (1+0+0)" severity error;

        -- Case 6: 1 + 0 + 1 = 0, Cout = 1
        A   <= '1'; B   <= '0'; Cin <= '1';
        wait for 10 ns;
        assert S = '0'
            report "Sum error in full_adder (1+0+1)" severity error;
        assert Cout = '1'
            report "Carry error in full_adder (1+0+1)" severity error;

        -- Case 7: 1 + 1 + 0 = 0, Cout = 1
        A   <= '1'; B   <= '1'; Cin <= '0';
        wait for 10 ns;
        assert S = '0'
            report "Sum error in full_adder (1+1+0)" severity error;
        assert Cout = '1'
            report "Carry error in full_adder (1+1+0)" severity error;

        -- Case 8: 1 + 1 + 1 = 1, Cout = 1
        A   <= '1'; B   <= '1'; Cin <= '1';
        wait for 10 ns;
        assert S = '1'
            report "Sum error in full_adder (1+1+1)" severity error;
        assert Cout = '1'
            report "Carry error in full_adder (1+1+1)" severity error;

        -- fin de la stimulation
        wait;
    end process stimulus;
end architecture tb;
