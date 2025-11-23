library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- use IEEE.math_real.all;

-- Testbench only
-- use std.textio.all;
-- use IEEE.std_logic_textio.all;

-- Xilinx
-- library UNISIM;
-- use UNISIM.vcomponents.all;

entity counter is
    port (
        CLK_12MHZ      : in  std_logic;   -- 12 MHz clock input (pin D9)

        CLK_1HZ        : out std_logic;   -- 1 Hz clock output (led D8)
        D1, D2, D3, D4 : out std_logic;   -- LED outputs for ones digit
        CARRY          : out std_logic;    -- Carry output to next digit (led D7)

        SevenSegment_a, SevenSegment_b, SevenSegment_c, SevenSegment_d,
        SevenSegment_e, SevenSegment_f, SevenSegment_g, SevenSegment_h : out std_logic;  -- Seven segment outputs (a to g) + dot

        SevenSegmentEnable0, SevenSegmentEnable1, SevenSegmentEnable2 : out std_logic  -- Enable for seven segment display (active low)
    );
end entity;

architecture counter_arch of counter is
    signal tick_1hz      : std_logic;
    signal ones_bcd      : std_logic_vector(3 downto 0);
    signal carry_to_tens : std_logic;
    signal segments      : std_logic_vector(7 downto 0);

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

u3: entity work.seven_segments_driver
    port map (
        BCD_IN       => ones_bcd,
        SEGMENTS_OUT => segments
    );

-- Output assignments
CLK_1HZ <= tick_1hz;  -- for testing
D1 <= ones_bcd(3);    -- MSB
D2 <= ones_bcd(2);
D3 <= ones_bcd(1);
D4 <= ones_bcd(0);    -- LSB
CARRY <= carry_to_tens;

SevenSegment_a <= segments(7);  -- a
SevenSegment_b <= segments(6);  -- b
SevenSegment_c <= segments(5);  -- c
SevenSegment_d <= segments(4);  -- d
SevenSegment_e <= segments(3);  -- e
SevenSegment_f <= segments(2);  -- f
SevenSegment_g <= segments(1);  -- g
SevenSegment_h <= segments(0);  -- dot
SevenSegmentEnable0 <= '0';  -- Enable the display
SevenSegmentEnable1 <= '1';  -- Disable other displays
SevenSegmentEnable2 <= '1';

end architecture counter_arch;