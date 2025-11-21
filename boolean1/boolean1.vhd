library ieee;
use ieee.std_logic_1164.all;

entity boolean1 is
    port (
		dp1, dp2, dp3, dp4 : in STD_LOGIC;
		d1 : out STD_LOGIC
	);
end boolean1;


architecture boolean1_arch of boolean1 is
	signal a, b, c, d : STD_LOGIC;
	signal y : STD_LOGIC;

begin
    y <= not ( (a and b) or (c and d) );

	a <= dp1;
	b <= dp2;
	c <= dp3;
	d <= dp4;
	d1 <= not y;
end boolean1_arch;
