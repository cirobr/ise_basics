--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : boolean2.vhf
-- /___/   /\     Timestamp : 11/20/2025 08:58:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl /home/ciro/vhdl/boolean2/boolean2.vhf -w /home/ciro/vhdl/boolean2/boolean2.sch
--Design Name: boolean2
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity boolean2 is
   port ( a : in    std_logic; 
          b : in    std_logic; 
          c : in    std_logic; 
          d : in    std_logic; 
          y : out   std_logic);
end boolean2;

architecture BEHAVIORAL of boolean2 is
   attribute BOX_TYPE   : string ;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   XLXI_4 : AND2
      port map (I0=>b,
                I1=>a,
                O=>XLXN_9);
   
   XLXI_5 : AND2
      port map (I0=>d,
                I1=>c,
                O=>XLXN_10);
   
   XLXI_6 : OR2
      port map (I0=>XLXN_10,
                I1=>XLXN_9,
                O=>y);
   
end BEHAVIORAL;


