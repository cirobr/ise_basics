library ieee;
use ieee.std_logic_1164.all;

entity boolean1 is
    port (
        A, B, C, D : in STD_LOGIC;
        Y			 : out STD_LOGIC -- no comma
    );
end boolean1;


architecture boolean1_arch of boolean1 is

begin
    Y <= (A and B) or (C and D);
end boolean1_arch;
