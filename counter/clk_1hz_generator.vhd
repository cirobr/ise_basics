library IEEE;
use IEEE.std_logic_1164.all;

entity clk_1hz_generator is
    port (
        CLK_12MHZ : in  std_logic;   -- 12 MHz input clock (pin D9)
        CLK_1HZ   : out std_logic    -- 1 Hz output with 50% duty cycle
    );
end entity;

architecture clk_1hz_generator_arch of clk_1hz_generator is

    -- 12_000_000 / 2 = 6_000_000 → we toggle every 6 million cycles
    constant MAX_COUNT : integer := 5_999_999;
    signal   counter   : integer range 0 to MAX_COUNT := 0;
    signal   clk_1hz_i : std_logic := '0';

begin

    process(CLK_12MHZ)
    begin
        if rising_edge(CLK_12MHZ) then
            if counter = MAX_COUNT then
                counter   <= 0;
                clk_1hz_i <= not clk_1hz_i;   -- toggle → perfect 50% duty cycle
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    CLK_1HZ <= clk_1hz_i;

end architecture clk_1hz_generator_arch;