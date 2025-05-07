library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bistable is
	--***************************
	-- Part I.B.1 Question 3
	--***************************
	port (
		clk : in  std_logic;  -- Horloge (front montant)
		rst : in  std_logic;  -- Reset asynchrone (retour à A quand rst='1')
		X   : in  std_logic;  -- Entrée du bistable
		Y   : out std_logic   -- Sortie
	);
end entity;

architecture behavioral of bistable is
	--***************************
	-- Part I.B.1 Question 4
	--***************************
	type state_type is (A, B, C, D);  -- États de la FSM
	signal future_state  : state_type := A;
	signal current_state : state_type := A;

begin

	--***************************
	-- Part I.B.1 Question 5
	--***************************
	-- Registre d’état (séquentiel)
	process(clk, rst)
	begin
		if rst = '1' then
			current_state <= A;
		elsif (clk'event and clk = '1') then
			current_state <= future_state;
		end if;
	end process;

	--***************************
	-- Part I.B.1 Question 6
	--***************************
	-- Calcul de l’état futur (combinatoire)
	process(X, current_state)
	begin
		case current_state is
			when A =>
				if X = '1' then
					future_state <= B;
				else
					future_state <= A;
				end if;
			when B =>
				if X = '0' then
					future_state <= C;
				else
					future_state <= B;
				end if;
			when C =>
				if X = '1' then
					future_state <= D;
				else
					future_state <= C;
				end if;
			when D =>
				if X = '0' then
					future_state <= A;
				else
					future_state <= D;
				end if;
			when others =>
				future_state <= A;
		end case;
	end process;

	--***************************
	-- Part I.B.1 Question 7
	--***************************
	-- Calcul des sorties (Moore)
	process(current_state)
	begin
		case current_state is
			when A | D =>
				Y <= '0';
			when B | C =>
				Y <= '1';
			when others =>
				Y <= 'X';
		end case;
	end process;

end behavioral;
