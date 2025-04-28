--****************************
-- Part II.A.2 Question 1
--****************************
-- Rappel : additionneur complet = 2 demi-additionneurs + OR
--   S1   = A xor B
--   C1   = A and B
--   S    = S1 xor Cin
--   C2   = S1 and Cin
--   Cout = C1 or C2
--
-- Table de vérité du full‑adder (A + B + Cin) :
--  A | B | Cin |  S  | Cout
-- ---|---|-----|-----|-----
--  0 | 0 |  0  |  0  |  0
--  0 | 0 |  1  |  1  |  0
--  0 | 1 |  0  |  1  |  0
--  0 | 1 |  1  |  0  |  1
--  1 | 0 |  0  |  1  |  0
--  1 | 0 |  1  |  0  |  1
--  1 | 1 |  0  |  0  |  1
--  1 | 1 |  1  |  1  |  1


--****************************
-- Part II.A.2 Question 2
--****************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder is
   port(
      A : in  std_logic;
      B : in  std_logic;
		Cin : in std_logic;
      S : out std_logic;
		Cout : out std_logic
   );
end full_adder;

architecture Behavioral of full_adder is
	signal S1, C1, C2 : std_logic;
begin
	ha1 : entity work.half_adder port map(
		A => A,
		B => B,
		S => S1,
		C => C1
	 );
	 
	ha2 : entity work.half_adder port map(
		A => S1,
		B => Cin,
		S => S,
		C => C2
	 );
	 

	Cout <= C1 or C2;
end Behavioral;

