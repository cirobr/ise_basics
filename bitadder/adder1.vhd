----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:07:25 04/19/2025 
-- Design Name: 
-- Module Name:    adder1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder1 is
    Port ( cin : in  STD_LOGIC;
           a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           y : out  STD_LOGIC);
end adder1;

architecture Behavioral of adder1 is

begin
    y <= not (cin xor a xor b);
    cout <= not ((cin and a) or (cin and b) or (a and b));
end Behavioral;

