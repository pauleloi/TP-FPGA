--***************************
-- Part II.A.1 Question 1
--***************************
-- Il faut utiliser le XOR et le AND, voire table de vérité ci-dessous:
--
-- | A | B | S (A XOR B) | C (A AND B) |
-- |---|---|-------------|-------------|
-- | 0 | 0 |      0      |      0      |
-- | 0 | 1 |      1      |      0      |
-- | 1 | 0 |      1      |      0      |
-- | 1 | 1 |      0      |      1      |

--***************************
-- Part II.A.1 Question 2
--***************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity half_adder is
   port(
      A : in  std_logic;  -- Premier opérande (1 bit)
      B : in  std_logic;  -- Deuxième opérande (1 bit)
      S : out std_logic;  -- Somme (résultat de A XOR B)
      C : out std_logic   -- Retenue (résultat de A AND B)
   );
end half_adder;

architecture Behavioral of half_adder is
begin
   -- Calcul de la somme et de la retenue
   S <= A xor B;
   C <= A and B;
end Behavioral;
