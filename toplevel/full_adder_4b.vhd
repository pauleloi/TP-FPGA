library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_4b is
    port (
        A    : in  std_logic_vector(3 downto 0);  -- opérande 4 bits
        B    : in  std_logic_vector(3 downto 0);  -- opérande 4 bits
        Cin  : in  std_logic;                     -- retenue d’entrée
        S    : out std_logic_vector(3 downto 0);  -- somme 4 bits
        Cout : out std_logic                      -- retenue de sortie
    );
end entity full_adder_4b;

architecture structural of full_adder_4b is
    signal c1, c2, c3 : std_logic;
begin
    -- bit 0
    fa0: entity work.full_adder
       port map ( A    => A(0),
                  B    => B(0),
                  Cin  => Cin,
                  S    => S(0),
                  Cout => c1 );
    -- bit 1
    fa1: entity work.full_adder
       port map ( A    => A(1),
                  B    => B(1),
                  Cin  => c1,
                  S    => S(1),
                  Cout => c2 );
    -- bit 2
    fa2: entity work.full_adder
       port map ( A    => A(2),
                  B    => B(2),
                  Cin  => c2,
                  S    => S(2),
                  Cout => c3 );
    -- bit 3
    fa3: entity work.full_adder
       port map ( A    => A(3),
                  B    => B(3),
                  Cin  => c3,
                  S    => S(3),
                  Cout => Cout );
end architecture structural;