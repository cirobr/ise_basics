library IEEE;
use IEEE.std_logic_1164.all;

entity counter is
    port (
        CLK_12MHZ   : in  std_logic;      -- 12 MHz clock input (pin D9)

        CLK_1HZ     : out std_logic;      -- 1 Hz clock output (for testing)
        D1, D2, D3, D4 : out std_logic;   -- LED outputs for ones digit
        CARRY : out std_logic             -- Carry output to next digit
    );
end entity;

architecture counter_arch of counter is
    signal tick_1hz   : std_logic;
    signal ones_bcd  : std_logic_vector(3 downto 0);
    signal carry_to_tens : std_logic;

begin

-- Instantiate 1 Hz generator
u1: entity work.clk_1hz_generator
    port map (
        CLK_12MHZ => CLK_12MHZ,
        CLK_1HZ => tick_1hz
    );

-- Instantiate BCD counter (ones digit)
u2: entity work.bcd_counter_0to9
    port map (
        CLK_1HZ   => tick_1hz,
        RESET_N   => '1',           -- or tie to a reset button
        ENABLE    => '1',           -- count only when button not pressed
        BCD_OUT   => ones_bcd,
        CARRY_OUT => carry_to_tens
    );

-- Output assignments
CLK_1HZ <= tick_1hz;  -- for testing
D1 <= ones_bcd(3);    -- MSB
D2 <= ones_bcd(2);
D3 <= ones_bcd(1);
D4 <= ones_bcd(0);    -- LSB
-- CARRY <= carry_to_tens;
CARRY <= '0';  -- disable carry for now

end architecture counter_arch;