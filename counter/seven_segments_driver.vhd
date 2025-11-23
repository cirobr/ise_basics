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


entity seven_segments_driver is
    port (
        BCD_IN       : in  std_logic_vector(3 downto 0);  -- Input: 0000 to 1111
        SEGMENTS_OUT : out std_logic_vector(7 downto 0)   -- CA..CG + DP (active-low)
    );
end entity;

architecture seven_segments_driver_arch of seven_segments_driver is

    -- 7-segment patterns (active-low, common anode) for 0–F
    type pattern_array is array (0 to 15) of std_logic_vector(6 downto 0);
    constant SEG_PAT : pattern_array := (
        0  => "0000001",  -- 0
        1  => "1001111",  -- 1
        2  => "0010010",  -- 2
        3  => "0000110",  -- 3
        4  => "1001100",  -- 4
        5  => "0100100",  -- 5
        6  => "0100000",  -- 6
        7  => "0001111",  -- 7
        8  => "0000000",  -- 8
        9  => "0000100",  -- 9
        10 => "0001000",  -- A
        11 => "1100000",  -- b
        12 => "0110001",  -- C
        13 => "1000010",  -- d
        14 => "0110000",  -- E
        15 => "0111000"   -- F
    );

    -- Internal signal for the 7 segments (a..g)
    signal segments : std_logic_vector(6 downto 0);

begin

    -- Convert 4-bit input to integer index and drive the pattern
    -- This is concurrent – no process needed!
    segments <= SEG_PAT(to_integer(unsigned(BCD_IN)));

    -- Output: segments + decimal point (off = '1')
    SEGMENTS_OUT <= segments & '1';

end architecture seven_segments_driver_arch;