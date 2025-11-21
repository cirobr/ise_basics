library ieee;
use ieee.std_logic_1164.all;

entity dipswitch is
    port (
		dp1, dp2, dp3, dp4, dp5, dp6, dp7, dp8 : in STD_LOGIC;
		d1, d2, d3, d4, d5, d6, d7, d8 : out STD_LOGIC
	);
end dipswitch;


architecture dipswitch_arch of dipswitch is
	signal a, b, c, d : STD_LOGIC;
	signal y : STD_LOGIC;

begin
	d1 <= dp1;
	d2 <= dp2;
	d3 <= dp3;
	d4 <= dp4;
	d5 <= dp5;
	d6 <= dp6;
	d7 <= dp7;
	d8 <= dp8;
end dipswitch_arch;
