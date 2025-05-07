library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel is
    port (
        CLOCK_50_B6A : in  std_logic;                     -- Horloge 50 MHz
        KEY          : in  std_logic_vector(3 downto 0);  -- Boutons (KEY3 = Reset)
        LEDR         : out std_logic_vector(9 downto 0)   -- LEDs rouges (chenillard)
    );
end entity toplevel;

architecture Structural of toplevel is
    -- Signaux internes
    signal clk_div : std_logic;
    signal N       : std_logic_vector(4 downto 0) := "10111";
	 signal rst_sync    : std_logic := '1';
    signal rst_sync_1  : std_logic := '1';
begin

    -- Instanciation du diviseur d’horloge
    diviseur: entity work.clock_divider
        port map (
            CLKin  => CLOCK_50_B6A,
            RST    => KEY(0),   -- Reset actif bas
            N      => N,
            CLKout => clk_div
        );
		  
	 -- Synchronisation du bouton de reset sur clk_div
    sync_reset_proc: process(clk_div)
    begin
        if rising_edge(clk_div) then
            rst_sync_1 <= KEY(0);
            rst_sync   <= rst_sync_1;
        end if;
    end process;

    -- Instanciation du chenillard
    chen: entity work.chenillard
        port map (
            CLK  => clk_div,
            RST  => KEY(0),     -- Même reset
            CHEN => LEDR
        );

end architecture Structural;
