--****************************
-- Part II.A.3 Question 1
--****************************
-- Un additionneur à retenue propagée 4 bits est construit avec plusieurs additionneurs complets 1 bit :
--
-- - Chaque additionneur complet (full_adder) calcule la somme d'un bit
--   de A, d'un bit de B, et d'une retenue d'entrée (Cin).
--
-- - Le Cout (carry out) de chaque additionneur est connecté au Cin
--   du suivant, de poids faible vers poids fort.
--
-- - La première retenue Cin est l'entrée générale de l'additionneur 4 bits.
--   La dernière retenue Cout (issue du MSB) devient la retenue finale.
--
-- Schéma logique :
-- 
--     Cin ---> [FA0] ---> c1 ---> [FA1] ---> c2 ---> [FA2] ---> c3 ---> [FA3] ---> Cout
--                |               |               |               |
--              S(0)            S(1)            S(2)            S(3)
--
-- Où FAi est un additionneur complet sur 1 bit (A(i), B(i), Cin).

--****************************
-- Part II.A.3
--****************************
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