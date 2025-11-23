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


entity bcd_counter_0to9 is
    port (
        CLK_1HZ   : in  std_logic;  -- 1 Hz clock input (one pulse per second)
        RESET_N   : in  std_logic;  -- Active-low asynchronous reset
        ENABLE    : in  std_logic;  -- '1' = count enabled, '0' = hold

        BCD_OUT   : out std_logic_vector(3 downto 0);  -- BCD value 0000 to 1001
        CARRY_OUT : out std_logic                      -- Pulse when rolling from 9 → 0
    );
end entity;

architecture bcd_counter_0to9_arch of bcd_counter_0to9 is

    signal digit : integer range 0 to 9 := 0;

begin

    process(RESET_N, CLK_1HZ)
    begin
        if RESET_N = '0' then
            digit     <= 0;
            CARRY_OUT <= '0';

        elsif rising_edge(CLK_1HZ) then
            CARRY_OUT <= '0';                -- default: no carry

            if ENABLE = '1' then
                if digit = 9 then
                    digit     <= 0;
                    CARRY_OUT <= '1';        -- one-cycle pulse on 9 → 0 rollover
                else
                    digit <= digit + 1;
                end if;
            end if;
        end if;
    end process;

    -- Convert integer digit to BCD vector
    BCD_OUT <= std_logic_vector(to_unsigned(digit, 4));

end architecture bcd_counter_0to9_arch;