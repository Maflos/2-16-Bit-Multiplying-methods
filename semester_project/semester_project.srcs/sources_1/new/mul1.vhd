----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2017 09:40:25 AM
-- Design Name: 
-- Module Name: mul1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mul1 is
    Port ( clk : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           p : out STD_LOGIC_VECTOR (7 downto 0));
end mul1;

architecture Behavioral of mul1 is

signal reg1: std_logic_vector(7 downto 0) := x"00";
signal reg2: std_logic_vector(19 downto 0) := x"00000";

signal lvl1_in: std_logic_vector(17 downto 0) := x"0000" & "00";
signal lvl1_out: std_logic_vector(19 downto 0) := x"00000";

signal lvl2_in: std_logic_vector(20 downto 0) := x"00000" & '0';
signal lvl2_out: std_logic_vector(13 downto 0) := x"000" & "00";

signal p1, p2: std_logic_vector(6 downto 0);

begin

clk_write: process(clk)
begin
    if rising_edge(clk) then
        reg1(3 downto 0) <= y;
        reg1(7 downto 4) <= x;
        reg2(7 downto 0) <= lvl1_out(7 downto 0);
        reg2(19 downto 8) <= lvl1_out(19 downto 8);
    end if;
end process clk_write;

--clk_read: process(clk)
--begin
   -- if falling_edge(clk) then
      --  lvl1_out(7 downto 0) <= reg1(7 downto 0);
    --end if;
--end process clk_read;
lvl1_out(7 downto 0) <= reg1(7 downto 0);

for1: for i in 0 to 3 generate
begin
    lvl1_in(i) <= reg1(0) and reg1(i + 4);
    lvl1_in(i + 6 + 1) <= reg1(1) and reg1(i + 4);
    lvl1_in(i + 12 + 2) <= reg1(2) and reg1(i+4);
    lvl2_in(i + 3) <= reg2(3) and reg2(i + 4);
end generate for1;

for2: for i in 0 to 5 generate
begin

sst1: entity WORK.sum_elem port map(x => lvl1_in(i),
                                   y => lvl1_in(i + 6),
                                   tin => lvl1_in(i + 12),
                                   s => lvl1_out(i + 8),
                                   tout =>lvl1_out(i + 14)); 
end generate for2;

for3: for i in 0 to 5 generate
begin
    lvl2_in(i + 7) <= reg2(i + 8);  
    lvl2_in(i + 15) <= reg2(i + 14);

end generate for3;

for4: for i in 0 to 6 generate
begin

sst1: entity WORK.sum_elem port map(x => lvl2_in(i),
                                    y => lvl2_in(i + 7),
                                    tin => lvl2_in(i + 14),
                                    s => lvl2_out(i),
                                    tout => lvl2_out(i + 7)); 
end generate for4;

p1 <= lvl2_out(6 downto 0);
p2 <= lvl2_out(12 downto 7) & '0';

final: entity WORK.spt port map (a => p1,
                                 b => p2,
                                 sum => p);

end Behavioral;