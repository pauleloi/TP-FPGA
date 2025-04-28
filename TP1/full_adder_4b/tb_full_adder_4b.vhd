-- Solution 1 : Script généré par IA, ce script utilise des boucles pour généré les 512 cas

-- Ce script est généré par IA, dans l'idéal il faudrait faire un test du tesbench
-- Autre solution : faire un script pyhton qui génère tout le testbench (512 cas)
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--
--entity tb_full_adder_4b is
--end entity tb_full_adder_4b;
--
--architecture test of tb_full_adder_4b is
--    signal A, B   : std_logic_vector(3 downto 0) := (others => '0');
--    signal Cin    : std_logic := '0';
--    signal S      : std_logic_vector(3 downto 0);
--    signal Cout   : std_logic;
--begin
--    uut: entity work.full_adder_4b
--      port map (
--        A    => A,
--        B    => B,
--        Cin  => Cin,
--        S    => S,
--        Cout => Cout
--      );
--
--    stimulus: process
--        variable ia, ib, ic : integer;
--        variable sum_int    : integer;
--    begin
--        for ia in 0 to 15 loop
--            for ib in 0 to 15 loop
--                for ic in 0 to 1 loop
--                    -- Appliquer les vecteurs
--                    A   <= std_logic_vector(to_unsigned(ia, 4));
--                    B   <= std_logic_vector(to_unsigned(ib, 4));
--                    if ic = 0 then
--                        Cin <= '0';
--                    else
--                        Cin <= '1';
--                    end if;
--                    wait for 10 ns;
--
--                    -- Calcul attendu
--                    sum_int := ia + ib + ic;
--
--                    -- Vérifier la somme
--                    assert S = std_logic_vector(to_unsigned(sum_int mod 16, 4))
--                        report "Sum error for A=" & integer'image(ia)
--                             & " B=" & integer'image(ib)
--                             & " Cin=" & integer'image(ic)
--                        severity error;
--
--                    -- Vérifier la retenue de sortie
--                    if sum_int >= 16 then
--                        assert Cout = '1'
--                            report "Carry error for A=" & integer'image(ia)
--                                 & " B=" & integer'image(ib)
--                                 & " Cin=" & integer'image(ic)
--                            severity error;
--                    else
--                        assert Cout = '0'
--                            report "Carry error for A=" & integer'image(ia)
--                                 & " B=" & integer'image(ib)
--                                 & " Cin=" & integer'image(ic)
--                            severity error;
--                    end if;
--                end loop;
--            end loop;
--        end loop;
--
--        wait;  -- fin de simulation
--    end process stimulus;
--end architecture test;

-- Solution 2 : Script généré par un script python

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_full_adder_4b is
end entity tb_full_adder_4b;

architecture tb of tb_full_adder_4b is
    signal A, B  : std_logic_vector(3 downto 0);
    signal Cin   : std_logic;
    signal S     : std_logic_vector(3 downto 0);
    signal Cout  : std_logic;
begin

    UUT: entity work.full_adder_4b
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            S    => S,
            Cout => Cout
        );

    stimulus: process
    begin
        -- Case 001: A=0000 B=0000 Cin=0 -> S=0000 Cout=0
        A   <= "0000";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=0, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=0, Cin=0)" severity error;

        -- Case 002: A=0000 B=0000 Cin=1 -> S=0001 Cout=0
        A   <= "0000";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=0, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=0, Cin=1)" severity error;

        -- Case 003: A=0000 B=0001 Cin=0 -> S=0001 Cout=0
        A   <= "0000";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=0, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=1, Cin=0)" severity error;

        -- Case 004: A=0000 B=0001 Cin=1 -> S=0010 Cout=0
        A   <= "0000";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=0, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=1, Cin=1)" severity error;

        -- Case 005: A=0000 B=0010 Cin=0 -> S=0010 Cout=0
        A   <= "0000";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=0, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=2, Cin=0)" severity error;

        -- Case 006: A=0000 B=0010 Cin=1 -> S=0011 Cout=0
        A   <= "0000";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=0, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=2, Cin=1)" severity error;

        -- Case 007: A=0000 B=0011 Cin=0 -> S=0011 Cout=0
        A   <= "0000";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=0, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=3, Cin=0)" severity error;

        -- Case 008: A=0000 B=0011 Cin=1 -> S=0100 Cout=0
        A   <= "0000";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=0, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=3, Cin=1)" severity error;

        -- Case 009: A=0000 B=0100 Cin=0 -> S=0100 Cout=0
        A   <= "0000";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=0, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=4, Cin=0)" severity error;

        -- Case 010: A=0000 B=0100 Cin=1 -> S=0101 Cout=0
        A   <= "0000";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=0, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=4, Cin=1)" severity error;

        -- Case 011: A=0000 B=0101 Cin=0 -> S=0101 Cout=0
        A   <= "0000";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=0, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=5, Cin=0)" severity error;

        -- Case 012: A=0000 B=0101 Cin=1 -> S=0110 Cout=0
        A   <= "0000";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=0, B=5, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=5, Cin=1)" severity error;

        -- Case 013: A=0000 B=0110 Cin=0 -> S=0110 Cout=0
        A   <= "0000";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=0, B=6, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=6, Cin=0)" severity error;

        -- Case 014: A=0000 B=0110 Cin=1 -> S=0111 Cout=0
        A   <= "0000";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=0, B=6, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=6, Cin=1)" severity error;

        -- Case 015: A=0000 B=0111 Cin=0 -> S=0111 Cout=0
        A   <= "0000";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=0, B=7, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=7, Cin=0)" severity error;

        -- Case 016: A=0000 B=0111 Cin=1 -> S=1000 Cout=0
        A   <= "0000";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=0, B=7, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=7, Cin=1)" severity error;

        -- Case 017: A=0000 B=1000 Cin=0 -> S=1000 Cout=0
        A   <= "0000";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=0, B=8, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=8, Cin=0)" severity error;

        -- Case 018: A=0000 B=1000 Cin=1 -> S=1001 Cout=0
        A   <= "0000";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=0, B=8, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=8, Cin=1)" severity error;

        -- Case 019: A=0000 B=1001 Cin=0 -> S=1001 Cout=0
        A   <= "0000";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=0, B=9, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=9, Cin=0)" severity error;

        -- Case 020: A=0000 B=1001 Cin=1 -> S=1010 Cout=0
        A   <= "0000";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=0, B=9, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=9, Cin=1)" severity error;

        -- Case 021: A=0000 B=1010 Cin=0 -> S=1010 Cout=0
        A   <= "0000";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=0, B=10, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=10, Cin=0)" severity error;

        -- Case 022: A=0000 B=1010 Cin=1 -> S=1011 Cout=0
        A   <= "0000";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=0, B=10, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=10, Cin=1)" severity error;

        -- Case 023: A=0000 B=1011 Cin=0 -> S=1011 Cout=0
        A   <= "0000";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=0, B=11, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=11, Cin=0)" severity error;

        -- Case 024: A=0000 B=1011 Cin=1 -> S=1100 Cout=0
        A   <= "0000";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=0, B=11, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=11, Cin=1)" severity error;

        -- Case 025: A=0000 B=1100 Cin=0 -> S=1100 Cout=0
        A   <= "0000";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=0, B=12, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=12, Cin=0)" severity error;

        -- Case 026: A=0000 B=1100 Cin=1 -> S=1101 Cout=0
        A   <= "0000";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=0, B=12, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=12, Cin=1)" severity error;

        -- Case 027: A=0000 B=1101 Cin=0 -> S=1101 Cout=0
        A   <= "0000";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=0, B=13, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=13, Cin=0)" severity error;

        -- Case 028: A=0000 B=1101 Cin=1 -> S=1110 Cout=0
        A   <= "0000";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=0, B=13, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=13, Cin=1)" severity error;

        -- Case 029: A=0000 B=1110 Cin=0 -> S=1110 Cout=0
        A   <= "0000";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=0, B=14, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=14, Cin=0)" severity error;

        -- Case 030: A=0000 B=1110 Cin=1 -> S=1111 Cout=0
        A   <= "0000";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=0, B=14, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=14, Cin=1)" severity error;

        -- Case 031: A=0000 B=1111 Cin=0 -> S=1111 Cout=0
        A   <= "0000";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=0, B=15, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=0, B=15, Cin=0)" severity error;

        -- Case 032: A=0000 B=1111 Cin=1 -> S=0000 Cout=1
        A   <= "0000";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=0, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=0, B=15, Cin=1)" severity error;

        -- Case 033: A=0001 B=0000 Cin=0 -> S=0001 Cout=0
        A   <= "0001";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=1, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=0, Cin=0)" severity error;

        -- Case 034: A=0001 B=0000 Cin=1 -> S=0010 Cout=0
        A   <= "0001";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=1, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=0, Cin=1)" severity error;

        -- Case 035: A=0001 B=0001 Cin=0 -> S=0010 Cout=0
        A   <= "0001";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=1, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=1, Cin=0)" severity error;

        -- Case 036: A=0001 B=0001 Cin=1 -> S=0011 Cout=0
        A   <= "0001";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=1, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=1, Cin=1)" severity error;

        -- Case 037: A=0001 B=0010 Cin=0 -> S=0011 Cout=0
        A   <= "0001";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=1, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=2, Cin=0)" severity error;

        -- Case 038: A=0001 B=0010 Cin=1 -> S=0100 Cout=0
        A   <= "0001";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=1, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=2, Cin=1)" severity error;

        -- Case 039: A=0001 B=0011 Cin=0 -> S=0100 Cout=0
        A   <= "0001";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=1, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=3, Cin=0)" severity error;

        -- Case 040: A=0001 B=0011 Cin=1 -> S=0101 Cout=0
        A   <= "0001";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=1, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=3, Cin=1)" severity error;

        -- Case 041: A=0001 B=0100 Cin=0 -> S=0101 Cout=0
        A   <= "0001";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=1, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=4, Cin=0)" severity error;

        -- Case 042: A=0001 B=0100 Cin=1 -> S=0110 Cout=0
        A   <= "0001";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=1, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=4, Cin=1)" severity error;

        -- Case 043: A=0001 B=0101 Cin=0 -> S=0110 Cout=0
        A   <= "0001";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=1, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=5, Cin=0)" severity error;

        -- Case 044: A=0001 B=0101 Cin=1 -> S=0111 Cout=0
        A   <= "0001";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=1, B=5, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=5, Cin=1)" severity error;

        -- Case 045: A=0001 B=0110 Cin=0 -> S=0111 Cout=0
        A   <= "0001";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=1, B=6, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=6, Cin=0)" severity error;

        -- Case 046: A=0001 B=0110 Cin=1 -> S=1000 Cout=0
        A   <= "0001";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=1, B=6, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=6, Cin=1)" severity error;

        -- Case 047: A=0001 B=0111 Cin=0 -> S=1000 Cout=0
        A   <= "0001";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=1, B=7, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=7, Cin=0)" severity error;

        -- Case 048: A=0001 B=0111 Cin=1 -> S=1001 Cout=0
        A   <= "0001";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=1, B=7, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=7, Cin=1)" severity error;

        -- Case 049: A=0001 B=1000 Cin=0 -> S=1001 Cout=0
        A   <= "0001";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=1, B=8, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=8, Cin=0)" severity error;

        -- Case 050: A=0001 B=1000 Cin=1 -> S=1010 Cout=0
        A   <= "0001";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=1, B=8, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=8, Cin=1)" severity error;

        -- Case 051: A=0001 B=1001 Cin=0 -> S=1010 Cout=0
        A   <= "0001";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=1, B=9, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=9, Cin=0)" severity error;

        -- Case 052: A=0001 B=1001 Cin=1 -> S=1011 Cout=0
        A   <= "0001";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=1, B=9, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=9, Cin=1)" severity error;

        -- Case 053: A=0001 B=1010 Cin=0 -> S=1011 Cout=0
        A   <= "0001";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=1, B=10, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=10, Cin=0)" severity error;

        -- Case 054: A=0001 B=1010 Cin=1 -> S=1100 Cout=0
        A   <= "0001";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=1, B=10, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=10, Cin=1)" severity error;

        -- Case 055: A=0001 B=1011 Cin=0 -> S=1100 Cout=0
        A   <= "0001";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=1, B=11, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=11, Cin=0)" severity error;

        -- Case 056: A=0001 B=1011 Cin=1 -> S=1101 Cout=0
        A   <= "0001";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=1, B=11, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=11, Cin=1)" severity error;

        -- Case 057: A=0001 B=1100 Cin=0 -> S=1101 Cout=0
        A   <= "0001";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=1, B=12, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=12, Cin=0)" severity error;

        -- Case 058: A=0001 B=1100 Cin=1 -> S=1110 Cout=0
        A   <= "0001";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=1, B=12, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=12, Cin=1)" severity error;

        -- Case 059: A=0001 B=1101 Cin=0 -> S=1110 Cout=0
        A   <= "0001";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=1, B=13, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=13, Cin=0)" severity error;

        -- Case 060: A=0001 B=1101 Cin=1 -> S=1111 Cout=0
        A   <= "0001";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=1, B=13, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=13, Cin=1)" severity error;

        -- Case 061: A=0001 B=1110 Cin=0 -> S=1111 Cout=0
        A   <= "0001";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=1, B=14, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=1, B=14, Cin=0)" severity error;

        -- Case 062: A=0001 B=1110 Cin=1 -> S=0000 Cout=1
        A   <= "0001";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=1, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=1, B=14, Cin=1)" severity error;

        -- Case 063: A=0001 B=1111 Cin=0 -> S=0000 Cout=1
        A   <= "0001";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=1, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=1, B=15, Cin=0)" severity error;

        -- Case 064: A=0001 B=1111 Cin=1 -> S=0001 Cout=1
        A   <= "0001";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=1, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=1, B=15, Cin=1)" severity error;

        -- Case 065: A=0010 B=0000 Cin=0 -> S=0010 Cout=0
        A   <= "0010";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=2, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=0, Cin=0)" severity error;

        -- Case 066: A=0010 B=0000 Cin=1 -> S=0011 Cout=0
        A   <= "0010";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=2, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=0, Cin=1)" severity error;

        -- Case 067: A=0010 B=0001 Cin=0 -> S=0011 Cout=0
        A   <= "0010";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=2, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=1, Cin=0)" severity error;

        -- Case 068: A=0010 B=0001 Cin=1 -> S=0100 Cout=0
        A   <= "0010";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=2, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=1, Cin=1)" severity error;

        -- Case 069: A=0010 B=0010 Cin=0 -> S=0100 Cout=0
        A   <= "0010";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=2, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=2, Cin=0)" severity error;

        -- Case 070: A=0010 B=0010 Cin=1 -> S=0101 Cout=0
        A   <= "0010";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=2, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=2, Cin=1)" severity error;

        -- Case 071: A=0010 B=0011 Cin=0 -> S=0101 Cout=0
        A   <= "0010";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=2, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=3, Cin=0)" severity error;

        -- Case 072: A=0010 B=0011 Cin=1 -> S=0110 Cout=0
        A   <= "0010";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=2, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=3, Cin=1)" severity error;

        -- Case 073: A=0010 B=0100 Cin=0 -> S=0110 Cout=0
        A   <= "0010";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=2, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=4, Cin=0)" severity error;

        -- Case 074: A=0010 B=0100 Cin=1 -> S=0111 Cout=0
        A   <= "0010";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=2, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=4, Cin=1)" severity error;

        -- Case 075: A=0010 B=0101 Cin=0 -> S=0111 Cout=0
        A   <= "0010";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=2, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=5, Cin=0)" severity error;

        -- Case 076: A=0010 B=0101 Cin=1 -> S=1000 Cout=0
        A   <= "0010";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=2, B=5, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=5, Cin=1)" severity error;

        -- Case 077: A=0010 B=0110 Cin=0 -> S=1000 Cout=0
        A   <= "0010";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=2, B=6, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=6, Cin=0)" severity error;

        -- Case 078: A=0010 B=0110 Cin=1 -> S=1001 Cout=0
        A   <= "0010";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=2, B=6, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=6, Cin=1)" severity error;

        -- Case 079: A=0010 B=0111 Cin=0 -> S=1001 Cout=0
        A   <= "0010";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=2, B=7, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=7, Cin=0)" severity error;

        -- Case 080: A=0010 B=0111 Cin=1 -> S=1010 Cout=0
        A   <= "0010";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=2, B=7, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=7, Cin=1)" severity error;

        -- Case 081: A=0010 B=1000 Cin=0 -> S=1010 Cout=0
        A   <= "0010";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=2, B=8, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=8, Cin=0)" severity error;

        -- Case 082: A=0010 B=1000 Cin=1 -> S=1011 Cout=0
        A   <= "0010";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=2, B=8, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=8, Cin=1)" severity error;

        -- Case 083: A=0010 B=1001 Cin=0 -> S=1011 Cout=0
        A   <= "0010";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=2, B=9, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=9, Cin=0)" severity error;

        -- Case 084: A=0010 B=1001 Cin=1 -> S=1100 Cout=0
        A   <= "0010";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=2, B=9, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=9, Cin=1)" severity error;

        -- Case 085: A=0010 B=1010 Cin=0 -> S=1100 Cout=0
        A   <= "0010";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=2, B=10, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=10, Cin=0)" severity error;

        -- Case 086: A=0010 B=1010 Cin=1 -> S=1101 Cout=0
        A   <= "0010";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=2, B=10, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=10, Cin=1)" severity error;

        -- Case 087: A=0010 B=1011 Cin=0 -> S=1101 Cout=0
        A   <= "0010";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=2, B=11, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=11, Cin=0)" severity error;

        -- Case 088: A=0010 B=1011 Cin=1 -> S=1110 Cout=0
        A   <= "0010";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=2, B=11, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=11, Cin=1)" severity error;

        -- Case 089: A=0010 B=1100 Cin=0 -> S=1110 Cout=0
        A   <= "0010";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=2, B=12, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=12, Cin=0)" severity error;

        -- Case 090: A=0010 B=1100 Cin=1 -> S=1111 Cout=0
        A   <= "0010";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=2, B=12, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=12, Cin=1)" severity error;

        -- Case 091: A=0010 B=1101 Cin=0 -> S=1111 Cout=0
        A   <= "0010";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=2, B=13, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=2, B=13, Cin=0)" severity error;

        -- Case 092: A=0010 B=1101 Cin=1 -> S=0000 Cout=1
        A   <= "0010";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=2, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=2, B=13, Cin=1)" severity error;

        -- Case 093: A=0010 B=1110 Cin=0 -> S=0000 Cout=1
        A   <= "0010";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=2, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=2, B=14, Cin=0)" severity error;

        -- Case 094: A=0010 B=1110 Cin=1 -> S=0001 Cout=1
        A   <= "0010";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=2, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=2, B=14, Cin=1)" severity error;

        -- Case 095: A=0010 B=1111 Cin=0 -> S=0001 Cout=1
        A   <= "0010";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=2, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=2, B=15, Cin=0)" severity error;

        -- Case 096: A=0010 B=1111 Cin=1 -> S=0010 Cout=1
        A   <= "0010";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=2, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=2, B=15, Cin=1)" severity error;

        -- Case 097: A=0011 B=0000 Cin=0 -> S=0011 Cout=0
        A   <= "0011";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=3, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=0, Cin=0)" severity error;

        -- Case 098: A=0011 B=0000 Cin=1 -> S=0100 Cout=0
        A   <= "0011";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=3, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=0, Cin=1)" severity error;

        -- Case 099: A=0011 B=0001 Cin=0 -> S=0100 Cout=0
        A   <= "0011";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=3, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=1, Cin=0)" severity error;

        -- Case 100: A=0011 B=0001 Cin=1 -> S=0101 Cout=0
        A   <= "0011";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=3, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=1, Cin=1)" severity error;

        -- Case 101: A=0011 B=0010 Cin=0 -> S=0101 Cout=0
        A   <= "0011";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=3, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=2, Cin=0)" severity error;

        -- Case 102: A=0011 B=0010 Cin=1 -> S=0110 Cout=0
        A   <= "0011";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=3, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=2, Cin=1)" severity error;

        -- Case 103: A=0011 B=0011 Cin=0 -> S=0110 Cout=0
        A   <= "0011";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=3, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=3, Cin=0)" severity error;

        -- Case 104: A=0011 B=0011 Cin=1 -> S=0111 Cout=0
        A   <= "0011";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=3, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=3, Cin=1)" severity error;

        -- Case 105: A=0011 B=0100 Cin=0 -> S=0111 Cout=0
        A   <= "0011";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=3, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=4, Cin=0)" severity error;

        -- Case 106: A=0011 B=0100 Cin=1 -> S=1000 Cout=0
        A   <= "0011";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=3, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=4, Cin=1)" severity error;

        -- Case 107: A=0011 B=0101 Cin=0 -> S=1000 Cout=0
        A   <= "0011";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=3, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=5, Cin=0)" severity error;

        -- Case 108: A=0011 B=0101 Cin=1 -> S=1001 Cout=0
        A   <= "0011";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=3, B=5, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=5, Cin=1)" severity error;

        -- Case 109: A=0011 B=0110 Cin=0 -> S=1001 Cout=0
        A   <= "0011";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=3, B=6, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=6, Cin=0)" severity error;

        -- Case 110: A=0011 B=0110 Cin=1 -> S=1010 Cout=0
        A   <= "0011";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=3, B=6, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=6, Cin=1)" severity error;

        -- Case 111: A=0011 B=0111 Cin=0 -> S=1010 Cout=0
        A   <= "0011";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=3, B=7, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=7, Cin=0)" severity error;

        -- Case 112: A=0011 B=0111 Cin=1 -> S=1011 Cout=0
        A   <= "0011";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=3, B=7, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=7, Cin=1)" severity error;

        -- Case 113: A=0011 B=1000 Cin=0 -> S=1011 Cout=0
        A   <= "0011";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=3, B=8, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=8, Cin=0)" severity error;

        -- Case 114: A=0011 B=1000 Cin=1 -> S=1100 Cout=0
        A   <= "0011";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=3, B=8, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=8, Cin=1)" severity error;

        -- Case 115: A=0011 B=1001 Cin=0 -> S=1100 Cout=0
        A   <= "0011";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=3, B=9, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=9, Cin=0)" severity error;

        -- Case 116: A=0011 B=1001 Cin=1 -> S=1101 Cout=0
        A   <= "0011";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=3, B=9, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=9, Cin=1)" severity error;

        -- Case 117: A=0011 B=1010 Cin=0 -> S=1101 Cout=0
        A   <= "0011";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=3, B=10, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=10, Cin=0)" severity error;

        -- Case 118: A=0011 B=1010 Cin=1 -> S=1110 Cout=0
        A   <= "0011";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=3, B=10, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=10, Cin=1)" severity error;

        -- Case 119: A=0011 B=1011 Cin=0 -> S=1110 Cout=0
        A   <= "0011";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=3, B=11, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=11, Cin=0)" severity error;

        -- Case 120: A=0011 B=1011 Cin=1 -> S=1111 Cout=0
        A   <= "0011";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=3, B=11, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=11, Cin=1)" severity error;

        -- Case 121: A=0011 B=1100 Cin=0 -> S=1111 Cout=0
        A   <= "0011";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=3, B=12, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=3, B=12, Cin=0)" severity error;

        -- Case 122: A=0011 B=1100 Cin=1 -> S=0000 Cout=1
        A   <= "0011";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=3, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=3, B=12, Cin=1)" severity error;

        -- Case 123: A=0011 B=1101 Cin=0 -> S=0000 Cout=1
        A   <= "0011";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=3, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=3, B=13, Cin=0)" severity error;

        -- Case 124: A=0011 B=1101 Cin=1 -> S=0001 Cout=1
        A   <= "0011";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=3, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=3, B=13, Cin=1)" severity error;

        -- Case 125: A=0011 B=1110 Cin=0 -> S=0001 Cout=1
        A   <= "0011";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=3, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=3, B=14, Cin=0)" severity error;

        -- Case 126: A=0011 B=1110 Cin=1 -> S=0010 Cout=1
        A   <= "0011";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=3, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=3, B=14, Cin=1)" severity error;

        -- Case 127: A=0011 B=1111 Cin=0 -> S=0010 Cout=1
        A   <= "0011";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=3, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=3, B=15, Cin=0)" severity error;

        -- Case 128: A=0011 B=1111 Cin=1 -> S=0011 Cout=1
        A   <= "0011";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=3, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=3, B=15, Cin=1)" severity error;

        -- Case 129: A=0100 B=0000 Cin=0 -> S=0100 Cout=0
        A   <= "0100";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=4, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=0, Cin=0)" severity error;

        -- Case 130: A=0100 B=0000 Cin=1 -> S=0101 Cout=0
        A   <= "0100";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=4, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=0, Cin=1)" severity error;

        -- Case 131: A=0100 B=0001 Cin=0 -> S=0101 Cout=0
        A   <= "0100";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=4, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=1, Cin=0)" severity error;

        -- Case 132: A=0100 B=0001 Cin=1 -> S=0110 Cout=0
        A   <= "0100";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=4, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=1, Cin=1)" severity error;

        -- Case 133: A=0100 B=0010 Cin=0 -> S=0110 Cout=0
        A   <= "0100";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=4, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=2, Cin=0)" severity error;

        -- Case 134: A=0100 B=0010 Cin=1 -> S=0111 Cout=0
        A   <= "0100";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=4, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=2, Cin=1)" severity error;

        -- Case 135: A=0100 B=0011 Cin=0 -> S=0111 Cout=0
        A   <= "0100";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=4, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=3, Cin=0)" severity error;

        -- Case 136: A=0100 B=0011 Cin=1 -> S=1000 Cout=0
        A   <= "0100";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=4, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=3, Cin=1)" severity error;

        -- Case 137: A=0100 B=0100 Cin=0 -> S=1000 Cout=0
        A   <= "0100";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=4, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=4, Cin=0)" severity error;

        -- Case 138: A=0100 B=0100 Cin=1 -> S=1001 Cout=0
        A   <= "0100";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=4, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=4, Cin=1)" severity error;

        -- Case 139: A=0100 B=0101 Cin=0 -> S=1001 Cout=0
        A   <= "0100";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=4, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=5, Cin=0)" severity error;

        -- Case 140: A=0100 B=0101 Cin=1 -> S=1010 Cout=0
        A   <= "0100";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=4, B=5, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=5, Cin=1)" severity error;

        -- Case 141: A=0100 B=0110 Cin=0 -> S=1010 Cout=0
        A   <= "0100";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=4, B=6, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=6, Cin=0)" severity error;

        -- Case 142: A=0100 B=0110 Cin=1 -> S=1011 Cout=0
        A   <= "0100";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=4, B=6, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=6, Cin=1)" severity error;

        -- Case 143: A=0100 B=0111 Cin=0 -> S=1011 Cout=0
        A   <= "0100";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=4, B=7, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=7, Cin=0)" severity error;

        -- Case 144: A=0100 B=0111 Cin=1 -> S=1100 Cout=0
        A   <= "0100";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=4, B=7, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=7, Cin=1)" severity error;

        -- Case 145: A=0100 B=1000 Cin=0 -> S=1100 Cout=0
        A   <= "0100";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=4, B=8, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=8, Cin=0)" severity error;

        -- Case 146: A=0100 B=1000 Cin=1 -> S=1101 Cout=0
        A   <= "0100";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=4, B=8, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=8, Cin=1)" severity error;

        -- Case 147: A=0100 B=1001 Cin=0 -> S=1101 Cout=0
        A   <= "0100";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=4, B=9, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=9, Cin=0)" severity error;

        -- Case 148: A=0100 B=1001 Cin=1 -> S=1110 Cout=0
        A   <= "0100";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=4, B=9, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=9, Cin=1)" severity error;

        -- Case 149: A=0100 B=1010 Cin=0 -> S=1110 Cout=0
        A   <= "0100";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=4, B=10, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=10, Cin=0)" severity error;

        -- Case 150: A=0100 B=1010 Cin=1 -> S=1111 Cout=0
        A   <= "0100";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=4, B=10, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=10, Cin=1)" severity error;

        -- Case 151: A=0100 B=1011 Cin=0 -> S=1111 Cout=0
        A   <= "0100";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=4, B=11, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=4, B=11, Cin=0)" severity error;

        -- Case 152: A=0100 B=1011 Cin=1 -> S=0000 Cout=1
        A   <= "0100";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=4, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=4, B=11, Cin=1)" severity error;

        -- Case 153: A=0100 B=1100 Cin=0 -> S=0000 Cout=1
        A   <= "0100";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=4, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=4, B=12, Cin=0)" severity error;

        -- Case 154: A=0100 B=1100 Cin=1 -> S=0001 Cout=1
        A   <= "0100";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=4, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=4, B=12, Cin=1)" severity error;

        -- Case 155: A=0100 B=1101 Cin=0 -> S=0001 Cout=1
        A   <= "0100";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=4, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=4, B=13, Cin=0)" severity error;

        -- Case 156: A=0100 B=1101 Cin=1 -> S=0010 Cout=1
        A   <= "0100";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=4, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=4, B=13, Cin=1)" severity error;

        -- Case 157: A=0100 B=1110 Cin=0 -> S=0010 Cout=1
        A   <= "0100";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=4, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=4, B=14, Cin=0)" severity error;

        -- Case 158: A=0100 B=1110 Cin=1 -> S=0011 Cout=1
        A   <= "0100";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=4, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=4, B=14, Cin=1)" severity error;

        -- Case 159: A=0100 B=1111 Cin=0 -> S=0011 Cout=1
        A   <= "0100";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=4, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=4, B=15, Cin=0)" severity error;

        -- Case 160: A=0100 B=1111 Cin=1 -> S=0100 Cout=1
        A   <= "0100";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=4, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=4, B=15, Cin=1)" severity error;

        -- Case 161: A=0101 B=0000 Cin=0 -> S=0101 Cout=0
        A   <= "0101";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=5, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=0, Cin=0)" severity error;

        -- Case 162: A=0101 B=0000 Cin=1 -> S=0110 Cout=0
        A   <= "0101";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=5, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=0, Cin=1)" severity error;

        -- Case 163: A=0101 B=0001 Cin=0 -> S=0110 Cout=0
        A   <= "0101";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=5, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=1, Cin=0)" severity error;

        -- Case 164: A=0101 B=0001 Cin=1 -> S=0111 Cout=0
        A   <= "0101";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=5, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=1, Cin=1)" severity error;

        -- Case 165: A=0101 B=0010 Cin=0 -> S=0111 Cout=0
        A   <= "0101";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=5, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=2, Cin=0)" severity error;

        -- Case 166: A=0101 B=0010 Cin=1 -> S=1000 Cout=0
        A   <= "0101";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=5, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=2, Cin=1)" severity error;

        -- Case 167: A=0101 B=0011 Cin=0 -> S=1000 Cout=0
        A   <= "0101";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=5, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=3, Cin=0)" severity error;

        -- Case 168: A=0101 B=0011 Cin=1 -> S=1001 Cout=0
        A   <= "0101";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=5, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=3, Cin=1)" severity error;

        -- Case 169: A=0101 B=0100 Cin=0 -> S=1001 Cout=0
        A   <= "0101";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=5, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=4, Cin=0)" severity error;

        -- Case 170: A=0101 B=0100 Cin=1 -> S=1010 Cout=0
        A   <= "0101";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=5, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=4, Cin=1)" severity error;

        -- Case 171: A=0101 B=0101 Cin=0 -> S=1010 Cout=0
        A   <= "0101";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=5, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=5, Cin=0)" severity error;

        -- Case 172: A=0101 B=0101 Cin=1 -> S=1011 Cout=0
        A   <= "0101";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=5, B=5, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=5, Cin=1)" severity error;

        -- Case 173: A=0101 B=0110 Cin=0 -> S=1011 Cout=0
        A   <= "0101";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=5, B=6, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=6, Cin=0)" severity error;

        -- Case 174: A=0101 B=0110 Cin=1 -> S=1100 Cout=0
        A   <= "0101";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=5, B=6, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=6, Cin=1)" severity error;

        -- Case 175: A=0101 B=0111 Cin=0 -> S=1100 Cout=0
        A   <= "0101";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=5, B=7, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=7, Cin=0)" severity error;

        -- Case 176: A=0101 B=0111 Cin=1 -> S=1101 Cout=0
        A   <= "0101";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=5, B=7, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=7, Cin=1)" severity error;

        -- Case 177: A=0101 B=1000 Cin=0 -> S=1101 Cout=0
        A   <= "0101";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=5, B=8, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=8, Cin=0)" severity error;

        -- Case 178: A=0101 B=1000 Cin=1 -> S=1110 Cout=0
        A   <= "0101";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=5, B=8, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=8, Cin=1)" severity error;

        -- Case 179: A=0101 B=1001 Cin=0 -> S=1110 Cout=0
        A   <= "0101";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=5, B=9, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=9, Cin=0)" severity error;

        -- Case 180: A=0101 B=1001 Cin=1 -> S=1111 Cout=0
        A   <= "0101";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=5, B=9, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=9, Cin=1)" severity error;

        -- Case 181: A=0101 B=1010 Cin=0 -> S=1111 Cout=0
        A   <= "0101";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=5, B=10, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=5, B=10, Cin=0)" severity error;

        -- Case 182: A=0101 B=1010 Cin=1 -> S=0000 Cout=1
        A   <= "0101";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=5, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=10, Cin=1)" severity error;

        -- Case 183: A=0101 B=1011 Cin=0 -> S=0000 Cout=1
        A   <= "0101";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=5, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=11, Cin=0)" severity error;

        -- Case 184: A=0101 B=1011 Cin=1 -> S=0001 Cout=1
        A   <= "0101";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=5, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=11, Cin=1)" severity error;

        -- Case 185: A=0101 B=1100 Cin=0 -> S=0001 Cout=1
        A   <= "0101";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=5, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=12, Cin=0)" severity error;

        -- Case 186: A=0101 B=1100 Cin=1 -> S=0010 Cout=1
        A   <= "0101";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=5, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=12, Cin=1)" severity error;

        -- Case 187: A=0101 B=1101 Cin=0 -> S=0010 Cout=1
        A   <= "0101";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=5, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=13, Cin=0)" severity error;

        -- Case 188: A=0101 B=1101 Cin=1 -> S=0011 Cout=1
        A   <= "0101";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=5, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=13, Cin=1)" severity error;

        -- Case 189: A=0101 B=1110 Cin=0 -> S=0011 Cout=1
        A   <= "0101";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=5, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=14, Cin=0)" severity error;

        -- Case 190: A=0101 B=1110 Cin=1 -> S=0100 Cout=1
        A   <= "0101";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=5, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=14, Cin=1)" severity error;

        -- Case 191: A=0101 B=1111 Cin=0 -> S=0100 Cout=1
        A   <= "0101";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=5, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=15, Cin=0)" severity error;

        -- Case 192: A=0101 B=1111 Cin=1 -> S=0101 Cout=1
        A   <= "0101";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=5, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=5, B=15, Cin=1)" severity error;

        -- Case 193: A=0110 B=0000 Cin=0 -> S=0110 Cout=0
        A   <= "0110";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=6, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=0, Cin=0)" severity error;

        -- Case 194: A=0110 B=0000 Cin=1 -> S=0111 Cout=0
        A   <= "0110";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=6, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=0, Cin=1)" severity error;

        -- Case 195: A=0110 B=0001 Cin=0 -> S=0111 Cout=0
        A   <= "0110";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=6, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=1, Cin=0)" severity error;

        -- Case 196: A=0110 B=0001 Cin=1 -> S=1000 Cout=0
        A   <= "0110";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=6, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=1, Cin=1)" severity error;

        -- Case 197: A=0110 B=0010 Cin=0 -> S=1000 Cout=0
        A   <= "0110";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=6, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=2, Cin=0)" severity error;

        -- Case 198: A=0110 B=0010 Cin=1 -> S=1001 Cout=0
        A   <= "0110";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=6, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=2, Cin=1)" severity error;

        -- Case 199: A=0110 B=0011 Cin=0 -> S=1001 Cout=0
        A   <= "0110";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=6, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=3, Cin=0)" severity error;

        -- Case 200: A=0110 B=0011 Cin=1 -> S=1010 Cout=0
        A   <= "0110";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=6, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=3, Cin=1)" severity error;

        -- Case 201: A=0110 B=0100 Cin=0 -> S=1010 Cout=0
        A   <= "0110";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=6, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=4, Cin=0)" severity error;

        -- Case 202: A=0110 B=0100 Cin=1 -> S=1011 Cout=0
        A   <= "0110";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=6, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=4, Cin=1)" severity error;

        -- Case 203: A=0110 B=0101 Cin=0 -> S=1011 Cout=0
        A   <= "0110";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=6, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=5, Cin=0)" severity error;

        -- Case 204: A=0110 B=0101 Cin=1 -> S=1100 Cout=0
        A   <= "0110";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=6, B=5, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=5, Cin=1)" severity error;

        -- Case 205: A=0110 B=0110 Cin=0 -> S=1100 Cout=0
        A   <= "0110";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=6, B=6, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=6, Cin=0)" severity error;

        -- Case 206: A=0110 B=0110 Cin=1 -> S=1101 Cout=0
        A   <= "0110";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=6, B=6, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=6, Cin=1)" severity error;

        -- Case 207: A=0110 B=0111 Cin=0 -> S=1101 Cout=0
        A   <= "0110";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=6, B=7, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=7, Cin=0)" severity error;

        -- Case 208: A=0110 B=0111 Cin=1 -> S=1110 Cout=0
        A   <= "0110";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=6, B=7, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=7, Cin=1)" severity error;

        -- Case 209: A=0110 B=1000 Cin=0 -> S=1110 Cout=0
        A   <= "0110";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=6, B=8, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=8, Cin=0)" severity error;

        -- Case 210: A=0110 B=1000 Cin=1 -> S=1111 Cout=0
        A   <= "0110";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=6, B=8, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=8, Cin=1)" severity error;

        -- Case 211: A=0110 B=1001 Cin=0 -> S=1111 Cout=0
        A   <= "0110";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=6, B=9, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=6, B=9, Cin=0)" severity error;

        -- Case 212: A=0110 B=1001 Cin=1 -> S=0000 Cout=1
        A   <= "0110";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=6, B=9, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=9, Cin=1)" severity error;

        -- Case 213: A=0110 B=1010 Cin=0 -> S=0000 Cout=1
        A   <= "0110";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=6, B=10, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=10, Cin=0)" severity error;

        -- Case 214: A=0110 B=1010 Cin=1 -> S=0001 Cout=1
        A   <= "0110";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=6, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=10, Cin=1)" severity error;

        -- Case 215: A=0110 B=1011 Cin=0 -> S=0001 Cout=1
        A   <= "0110";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=6, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=11, Cin=0)" severity error;

        -- Case 216: A=0110 B=1011 Cin=1 -> S=0010 Cout=1
        A   <= "0110";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=6, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=11, Cin=1)" severity error;

        -- Case 217: A=0110 B=1100 Cin=0 -> S=0010 Cout=1
        A   <= "0110";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=6, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=12, Cin=0)" severity error;

        -- Case 218: A=0110 B=1100 Cin=1 -> S=0011 Cout=1
        A   <= "0110";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=6, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=12, Cin=1)" severity error;

        -- Case 219: A=0110 B=1101 Cin=0 -> S=0011 Cout=1
        A   <= "0110";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=6, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=13, Cin=0)" severity error;

        -- Case 220: A=0110 B=1101 Cin=1 -> S=0100 Cout=1
        A   <= "0110";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=6, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=13, Cin=1)" severity error;

        -- Case 221: A=0110 B=1110 Cin=0 -> S=0100 Cout=1
        A   <= "0110";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=6, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=14, Cin=0)" severity error;

        -- Case 222: A=0110 B=1110 Cin=1 -> S=0101 Cout=1
        A   <= "0110";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=6, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=14, Cin=1)" severity error;

        -- Case 223: A=0110 B=1111 Cin=0 -> S=0101 Cout=1
        A   <= "0110";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=6, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=15, Cin=0)" severity error;

        -- Case 224: A=0110 B=1111 Cin=1 -> S=0110 Cout=1
        A   <= "0110";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=6, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=6, B=15, Cin=1)" severity error;

        -- Case 225: A=0111 B=0000 Cin=0 -> S=0111 Cout=0
        A   <= "0111";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=7, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=0, Cin=0)" severity error;

        -- Case 226: A=0111 B=0000 Cin=1 -> S=1000 Cout=0
        A   <= "0111";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=7, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=0, Cin=1)" severity error;

        -- Case 227: A=0111 B=0001 Cin=0 -> S=1000 Cout=0
        A   <= "0111";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=7, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=1, Cin=0)" severity error;

        -- Case 228: A=0111 B=0001 Cin=1 -> S=1001 Cout=0
        A   <= "0111";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=7, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=1, Cin=1)" severity error;

        -- Case 229: A=0111 B=0010 Cin=0 -> S=1001 Cout=0
        A   <= "0111";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=7, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=2, Cin=0)" severity error;

        -- Case 230: A=0111 B=0010 Cin=1 -> S=1010 Cout=0
        A   <= "0111";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=7, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=2, Cin=1)" severity error;

        -- Case 231: A=0111 B=0011 Cin=0 -> S=1010 Cout=0
        A   <= "0111";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=7, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=3, Cin=0)" severity error;

        -- Case 232: A=0111 B=0011 Cin=1 -> S=1011 Cout=0
        A   <= "0111";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=7, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=3, Cin=1)" severity error;

        -- Case 233: A=0111 B=0100 Cin=0 -> S=1011 Cout=0
        A   <= "0111";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=7, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=4, Cin=0)" severity error;

        -- Case 234: A=0111 B=0100 Cin=1 -> S=1100 Cout=0
        A   <= "0111";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=7, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=4, Cin=1)" severity error;

        -- Case 235: A=0111 B=0101 Cin=0 -> S=1100 Cout=0
        A   <= "0111";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=7, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=5, Cin=0)" severity error;

        -- Case 236: A=0111 B=0101 Cin=1 -> S=1101 Cout=0
        A   <= "0111";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=7, B=5, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=5, Cin=1)" severity error;

        -- Case 237: A=0111 B=0110 Cin=0 -> S=1101 Cout=0
        A   <= "0111";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=7, B=6, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=6, Cin=0)" severity error;

        -- Case 238: A=0111 B=0110 Cin=1 -> S=1110 Cout=0
        A   <= "0111";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=7, B=6, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=6, Cin=1)" severity error;

        -- Case 239: A=0111 B=0111 Cin=0 -> S=1110 Cout=0
        A   <= "0111";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=7, B=7, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=7, Cin=0)" severity error;

        -- Case 240: A=0111 B=0111 Cin=1 -> S=1111 Cout=0
        A   <= "0111";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=7, B=7, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=7, Cin=1)" severity error;

        -- Case 241: A=0111 B=1000 Cin=0 -> S=1111 Cout=0
        A   <= "0111";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=7, B=8, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=7, B=8, Cin=0)" severity error;

        -- Case 242: A=0111 B=1000 Cin=1 -> S=0000 Cout=1
        A   <= "0111";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=7, B=8, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=8, Cin=1)" severity error;

        -- Case 243: A=0111 B=1001 Cin=0 -> S=0000 Cout=1
        A   <= "0111";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=7, B=9, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=9, Cin=0)" severity error;

        -- Case 244: A=0111 B=1001 Cin=1 -> S=0001 Cout=1
        A   <= "0111";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=7, B=9, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=9, Cin=1)" severity error;

        -- Case 245: A=0111 B=1010 Cin=0 -> S=0001 Cout=1
        A   <= "0111";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=7, B=10, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=10, Cin=0)" severity error;

        -- Case 246: A=0111 B=1010 Cin=1 -> S=0010 Cout=1
        A   <= "0111";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=7, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=10, Cin=1)" severity error;

        -- Case 247: A=0111 B=1011 Cin=0 -> S=0010 Cout=1
        A   <= "0111";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=7, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=11, Cin=0)" severity error;

        -- Case 248: A=0111 B=1011 Cin=1 -> S=0011 Cout=1
        A   <= "0111";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=7, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=11, Cin=1)" severity error;

        -- Case 249: A=0111 B=1100 Cin=0 -> S=0011 Cout=1
        A   <= "0111";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=7, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=12, Cin=0)" severity error;

        -- Case 250: A=0111 B=1100 Cin=1 -> S=0100 Cout=1
        A   <= "0111";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=7, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=12, Cin=1)" severity error;

        -- Case 251: A=0111 B=1101 Cin=0 -> S=0100 Cout=1
        A   <= "0111";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=7, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=13, Cin=0)" severity error;

        -- Case 252: A=0111 B=1101 Cin=1 -> S=0101 Cout=1
        A   <= "0111";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=7, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=13, Cin=1)" severity error;

        -- Case 253: A=0111 B=1110 Cin=0 -> S=0101 Cout=1
        A   <= "0111";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=7, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=14, Cin=0)" severity error;

        -- Case 254: A=0111 B=1110 Cin=1 -> S=0110 Cout=1
        A   <= "0111";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=7, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=14, Cin=1)" severity error;

        -- Case 255: A=0111 B=1111 Cin=0 -> S=0110 Cout=1
        A   <= "0111";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=7, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=15, Cin=0)" severity error;

        -- Case 256: A=0111 B=1111 Cin=1 -> S=0111 Cout=1
        A   <= "0111";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=7, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=7, B=15, Cin=1)" severity error;

        -- Case 257: A=1000 B=0000 Cin=0 -> S=1000 Cout=0
        A   <= "1000";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=8, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=0, Cin=0)" severity error;

        -- Case 258: A=1000 B=0000 Cin=1 -> S=1001 Cout=0
        A   <= "1000";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=8, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=0, Cin=1)" severity error;

        -- Case 259: A=1000 B=0001 Cin=0 -> S=1001 Cout=0
        A   <= "1000";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=8, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=1, Cin=0)" severity error;

        -- Case 260: A=1000 B=0001 Cin=1 -> S=1010 Cout=0
        A   <= "1000";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=8, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=1, Cin=1)" severity error;

        -- Case 261: A=1000 B=0010 Cin=0 -> S=1010 Cout=0
        A   <= "1000";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=8, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=2, Cin=0)" severity error;

        -- Case 262: A=1000 B=0010 Cin=1 -> S=1011 Cout=0
        A   <= "1000";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=8, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=2, Cin=1)" severity error;

        -- Case 263: A=1000 B=0011 Cin=0 -> S=1011 Cout=0
        A   <= "1000";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=8, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=3, Cin=0)" severity error;

        -- Case 264: A=1000 B=0011 Cin=1 -> S=1100 Cout=0
        A   <= "1000";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=8, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=3, Cin=1)" severity error;

        -- Case 265: A=1000 B=0100 Cin=0 -> S=1100 Cout=0
        A   <= "1000";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=8, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=4, Cin=0)" severity error;

        -- Case 266: A=1000 B=0100 Cin=1 -> S=1101 Cout=0
        A   <= "1000";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=8, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=4, Cin=1)" severity error;

        -- Case 267: A=1000 B=0101 Cin=0 -> S=1101 Cout=0
        A   <= "1000";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=8, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=5, Cin=0)" severity error;

        -- Case 268: A=1000 B=0101 Cin=1 -> S=1110 Cout=0
        A   <= "1000";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=8, B=5, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=5, Cin=1)" severity error;

        -- Case 269: A=1000 B=0110 Cin=0 -> S=1110 Cout=0
        A   <= "1000";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=8, B=6, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=6, Cin=0)" severity error;

        -- Case 270: A=1000 B=0110 Cin=1 -> S=1111 Cout=0
        A   <= "1000";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=8, B=6, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=6, Cin=1)" severity error;

        -- Case 271: A=1000 B=0111 Cin=0 -> S=1111 Cout=0
        A   <= "1000";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=8, B=7, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=8, B=7, Cin=0)" severity error;

        -- Case 272: A=1000 B=0111 Cin=1 -> S=0000 Cout=1
        A   <= "1000";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=8, B=7, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=7, Cin=1)" severity error;

        -- Case 273: A=1000 B=1000 Cin=0 -> S=0000 Cout=1
        A   <= "1000";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=8, B=8, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=8, Cin=0)" severity error;

        -- Case 274: A=1000 B=1000 Cin=1 -> S=0001 Cout=1
        A   <= "1000";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=8, B=8, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=8, Cin=1)" severity error;

        -- Case 275: A=1000 B=1001 Cin=0 -> S=0001 Cout=1
        A   <= "1000";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=8, B=9, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=9, Cin=0)" severity error;

        -- Case 276: A=1000 B=1001 Cin=1 -> S=0010 Cout=1
        A   <= "1000";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=8, B=9, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=9, Cin=1)" severity error;

        -- Case 277: A=1000 B=1010 Cin=0 -> S=0010 Cout=1
        A   <= "1000";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=8, B=10, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=10, Cin=0)" severity error;

        -- Case 278: A=1000 B=1010 Cin=1 -> S=0011 Cout=1
        A   <= "1000";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=8, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=10, Cin=1)" severity error;

        -- Case 279: A=1000 B=1011 Cin=0 -> S=0011 Cout=1
        A   <= "1000";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=8, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=11, Cin=0)" severity error;

        -- Case 280: A=1000 B=1011 Cin=1 -> S=0100 Cout=1
        A   <= "1000";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=8, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=11, Cin=1)" severity error;

        -- Case 281: A=1000 B=1100 Cin=0 -> S=0100 Cout=1
        A   <= "1000";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=8, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=12, Cin=0)" severity error;

        -- Case 282: A=1000 B=1100 Cin=1 -> S=0101 Cout=1
        A   <= "1000";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=8, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=12, Cin=1)" severity error;

        -- Case 283: A=1000 B=1101 Cin=0 -> S=0101 Cout=1
        A   <= "1000";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=8, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=13, Cin=0)" severity error;

        -- Case 284: A=1000 B=1101 Cin=1 -> S=0110 Cout=1
        A   <= "1000";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=8, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=13, Cin=1)" severity error;

        -- Case 285: A=1000 B=1110 Cin=0 -> S=0110 Cout=1
        A   <= "1000";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=8, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=14, Cin=0)" severity error;

        -- Case 286: A=1000 B=1110 Cin=1 -> S=0111 Cout=1
        A   <= "1000";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=8, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=14, Cin=1)" severity error;

        -- Case 287: A=1000 B=1111 Cin=0 -> S=0111 Cout=1
        A   <= "1000";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=8, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=15, Cin=0)" severity error;

        -- Case 288: A=1000 B=1111 Cin=1 -> S=1000 Cout=1
        A   <= "1000";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=8, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=8, B=15, Cin=1)" severity error;

        -- Case 289: A=1001 B=0000 Cin=0 -> S=1001 Cout=0
        A   <= "1001";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=9, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=0, Cin=0)" severity error;

        -- Case 290: A=1001 B=0000 Cin=1 -> S=1010 Cout=0
        A   <= "1001";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=9, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=0, Cin=1)" severity error;

        -- Case 291: A=1001 B=0001 Cin=0 -> S=1010 Cout=0
        A   <= "1001";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=9, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=1, Cin=0)" severity error;

        -- Case 292: A=1001 B=0001 Cin=1 -> S=1011 Cout=0
        A   <= "1001";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=9, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=1, Cin=1)" severity error;

        -- Case 293: A=1001 B=0010 Cin=0 -> S=1011 Cout=0
        A   <= "1001";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=9, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=2, Cin=0)" severity error;

        -- Case 294: A=1001 B=0010 Cin=1 -> S=1100 Cout=0
        A   <= "1001";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=9, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=2, Cin=1)" severity error;

        -- Case 295: A=1001 B=0011 Cin=0 -> S=1100 Cout=0
        A   <= "1001";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=9, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=3, Cin=0)" severity error;

        -- Case 296: A=1001 B=0011 Cin=1 -> S=1101 Cout=0
        A   <= "1001";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=9, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=3, Cin=1)" severity error;

        -- Case 297: A=1001 B=0100 Cin=0 -> S=1101 Cout=0
        A   <= "1001";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=9, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=4, Cin=0)" severity error;

        -- Case 298: A=1001 B=0100 Cin=1 -> S=1110 Cout=0
        A   <= "1001";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=9, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=4, Cin=1)" severity error;

        -- Case 299: A=1001 B=0101 Cin=0 -> S=1110 Cout=0
        A   <= "1001";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=9, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=5, Cin=0)" severity error;

        -- Case 300: A=1001 B=0101 Cin=1 -> S=1111 Cout=0
        A   <= "1001";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=9, B=5, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=5, Cin=1)" severity error;

        -- Case 301: A=1001 B=0110 Cin=0 -> S=1111 Cout=0
        A   <= "1001";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=9, B=6, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=9, B=6, Cin=0)" severity error;

        -- Case 302: A=1001 B=0110 Cin=1 -> S=0000 Cout=1
        A   <= "1001";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=9, B=6, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=6, Cin=1)" severity error;

        -- Case 303: A=1001 B=0111 Cin=0 -> S=0000 Cout=1
        A   <= "1001";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=9, B=7, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=7, Cin=0)" severity error;

        -- Case 304: A=1001 B=0111 Cin=1 -> S=0001 Cout=1
        A   <= "1001";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=9, B=7, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=7, Cin=1)" severity error;

        -- Case 305: A=1001 B=1000 Cin=0 -> S=0001 Cout=1
        A   <= "1001";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=9, B=8, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=8, Cin=0)" severity error;

        -- Case 306: A=1001 B=1000 Cin=1 -> S=0010 Cout=1
        A   <= "1001";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=9, B=8, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=8, Cin=1)" severity error;

        -- Case 307: A=1001 B=1001 Cin=0 -> S=0010 Cout=1
        A   <= "1001";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=9, B=9, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=9, Cin=0)" severity error;

        -- Case 308: A=1001 B=1001 Cin=1 -> S=0011 Cout=1
        A   <= "1001";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=9, B=9, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=9, Cin=1)" severity error;

        -- Case 309: A=1001 B=1010 Cin=0 -> S=0011 Cout=1
        A   <= "1001";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=9, B=10, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=10, Cin=0)" severity error;

        -- Case 310: A=1001 B=1010 Cin=1 -> S=0100 Cout=1
        A   <= "1001";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=9, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=10, Cin=1)" severity error;

        -- Case 311: A=1001 B=1011 Cin=0 -> S=0100 Cout=1
        A   <= "1001";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=9, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=11, Cin=0)" severity error;

        -- Case 312: A=1001 B=1011 Cin=1 -> S=0101 Cout=1
        A   <= "1001";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=9, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=11, Cin=1)" severity error;

        -- Case 313: A=1001 B=1100 Cin=0 -> S=0101 Cout=1
        A   <= "1001";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=9, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=12, Cin=0)" severity error;

        -- Case 314: A=1001 B=1100 Cin=1 -> S=0110 Cout=1
        A   <= "1001";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=9, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=12, Cin=1)" severity error;

        -- Case 315: A=1001 B=1101 Cin=0 -> S=0110 Cout=1
        A   <= "1001";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=9, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=13, Cin=0)" severity error;

        -- Case 316: A=1001 B=1101 Cin=1 -> S=0111 Cout=1
        A   <= "1001";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=9, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=13, Cin=1)" severity error;

        -- Case 317: A=1001 B=1110 Cin=0 -> S=0111 Cout=1
        A   <= "1001";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=9, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=14, Cin=0)" severity error;

        -- Case 318: A=1001 B=1110 Cin=1 -> S=1000 Cout=1
        A   <= "1001";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=9, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=14, Cin=1)" severity error;

        -- Case 319: A=1001 B=1111 Cin=0 -> S=1000 Cout=1
        A   <= "1001";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=9, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=15, Cin=0)" severity error;

        -- Case 320: A=1001 B=1111 Cin=1 -> S=1001 Cout=1
        A   <= "1001";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=9, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=9, B=15, Cin=1)" severity error;

        -- Case 321: A=1010 B=0000 Cin=0 -> S=1010 Cout=0
        A   <= "1010";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=10, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=0, Cin=0)" severity error;

        -- Case 322: A=1010 B=0000 Cin=1 -> S=1011 Cout=0
        A   <= "1010";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=10, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=0, Cin=1)" severity error;

        -- Case 323: A=1010 B=0001 Cin=0 -> S=1011 Cout=0
        A   <= "1010";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=10, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=1, Cin=0)" severity error;

        -- Case 324: A=1010 B=0001 Cin=1 -> S=1100 Cout=0
        A   <= "1010";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=10, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=1, Cin=1)" severity error;

        -- Case 325: A=1010 B=0010 Cin=0 -> S=1100 Cout=0
        A   <= "1010";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=10, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=2, Cin=0)" severity error;

        -- Case 326: A=1010 B=0010 Cin=1 -> S=1101 Cout=0
        A   <= "1010";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=10, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=2, Cin=1)" severity error;

        -- Case 327: A=1010 B=0011 Cin=0 -> S=1101 Cout=0
        A   <= "1010";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=10, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=3, Cin=0)" severity error;

        -- Case 328: A=1010 B=0011 Cin=1 -> S=1110 Cout=0
        A   <= "1010";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=10, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=3, Cin=1)" severity error;

        -- Case 329: A=1010 B=0100 Cin=0 -> S=1110 Cout=0
        A   <= "1010";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=10, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=4, Cin=0)" severity error;

        -- Case 330: A=1010 B=0100 Cin=1 -> S=1111 Cout=0
        A   <= "1010";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=10, B=4, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=4, Cin=1)" severity error;

        -- Case 331: A=1010 B=0101 Cin=0 -> S=1111 Cout=0
        A   <= "1010";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=10, B=5, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=10, B=5, Cin=0)" severity error;

        -- Case 332: A=1010 B=0101 Cin=1 -> S=0000 Cout=1
        A   <= "1010";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=10, B=5, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=5, Cin=1)" severity error;

        -- Case 333: A=1010 B=0110 Cin=0 -> S=0000 Cout=1
        A   <= "1010";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=10, B=6, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=6, Cin=0)" severity error;

        -- Case 334: A=1010 B=0110 Cin=1 -> S=0001 Cout=1
        A   <= "1010";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=10, B=6, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=6, Cin=1)" severity error;

        -- Case 335: A=1010 B=0111 Cin=0 -> S=0001 Cout=1
        A   <= "1010";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=10, B=7, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=7, Cin=0)" severity error;

        -- Case 336: A=1010 B=0111 Cin=1 -> S=0010 Cout=1
        A   <= "1010";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=10, B=7, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=7, Cin=1)" severity error;

        -- Case 337: A=1010 B=1000 Cin=0 -> S=0010 Cout=1
        A   <= "1010";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=10, B=8, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=8, Cin=0)" severity error;

        -- Case 338: A=1010 B=1000 Cin=1 -> S=0011 Cout=1
        A   <= "1010";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=10, B=8, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=8, Cin=1)" severity error;

        -- Case 339: A=1010 B=1001 Cin=0 -> S=0011 Cout=1
        A   <= "1010";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=10, B=9, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=9, Cin=0)" severity error;

        -- Case 340: A=1010 B=1001 Cin=1 -> S=0100 Cout=1
        A   <= "1010";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=10, B=9, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=9, Cin=1)" severity error;

        -- Case 341: A=1010 B=1010 Cin=0 -> S=0100 Cout=1
        A   <= "1010";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=10, B=10, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=10, Cin=0)" severity error;

        -- Case 342: A=1010 B=1010 Cin=1 -> S=0101 Cout=1
        A   <= "1010";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=10, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=10, Cin=1)" severity error;

        -- Case 343: A=1010 B=1011 Cin=0 -> S=0101 Cout=1
        A   <= "1010";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=10, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=11, Cin=0)" severity error;

        -- Case 344: A=1010 B=1011 Cin=1 -> S=0110 Cout=1
        A   <= "1010";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=10, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=11, Cin=1)" severity error;

        -- Case 345: A=1010 B=1100 Cin=0 -> S=0110 Cout=1
        A   <= "1010";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=10, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=12, Cin=0)" severity error;

        -- Case 346: A=1010 B=1100 Cin=1 -> S=0111 Cout=1
        A   <= "1010";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=10, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=12, Cin=1)" severity error;

        -- Case 347: A=1010 B=1101 Cin=0 -> S=0111 Cout=1
        A   <= "1010";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=10, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=13, Cin=0)" severity error;

        -- Case 348: A=1010 B=1101 Cin=1 -> S=1000 Cout=1
        A   <= "1010";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=10, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=13, Cin=1)" severity error;

        -- Case 349: A=1010 B=1110 Cin=0 -> S=1000 Cout=1
        A   <= "1010";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=10, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=14, Cin=0)" severity error;

        -- Case 350: A=1010 B=1110 Cin=1 -> S=1001 Cout=1
        A   <= "1010";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=10, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=14, Cin=1)" severity error;

        -- Case 351: A=1010 B=1111 Cin=0 -> S=1001 Cout=1
        A   <= "1010";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=10, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=15, Cin=0)" severity error;

        -- Case 352: A=1010 B=1111 Cin=1 -> S=1010 Cout=1
        A   <= "1010";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=10, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=10, B=15, Cin=1)" severity error;

        -- Case 353: A=1011 B=0000 Cin=0 -> S=1011 Cout=0
        A   <= "1011";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=11, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=11, B=0, Cin=0)" severity error;

        -- Case 354: A=1011 B=0000 Cin=1 -> S=1100 Cout=0
        A   <= "1011";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=11, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=11, B=0, Cin=1)" severity error;

        -- Case 355: A=1011 B=0001 Cin=0 -> S=1100 Cout=0
        A   <= "1011";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=11, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=11, B=1, Cin=0)" severity error;

        -- Case 356: A=1011 B=0001 Cin=1 -> S=1101 Cout=0
        A   <= "1011";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=11, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=11, B=1, Cin=1)" severity error;

        -- Case 357: A=1011 B=0010 Cin=0 -> S=1101 Cout=0
        A   <= "1011";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=11, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=11, B=2, Cin=0)" severity error;

        -- Case 358: A=1011 B=0010 Cin=1 -> S=1110 Cout=0
        A   <= "1011";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=11, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=11, B=2, Cin=1)" severity error;

        -- Case 359: A=1011 B=0011 Cin=0 -> S=1110 Cout=0
        A   <= "1011";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=11, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=11, B=3, Cin=0)" severity error;

        -- Case 360: A=1011 B=0011 Cin=1 -> S=1111 Cout=0
        A   <= "1011";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=11, B=3, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=11, B=3, Cin=1)" severity error;

        -- Case 361: A=1011 B=0100 Cin=0 -> S=1111 Cout=0
        A   <= "1011";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=11, B=4, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=11, B=4, Cin=0)" severity error;

        -- Case 362: A=1011 B=0100 Cin=1 -> S=0000 Cout=1
        A   <= "1011";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=11, B=4, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=4, Cin=1)" severity error;

        -- Case 363: A=1011 B=0101 Cin=0 -> S=0000 Cout=1
        A   <= "1011";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=11, B=5, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=5, Cin=0)" severity error;

        -- Case 364: A=1011 B=0101 Cin=1 -> S=0001 Cout=1
        A   <= "1011";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=11, B=5, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=5, Cin=1)" severity error;

        -- Case 365: A=1011 B=0110 Cin=0 -> S=0001 Cout=1
        A   <= "1011";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=11, B=6, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=6, Cin=0)" severity error;

        -- Case 366: A=1011 B=0110 Cin=1 -> S=0010 Cout=1
        A   <= "1011";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=11, B=6, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=6, Cin=1)" severity error;

        -- Case 367: A=1011 B=0111 Cin=0 -> S=0010 Cout=1
        A   <= "1011";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=11, B=7, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=7, Cin=0)" severity error;

        -- Case 368: A=1011 B=0111 Cin=1 -> S=0011 Cout=1
        A   <= "1011";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=11, B=7, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=7, Cin=1)" severity error;

        -- Case 369: A=1011 B=1000 Cin=0 -> S=0011 Cout=1
        A   <= "1011";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=11, B=8, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=8, Cin=0)" severity error;

        -- Case 370: A=1011 B=1000 Cin=1 -> S=0100 Cout=1
        A   <= "1011";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=11, B=8, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=8, Cin=1)" severity error;

        -- Case 371: A=1011 B=1001 Cin=0 -> S=0100 Cout=1
        A   <= "1011";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=11, B=9, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=9, Cin=0)" severity error;

        -- Case 372: A=1011 B=1001 Cin=1 -> S=0101 Cout=1
        A   <= "1011";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=11, B=9, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=9, Cin=1)" severity error;

        -- Case 373: A=1011 B=1010 Cin=0 -> S=0101 Cout=1
        A   <= "1011";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=11, B=10, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=10, Cin=0)" severity error;

        -- Case 374: A=1011 B=1010 Cin=1 -> S=0110 Cout=1
        A   <= "1011";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=11, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=10, Cin=1)" severity error;

        -- Case 375: A=1011 B=1011 Cin=0 -> S=0110 Cout=1
        A   <= "1011";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=11, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=11, Cin=0)" severity error;

        -- Case 376: A=1011 B=1011 Cin=1 -> S=0111 Cout=1
        A   <= "1011";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=11, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=11, Cin=1)" severity error;

        -- Case 377: A=1011 B=1100 Cin=0 -> S=0111 Cout=1
        A   <= "1011";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=11, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=12, Cin=0)" severity error;

        -- Case 378: A=1011 B=1100 Cin=1 -> S=1000 Cout=1
        A   <= "1011";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=11, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=12, Cin=1)" severity error;

        -- Case 379: A=1011 B=1101 Cin=0 -> S=1000 Cout=1
        A   <= "1011";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=11, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=13, Cin=0)" severity error;

        -- Case 380: A=1011 B=1101 Cin=1 -> S=1001 Cout=1
        A   <= "1011";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=11, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=13, Cin=1)" severity error;

        -- Case 381: A=1011 B=1110 Cin=0 -> S=1001 Cout=1
        A   <= "1011";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=11, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=14, Cin=0)" severity error;

        -- Case 382: A=1011 B=1110 Cin=1 -> S=1010 Cout=1
        A   <= "1011";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=11, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=14, Cin=1)" severity error;

        -- Case 383: A=1011 B=1111 Cin=0 -> S=1010 Cout=1
        A   <= "1011";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=11, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=15, Cin=0)" severity error;

        -- Case 384: A=1011 B=1111 Cin=1 -> S=1011 Cout=1
        A   <= "1011";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=11, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=11, B=15, Cin=1)" severity error;

        -- Case 385: A=1100 B=0000 Cin=0 -> S=1100 Cout=0
        A   <= "1100";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=12, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=12, B=0, Cin=0)" severity error;

        -- Case 386: A=1100 B=0000 Cin=1 -> S=1101 Cout=0
        A   <= "1100";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=12, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=12, B=0, Cin=1)" severity error;

        -- Case 387: A=1100 B=0001 Cin=0 -> S=1101 Cout=0
        A   <= "1100";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=12, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=12, B=1, Cin=0)" severity error;

        -- Case 388: A=1100 B=0001 Cin=1 -> S=1110 Cout=0
        A   <= "1100";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=12, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=12, B=1, Cin=1)" severity error;

        -- Case 389: A=1100 B=0010 Cin=0 -> S=1110 Cout=0
        A   <= "1100";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=12, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=12, B=2, Cin=0)" severity error;

        -- Case 390: A=1100 B=0010 Cin=1 -> S=1111 Cout=0
        A   <= "1100";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=12, B=2, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=12, B=2, Cin=1)" severity error;

        -- Case 391: A=1100 B=0011 Cin=0 -> S=1111 Cout=0
        A   <= "1100";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=12, B=3, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=12, B=3, Cin=0)" severity error;

        -- Case 392: A=1100 B=0011 Cin=1 -> S=0000 Cout=1
        A   <= "1100";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=12, B=3, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=3, Cin=1)" severity error;

        -- Case 393: A=1100 B=0100 Cin=0 -> S=0000 Cout=1
        A   <= "1100";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=12, B=4, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=4, Cin=0)" severity error;

        -- Case 394: A=1100 B=0100 Cin=1 -> S=0001 Cout=1
        A   <= "1100";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=12, B=4, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=4, Cin=1)" severity error;

        -- Case 395: A=1100 B=0101 Cin=0 -> S=0001 Cout=1
        A   <= "1100";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=12, B=5, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=5, Cin=0)" severity error;

        -- Case 396: A=1100 B=0101 Cin=1 -> S=0010 Cout=1
        A   <= "1100";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=12, B=5, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=5, Cin=1)" severity error;

        -- Case 397: A=1100 B=0110 Cin=0 -> S=0010 Cout=1
        A   <= "1100";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=12, B=6, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=6, Cin=0)" severity error;

        -- Case 398: A=1100 B=0110 Cin=1 -> S=0011 Cout=1
        A   <= "1100";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=12, B=6, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=6, Cin=1)" severity error;

        -- Case 399: A=1100 B=0111 Cin=0 -> S=0011 Cout=1
        A   <= "1100";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=12, B=7, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=7, Cin=0)" severity error;

        -- Case 400: A=1100 B=0111 Cin=1 -> S=0100 Cout=1
        A   <= "1100";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=12, B=7, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=7, Cin=1)" severity error;

        -- Case 401: A=1100 B=1000 Cin=0 -> S=0100 Cout=1
        A   <= "1100";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=12, B=8, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=8, Cin=0)" severity error;

        -- Case 402: A=1100 B=1000 Cin=1 -> S=0101 Cout=1
        A   <= "1100";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=12, B=8, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=8, Cin=1)" severity error;

        -- Case 403: A=1100 B=1001 Cin=0 -> S=0101 Cout=1
        A   <= "1100";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=12, B=9, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=9, Cin=0)" severity error;

        -- Case 404: A=1100 B=1001 Cin=1 -> S=0110 Cout=1
        A   <= "1100";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=12, B=9, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=9, Cin=1)" severity error;

        -- Case 405: A=1100 B=1010 Cin=0 -> S=0110 Cout=1
        A   <= "1100";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=12, B=10, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=10, Cin=0)" severity error;

        -- Case 406: A=1100 B=1010 Cin=1 -> S=0111 Cout=1
        A   <= "1100";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=12, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=10, Cin=1)" severity error;

        -- Case 407: A=1100 B=1011 Cin=0 -> S=0111 Cout=1
        A   <= "1100";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=12, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=11, Cin=0)" severity error;

        -- Case 408: A=1100 B=1011 Cin=1 -> S=1000 Cout=1
        A   <= "1100";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=12, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=11, Cin=1)" severity error;

        -- Case 409: A=1100 B=1100 Cin=0 -> S=1000 Cout=1
        A   <= "1100";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=12, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=12, Cin=0)" severity error;

        -- Case 410: A=1100 B=1100 Cin=1 -> S=1001 Cout=1
        A   <= "1100";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=12, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=12, Cin=1)" severity error;

        -- Case 411: A=1100 B=1101 Cin=0 -> S=1001 Cout=1
        A   <= "1100";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=12, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=13, Cin=0)" severity error;

        -- Case 412: A=1100 B=1101 Cin=1 -> S=1010 Cout=1
        A   <= "1100";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=12, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=13, Cin=1)" severity error;

        -- Case 413: A=1100 B=1110 Cin=0 -> S=1010 Cout=1
        A   <= "1100";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=12, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=14, Cin=0)" severity error;

        -- Case 414: A=1100 B=1110 Cin=1 -> S=1011 Cout=1
        A   <= "1100";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=12, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=14, Cin=1)" severity error;

        -- Case 415: A=1100 B=1111 Cin=0 -> S=1011 Cout=1
        A   <= "1100";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=12, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=15, Cin=0)" severity error;

        -- Case 416: A=1100 B=1111 Cin=1 -> S=1100 Cout=1
        A   <= "1100";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=12, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=12, B=15, Cin=1)" severity error;

        -- Case 417: A=1101 B=0000 Cin=0 -> S=1101 Cout=0
        A   <= "1101";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=13, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=13, B=0, Cin=0)" severity error;

        -- Case 418: A=1101 B=0000 Cin=1 -> S=1110 Cout=0
        A   <= "1101";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=13, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=13, B=0, Cin=1)" severity error;

        -- Case 419: A=1101 B=0001 Cin=0 -> S=1110 Cout=0
        A   <= "1101";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=13, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=13, B=1, Cin=0)" severity error;

        -- Case 420: A=1101 B=0001 Cin=1 -> S=1111 Cout=0
        A   <= "1101";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=13, B=1, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=13, B=1, Cin=1)" severity error;

        -- Case 421: A=1101 B=0010 Cin=0 -> S=1111 Cout=0
        A   <= "1101";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=13, B=2, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=13, B=2, Cin=0)" severity error;

        -- Case 422: A=1101 B=0010 Cin=1 -> S=0000 Cout=1
        A   <= "1101";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=13, B=2, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=2, Cin=1)" severity error;

        -- Case 423: A=1101 B=0011 Cin=0 -> S=0000 Cout=1
        A   <= "1101";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=13, B=3, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=3, Cin=0)" severity error;

        -- Case 424: A=1101 B=0011 Cin=1 -> S=0001 Cout=1
        A   <= "1101";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=13, B=3, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=3, Cin=1)" severity error;

        -- Case 425: A=1101 B=0100 Cin=0 -> S=0001 Cout=1
        A   <= "1101";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=13, B=4, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=4, Cin=0)" severity error;

        -- Case 426: A=1101 B=0100 Cin=1 -> S=0010 Cout=1
        A   <= "1101";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=13, B=4, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=4, Cin=1)" severity error;

        -- Case 427: A=1101 B=0101 Cin=0 -> S=0010 Cout=1
        A   <= "1101";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=13, B=5, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=5, Cin=0)" severity error;

        -- Case 428: A=1101 B=0101 Cin=1 -> S=0011 Cout=1
        A   <= "1101";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=13, B=5, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=5, Cin=1)" severity error;

        -- Case 429: A=1101 B=0110 Cin=0 -> S=0011 Cout=1
        A   <= "1101";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=13, B=6, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=6, Cin=0)" severity error;

        -- Case 430: A=1101 B=0110 Cin=1 -> S=0100 Cout=1
        A   <= "1101";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=13, B=6, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=6, Cin=1)" severity error;

        -- Case 431: A=1101 B=0111 Cin=0 -> S=0100 Cout=1
        A   <= "1101";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=13, B=7, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=7, Cin=0)" severity error;

        -- Case 432: A=1101 B=0111 Cin=1 -> S=0101 Cout=1
        A   <= "1101";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=13, B=7, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=7, Cin=1)" severity error;

        -- Case 433: A=1101 B=1000 Cin=0 -> S=0101 Cout=1
        A   <= "1101";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=13, B=8, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=8, Cin=0)" severity error;

        -- Case 434: A=1101 B=1000 Cin=1 -> S=0110 Cout=1
        A   <= "1101";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=13, B=8, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=8, Cin=1)" severity error;

        -- Case 435: A=1101 B=1001 Cin=0 -> S=0110 Cout=1
        A   <= "1101";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=13, B=9, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=9, Cin=0)" severity error;

        -- Case 436: A=1101 B=1001 Cin=1 -> S=0111 Cout=1
        A   <= "1101";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=13, B=9, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=9, Cin=1)" severity error;

        -- Case 437: A=1101 B=1010 Cin=0 -> S=0111 Cout=1
        A   <= "1101";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=13, B=10, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=10, Cin=0)" severity error;

        -- Case 438: A=1101 B=1010 Cin=1 -> S=1000 Cout=1
        A   <= "1101";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=13, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=10, Cin=1)" severity error;

        -- Case 439: A=1101 B=1011 Cin=0 -> S=1000 Cout=1
        A   <= "1101";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=13, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=11, Cin=0)" severity error;

        -- Case 440: A=1101 B=1011 Cin=1 -> S=1001 Cout=1
        A   <= "1101";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=13, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=11, Cin=1)" severity error;

        -- Case 441: A=1101 B=1100 Cin=0 -> S=1001 Cout=1
        A   <= "1101";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=13, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=12, Cin=0)" severity error;

        -- Case 442: A=1101 B=1100 Cin=1 -> S=1010 Cout=1
        A   <= "1101";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=13, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=12, Cin=1)" severity error;

        -- Case 443: A=1101 B=1101 Cin=0 -> S=1010 Cout=1
        A   <= "1101";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=13, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=13, Cin=0)" severity error;

        -- Case 444: A=1101 B=1101 Cin=1 -> S=1011 Cout=1
        A   <= "1101";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=13, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=13, Cin=1)" severity error;

        -- Case 445: A=1101 B=1110 Cin=0 -> S=1011 Cout=1
        A   <= "1101";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=13, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=14, Cin=0)" severity error;

        -- Case 446: A=1101 B=1110 Cin=1 -> S=1100 Cout=1
        A   <= "1101";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=13, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=14, Cin=1)" severity error;

        -- Case 447: A=1101 B=1111 Cin=0 -> S=1100 Cout=1
        A   <= "1101";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=13, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=15, Cin=0)" severity error;

        -- Case 448: A=1101 B=1111 Cin=1 -> S=1101 Cout=1
        A   <= "1101";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=13, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=13, B=15, Cin=1)" severity error;

        -- Case 449: A=1110 B=0000 Cin=0 -> S=1110 Cout=0
        A   <= "1110";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=14, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=14, B=0, Cin=0)" severity error;

        -- Case 450: A=1110 B=0000 Cin=1 -> S=1111 Cout=0
        A   <= "1110";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=14, B=0, Cin=1)" severity error;
        assert Cout = '0'
            report "Carry error (A=14, B=0, Cin=1)" severity error;

        -- Case 451: A=1110 B=0001 Cin=0 -> S=1111 Cout=0
        A   <= "1110";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=14, B=1, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=14, B=1, Cin=0)" severity error;

        -- Case 452: A=1110 B=0001 Cin=1 -> S=0000 Cout=1
        A   <= "1110";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=14, B=1, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=1, Cin=1)" severity error;

        -- Case 453: A=1110 B=0010 Cin=0 -> S=0000 Cout=1
        A   <= "1110";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=14, B=2, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=2, Cin=0)" severity error;

        -- Case 454: A=1110 B=0010 Cin=1 -> S=0001 Cout=1
        A   <= "1110";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=14, B=2, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=2, Cin=1)" severity error;

        -- Case 455: A=1110 B=0011 Cin=0 -> S=0001 Cout=1
        A   <= "1110";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=14, B=3, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=3, Cin=0)" severity error;

        -- Case 456: A=1110 B=0011 Cin=1 -> S=0010 Cout=1
        A   <= "1110";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=14, B=3, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=3, Cin=1)" severity error;

        -- Case 457: A=1110 B=0100 Cin=0 -> S=0010 Cout=1
        A   <= "1110";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=14, B=4, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=4, Cin=0)" severity error;

        -- Case 458: A=1110 B=0100 Cin=1 -> S=0011 Cout=1
        A   <= "1110";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=14, B=4, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=4, Cin=1)" severity error;

        -- Case 459: A=1110 B=0101 Cin=0 -> S=0011 Cout=1
        A   <= "1110";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=14, B=5, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=5, Cin=0)" severity error;

        -- Case 460: A=1110 B=0101 Cin=1 -> S=0100 Cout=1
        A   <= "1110";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=14, B=5, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=5, Cin=1)" severity error;

        -- Case 461: A=1110 B=0110 Cin=0 -> S=0100 Cout=1
        A   <= "1110";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=14, B=6, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=6, Cin=0)" severity error;

        -- Case 462: A=1110 B=0110 Cin=1 -> S=0101 Cout=1
        A   <= "1110";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=14, B=6, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=6, Cin=1)" severity error;

        -- Case 463: A=1110 B=0111 Cin=0 -> S=0101 Cout=1
        A   <= "1110";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=14, B=7, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=7, Cin=0)" severity error;

        -- Case 464: A=1110 B=0111 Cin=1 -> S=0110 Cout=1
        A   <= "1110";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=14, B=7, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=7, Cin=1)" severity error;

        -- Case 465: A=1110 B=1000 Cin=0 -> S=0110 Cout=1
        A   <= "1110";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=14, B=8, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=8, Cin=0)" severity error;

        -- Case 466: A=1110 B=1000 Cin=1 -> S=0111 Cout=1
        A   <= "1110";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=14, B=8, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=8, Cin=1)" severity error;

        -- Case 467: A=1110 B=1001 Cin=0 -> S=0111 Cout=1
        A   <= "1110";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=14, B=9, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=9, Cin=0)" severity error;

        -- Case 468: A=1110 B=1001 Cin=1 -> S=1000 Cout=1
        A   <= "1110";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=14, B=9, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=9, Cin=1)" severity error;

        -- Case 469: A=1110 B=1010 Cin=0 -> S=1000 Cout=1
        A   <= "1110";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=14, B=10, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=10, Cin=0)" severity error;

        -- Case 470: A=1110 B=1010 Cin=1 -> S=1001 Cout=1
        A   <= "1110";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=14, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=10, Cin=1)" severity error;

        -- Case 471: A=1110 B=1011 Cin=0 -> S=1001 Cout=1
        A   <= "1110";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=14, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=11, Cin=0)" severity error;

        -- Case 472: A=1110 B=1011 Cin=1 -> S=1010 Cout=1
        A   <= "1110";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=14, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=11, Cin=1)" severity error;

        -- Case 473: A=1110 B=1100 Cin=0 -> S=1010 Cout=1
        A   <= "1110";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=14, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=12, Cin=0)" severity error;

        -- Case 474: A=1110 B=1100 Cin=1 -> S=1011 Cout=1
        A   <= "1110";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=14, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=12, Cin=1)" severity error;

        -- Case 475: A=1110 B=1101 Cin=0 -> S=1011 Cout=1
        A   <= "1110";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=14, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=13, Cin=0)" severity error;

        -- Case 476: A=1110 B=1101 Cin=1 -> S=1100 Cout=1
        A   <= "1110";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=14, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=13, Cin=1)" severity error;

        -- Case 477: A=1110 B=1110 Cin=0 -> S=1100 Cout=1
        A   <= "1110";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=14, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=14, Cin=0)" severity error;

        -- Case 478: A=1110 B=1110 Cin=1 -> S=1101 Cout=1
        A   <= "1110";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=14, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=14, Cin=1)" severity error;

        -- Case 479: A=1110 B=1111 Cin=0 -> S=1101 Cout=1
        A   <= "1110";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=14, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=15, Cin=0)" severity error;

        -- Case 480: A=1110 B=1111 Cin=1 -> S=1110 Cout=1
        A   <= "1110";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=14, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=14, B=15, Cin=1)" severity error;

        -- Case 481: A=1111 B=0000 Cin=0 -> S=1111 Cout=0
        A   <= "1111";
        B   <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=15, B=0, Cin=0)" severity error;
        assert Cout = '0'
            report "Carry error (A=15, B=0, Cin=0)" severity error;

        -- Case 482: A=1111 B=0000 Cin=1 -> S=0000 Cout=1
        A   <= "1111";
        B   <= "0000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=15, B=0, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=0, Cin=1)" severity error;

        -- Case 483: A=1111 B=0001 Cin=0 -> S=0000 Cout=1
        A   <= "1111";
        B   <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 4))
            report "Sum error (A=15, B=1, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=1, Cin=0)" severity error;

        -- Case 484: A=1111 B=0001 Cin=1 -> S=0001 Cout=1
        A   <= "1111";
        B   <= "0001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=15, B=1, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=1, Cin=1)" severity error;

        -- Case 485: A=1111 B=0010 Cin=0 -> S=0001 Cout=1
        A   <= "1111";
        B   <= "0010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(1, 4))
            report "Sum error (A=15, B=2, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=2, Cin=0)" severity error;

        -- Case 486: A=1111 B=0010 Cin=1 -> S=0010 Cout=1
        A   <= "1111";
        B   <= "0010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=15, B=2, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=2, Cin=1)" severity error;

        -- Case 487: A=1111 B=0011 Cin=0 -> S=0010 Cout=1
        A   <= "1111";
        B   <= "0011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(2, 4))
            report "Sum error (A=15, B=3, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=3, Cin=0)" severity error;

        -- Case 488: A=1111 B=0011 Cin=1 -> S=0011 Cout=1
        A   <= "1111";
        B   <= "0011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=15, B=3, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=3, Cin=1)" severity error;

        -- Case 489: A=1111 B=0100 Cin=0 -> S=0011 Cout=1
        A   <= "1111";
        B   <= "0100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(3, 4))
            report "Sum error (A=15, B=4, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=4, Cin=0)" severity error;

        -- Case 490: A=1111 B=0100 Cin=1 -> S=0100 Cout=1
        A   <= "1111";
        B   <= "0100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=15, B=4, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=4, Cin=1)" severity error;

        -- Case 491: A=1111 B=0101 Cin=0 -> S=0100 Cout=1
        A   <= "1111";
        B   <= "0101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(4, 4))
            report "Sum error (A=15, B=5, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=5, Cin=0)" severity error;

        -- Case 492: A=1111 B=0101 Cin=1 -> S=0101 Cout=1
        A   <= "1111";
        B   <= "0101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=15, B=5, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=5, Cin=1)" severity error;

        -- Case 493: A=1111 B=0110 Cin=0 -> S=0101 Cout=1
        A   <= "1111";
        B   <= "0110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(5, 4))
            report "Sum error (A=15, B=6, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=6, Cin=0)" severity error;

        -- Case 494: A=1111 B=0110 Cin=1 -> S=0110 Cout=1
        A   <= "1111";
        B   <= "0110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=15, B=6, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=6, Cin=1)" severity error;

        -- Case 495: A=1111 B=0111 Cin=0 -> S=0110 Cout=1
        A   <= "1111";
        B   <= "0111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(6, 4))
            report "Sum error (A=15, B=7, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=7, Cin=0)" severity error;

        -- Case 496: A=1111 B=0111 Cin=1 -> S=0111 Cout=1
        A   <= "1111";
        B   <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=15, B=7, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=7, Cin=1)" severity error;

        -- Case 497: A=1111 B=1000 Cin=0 -> S=0111 Cout=1
        A   <= "1111";
        B   <= "1000";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(7, 4))
            report "Sum error (A=15, B=8, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=8, Cin=0)" severity error;

        -- Case 498: A=1111 B=1000 Cin=1 -> S=1000 Cout=1
        A   <= "1111";
        B   <= "1000";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=15, B=8, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=8, Cin=1)" severity error;

        -- Case 499: A=1111 B=1001 Cin=0 -> S=1000 Cout=1
        A   <= "1111";
        B   <= "1001";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(8, 4))
            report "Sum error (A=15, B=9, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=9, Cin=0)" severity error;

        -- Case 500: A=1111 B=1001 Cin=1 -> S=1001 Cout=1
        A   <= "1111";
        B   <= "1001";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=15, B=9, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=9, Cin=1)" severity error;

        -- Case 501: A=1111 B=1010 Cin=0 -> S=1001 Cout=1
        A   <= "1111";
        B   <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(9, 4))
            report "Sum error (A=15, B=10, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=10, Cin=0)" severity error;

        -- Case 502: A=1111 B=1010 Cin=1 -> S=1010 Cout=1
        A   <= "1111";
        B   <= "1010";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=15, B=10, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=10, Cin=1)" severity error;

        -- Case 503: A=1111 B=1011 Cin=0 -> S=1010 Cout=1
        A   <= "1111";
        B   <= "1011";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(10, 4))
            report "Sum error (A=15, B=11, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=11, Cin=0)" severity error;

        -- Case 504: A=1111 B=1011 Cin=1 -> S=1011 Cout=1
        A   <= "1111";
        B   <= "1011";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=15, B=11, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=11, Cin=1)" severity error;

        -- Case 505: A=1111 B=1100 Cin=0 -> S=1011 Cout=1
        A   <= "1111";
        B   <= "1100";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(11, 4))
            report "Sum error (A=15, B=12, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=12, Cin=0)" severity error;

        -- Case 506: A=1111 B=1100 Cin=1 -> S=1100 Cout=1
        A   <= "1111";
        B   <= "1100";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=15, B=12, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=12, Cin=1)" severity error;

        -- Case 507: A=1111 B=1101 Cin=0 -> S=1100 Cout=1
        A   <= "1111";
        B   <= "1101";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(12, 4))
            report "Sum error (A=15, B=13, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=13, Cin=0)" severity error;

        -- Case 508: A=1111 B=1101 Cin=1 -> S=1101 Cout=1
        A   <= "1111";
        B   <= "1101";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=15, B=13, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=13, Cin=1)" severity error;

        -- Case 509: A=1111 B=1110 Cin=0 -> S=1101 Cout=1
        A   <= "1111";
        B   <= "1110";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(13, 4))
            report "Sum error (A=15, B=14, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=14, Cin=0)" severity error;

        -- Case 510: A=1111 B=1110 Cin=1 -> S=1110 Cout=1
        A   <= "1111";
        B   <= "1110";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=15, B=14, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=14, Cin=1)" severity error;

        -- Case 511: A=1111 B=1111 Cin=0 -> S=1110 Cout=1
        A   <= "1111";
        B   <= "1111";
        Cin <= '0';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(14, 4))
            report "Sum error (A=15, B=15, Cin=0)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=15, Cin=0)" severity error;

        -- Case 512: A=1111 B=1111 Cin=1 -> S=1111 Cout=1
        A   <= "1111";
        B   <= "1111";
        Cin <= '1';
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 4))
            report "Sum error (A=15, B=15, Cin=1)" severity error;
        assert Cout = '1'
            report "Carry error (A=15, B=15, Cin=1)" severity error;

        wait;  -- termine la simulation
    end process stimulus;
end architecture tb;

-- Index : script python utilisé :

--#!/usr/bin/env python3
--"""
--Génère un testbench VHDL (tb_full_adder_4b.vhd) et l'écrit dans un fichier nommé "tb"
--dans le même répertoire que ce script.
--Usage :
--    python make_tb_4b.py
--Le testbench sera disponible dans le fichier "./tb".
--"""
--
--import os
--import itertools
--
--def vhdl_vec(n):
--    """Retourne la représentation binaire 4 bits de n (0–15)."""
--    return "".join('1' if n & (1 << i) else '0' for i in range(3, -1, -1))
--
--def main():
--    # Chemin du fichier de sortie "tb" dans le même dossier que ce script
--    script_dir = os.path.dirname(os.path.abspath(__file__))
--    out_path = os.path.join(script_dir, "tb")
--
--    with open(out_path, 'w') as f:
--        # Entête du testbench
--        f.write("""library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--
--entity tb_full_adder_4b is
--end entity tb_full_adder_4b;
--
--architecture tb of tb_full_adder_4b is
--    signal A, B  : std_logic_vector(3 downto 0);
--    signal Cin   : std_logic;
--    signal S     : std_logic_vector(3 downto 0);
--    signal Cout  : std_logic;
--begin
--    UUT: entity work.full_adder_4b
--        port map (
--            A    => A,
--            B    => B,
--            Cin  => Cin,
--            S    => S,
--            Cout => Cout
--        );
--
--    stimulus: process
--    begin
--""")
--
--        # Génération des 512 cas
--        case_idx = 1
--        for a, b, cin in itertools.product(range(16), range(16), (0, 1)):
--            sum_val  = a + b + cin
--            s_bits   = sum_val % 16
--            cout_bit = 1 if sum_val >= 16 else 0
--
--            f.write(f"        -- Case {case_idx:03d}: A={a:04b} B={b:04b} Cin={cin} -> S={s_bits:04b} Cout={cout_bit}\n")
--            f.write(f"        A   <= \"{vhdl_vec(a)}\";\n")
--            f.write(f"        B   <= \"{vhdl_vec(b)}\";\n")
--            f.write(f"        Cin <= '{cin}';\n")
--            f.write("        wait for 10 ns;\n")
--            f.write(f"        assert S = std_logic_vector(to_unsigned({s_bits}, 4))\n")
--            f.write(f"            report \"Sum error (A={a}, B={b}, Cin={cin})\" severity error;\n")
--            f.write(f"        assert Cout = '{cout_bit}'\n")
--            f.write(f"            report \"Carry error (A={a}, B={b}, Cin={cin})\" severity error;\n")
--            f.write("\n")
--            case_idx += 1
--
--        # Pied de page
--        f.write("""        wait;  -- termine la simulation
--    end process stimulus;
--end architecture tb;
--""")
--
--    print(f"Testbench généré dans : {out_path}")
--
--if __name__ == "__main__":
--    main()