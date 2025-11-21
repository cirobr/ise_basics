library IEEE;
use IEEE.std_logic_1164.all;

entity mimas_v2_counter_1to10 is
    port (
        CLK_12MHZ : in  std_logic;   -- Pin D9

        BTNU      : in  std_logic;   -- Pin M18 (freeze when pressed)

        -- 7-segment segments (active-low, common anode)
        CA, CB, CC, CD, CE, CF, CG, DP : out std_logic;

        -- Digit anodes (active-low) – only two right-most used
        AN0, AN1, AN2, AN3 : out std_logic
    );
end entity;

architecture rtl of mimas_v2_counter_1to10 is

    -- 1 Hz generation
    signal clk_div  : integer range 0 to 11_999_999 := 0;
    signal tick_1hz : std_logic := '0';

    -- Button debouncer
    signal debounce_cnt : integer range 0 to 599_999 := 0;
    signal btn_reg      : std_logic := '0';
    signal btn_clean    : std_logic := '0';

    -- Counter 01 → 10
    signal ones : integer range 0 to 9 := 1;
    signal tens : integer range 0 to 1 := 0;

    -- Display refresh (~750 Hz)
    signal refresh_cnt : integer range 0 to 15_999 := 0;
    signal sel_tens    : std_logic := '0';   -- '1' = show tens digit

    -- 7-segment patterns (active-low)
    type seg_array is array (0 to 9) of std_logic_vector(6 downto 0);
    constant SEG_PAT : seg_array := (
        0 => "1000000", 1 => "1111001", 2 => "0100100", 3 => "0110000",
        4 => "0011001", 5 => "0010010", 6 => "0000010", 7 => "1111000",
        8 => "0000000", 9 => "0010000"
    );

begin

    -- 1 Hz tick
    process(CLK_12MHZ)
    begin
        if rising_edge(CLK_12MHZ) then
            if clk_div = 11_999_999 then
                clk_div <= 0;
                tick_1hz <= not tick_1hz;
            else
                clk_div <= clk_div + 1;
            end if;
        end if;
    end process;

    -- Button debouncer (~50 ms)
    process(CLK_12MHZ)
    begin
        if rising_edge(CLK_12MHZ) then
            btn_reg <= BTNU;
            if BTNU = btn_reg then
                if debounce_cnt /= 599_999 then
                    debounce_cnt <= debounce_cnt + 1;
                else
                    btn_clean <= BTNU;
                end if;
            else
                debounce_cnt <= 0;
            end if;
        end if;
    end process;

    -- Main counter (advances only when button not pressed)
    process(CLK_12MHZ)
    begin
        if rising_edge(CLK_12MHZ) then
            if tick_1hz = '1' and btn_clean = '0' then
                if tens = 1 and ones = 0 then
                    tens <= 0; ones <= 1;               -- 10 → 01
                elsif ones = 9 then
                    ones <= 0; tens <= 1;               -- x9 → x0 + carry
                else
                    ones <= ones + 1;
                end if;
            end if;
        end if;
    end process;

    -- Refresh counter (~750 Hz)
    process(CLK_12MHZ)
    begin
        if rising_edge(CLK_12MHZ) then
            refresh_cnt <= refresh_cnt + 1;
            if refresh_cnt = 15_999 then
                refresh_cnt <= 0;
                sel_tens <= not sel_tens;
            end if;
        end if;
    end process;

    -- 7-segment output
    process(sel_tens, ones, tens)
        variable pat : std_logic_vector(6 downto 0);
    begin
        if sel_tens = '1' then
            if tens = 1 then
                pat := SEG_PAT(1);       -- show "1"
            else
                pat := "1111111";        -- blank
            end if;
        else
            pat := SEG_PAT(ones);        -- show ones digit
        end if;

        CA <= pat(0); CB <= pat(1); CC <= pat(2); CD <= pat(3);
        CE <= pat(4); CF <= pat(5); CG <= pat(6);
    end process;

    DP <= '1';  -- decimal point off

    -- Anode control (active low)
    AN0 <= '1';                                 -- unused
    AN1 <= '0' when sel_tens = '0' else '1';    -- right-most  (ones)
    AN2 <= '0' when sel_tens = '1' else '1';    -- second from right (tens)
    AN3 <= '1';                                 -- unused

end architecture rtl;