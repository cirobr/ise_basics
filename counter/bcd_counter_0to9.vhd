library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_counter_0to9 is
    port (
        CLK_1HZ   : in  std_logic;  -- 1 Hz clock input (one pulse per second)
        RESET_N   : in  std_logic;  -- Active-low asynchronous reset
        ENABLE    : in  std_logic;  -- '1' = count enabled, '0' = hold

        BCD_OUT   : out std_logic_vector(3 downto 0);  -- BCD value 0000 to 1001
        CARRY_OUT : out std_logic                      -- Pulse when rolling from 9 → 0
        D1, D2, D3, D4 : out std_logic                 -- LED outputs for testing
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
    D1 <= BCD_OUT(3);  -- MSB for testing
    D2 <= BCD_OUT(2);
    D3 <= BCD_OUT(1);
    D4 <= BCD_OUT(0);  -- LSB for testing

end architecture bcd_counter_0to9_arch;