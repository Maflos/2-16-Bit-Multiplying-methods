----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2017 08:19:47 PM
-- Design Name: 
-- Module Name: mul16a - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mul16a is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           p : out STD_LOGIC_VECTOR (31 downto 0));
end mul16a;

architecture Behavioral of mul16a is

signal reg1: std_logic_vector(31 downto 0) := (others => '0');
signal reg2: std_logic_vector(67 downto 0) := (others => '0');
signal reg3: std_logic_vector(69 downto 0) := (others => '0');
signal reg4: std_logic_vector(71 downto 0) := (others => '0');
signal reg5: std_logic_vector(73 downto 0) := (others => '0');
signal reg6: std_logic_vector(75 downto 0) := (others => '0');
signal reg7: std_logic_vector(77 downto 0) := (others => '0');
signal reg8: std_logic_vector(79 downto 0) := (others => '0');
signal reg9: std_logic_vector(81 downto 0) := (others => '0');
signal reg10: std_logic_vector(83 downto 0) := (others => '0');
signal reg11: std_logic_vector(85 downto 0) := (others => '0');
signal reg12: std_logic_vector(87 downto 0) := (others => '0');
signal reg13: std_logic_vector(89 downto 0) := (others => '0');
signal reg14: std_logic_vector(91 downto 0) := (others => '0');

signal input: std_logic_vector(1028 downto 0) := (others => '0');
signal output: std_logic_vector(1101 downto 0) := (others => '0');
signal final_s, final_t: std_logic_vector(30 downto 0) := (others => '0');

begin

clk_write: process(clk)
begin
if en = '1' then
    if rising_edge(clk) then
        if rst = '1' then
            reg1(31 downto 0) <= (others => '0');  
            reg2(67 downto 0) <= (others => '0');
            reg3(69 downto 0) <= (others => '0');
            reg4(71 downto 0) <= (others => '0'); 
            reg5(73 downto 0) <= (others => '0');
            reg6(75 downto 0) <= (others => '0');
            reg7(77 downto 0) <= (others => '0');
            reg8(79 downto 0) <= (others => '0');
            reg9(81 downto 0) <= (others => '0');
            reg10(83 downto 0) <= (others => '0');
            reg11(85 downto 0) <= (others => '0');
            reg12(87 downto 0) <= (others => '0');
            reg13(89 downto 0) <= (others => '0');
            reg14(91 downto 0) <= (others => '0');
        else
            reg1(15 downto 0) <= y;
            reg1(31 downto 16) <= x;  
            reg2(67 downto 0) <= output(67 downto 0);
            reg3(69 downto 0) <= output(137 downto 68);   
            reg4(71 downto 0) <= output(209 downto 138);
            reg5(73 downto 0) <= output(283 downto 210);
            reg6(75 downto 0) <= output(359 downto 284);
            reg7(77 downto 0) <= output(437 downto 360);
            reg8(79 downto 0) <= output(517 downto 438);
            reg9(81 downto 0) <= output(599 downto 518);
            reg10(83 downto 0) <= output(683 downto 600);
            reg11(85 downto 0) <= output(769 downto 684);
            reg12(87 downto 0) <= output(857 downto 770);
            reg13(89 downto 0) <= output(947 downto 858);
            reg14(91 downto 0) <= output(1039 downto 948);
        end if;
     end if;
end if;
end process clk_write;

--input propagation
output(31 downto 0) <= reg1(31 downto 0);
output(99 downto 68) <= reg2(31 downto 0);
output(169 downto 138) <= reg3(31 downto 0);
output(241 downto 210) <= reg4(31 downto 0);
output(315 downto 284) <= reg5(31 downto 0);
output(391 downto 360) <= reg6(31 downto 0);
output(469 downto 438) <= reg7(31 downto 0);
output(549 downto 518) <= reg8(31 downto 0);
output(631 downto 600) <= reg9(31 downto 0);
output(715 downto 684) <= reg10(31 downto 0);
output(801 downto 770) <= reg11(31 downto 0);
output(889 downto 858) <= reg12(31 downto 0);
output(979 downto 948) <= reg13(31 downto 0);

--upper level sums
input(109 - 19 downto (54 + 19)) <= reg2(67 - 18 downto 32);
input(169 - 20 downto (111 + 20)) <= reg3(69 - 19 downto 32);
input(232 - 21 downto (171 + 21)) <= reg4(71 - 20 downto 32);
input(298 - 22 downto (234 + 22)) <= reg5(73 - 21 downto 32);
input(367 - 23 downto (300 + 23)) <= reg6(75 - 22 downto 32);
input(439 - 24 downto (369 + 24)) <= reg7(77 - 23 downto 32);
input(514 - 25 downto (441 + 25)) <= reg8(79 - 24 downto 32);
input(592 - 26 downto (516 + 26)) <= reg9(81 - 25 downto 32);
input(673 - 27 downto (594 + 27)) <= reg10(83 - 26 downto 32);
input(757 - 28 downto (675 + 28)) <= reg11(85 - 27 downto 32);
input(844 - 29 downto (759 + 29)) <= reg12(87 - 28 downto 32);
input(934 - 30 downto (846 + 30)) <= reg13(89 - 29 downto 32);
input(1027 - 31 downto (936 + 31)) <= reg14(91 - 30 downto 32);

--upper level transports
input(110 downto (54 + 19 + 19)) <= reg2(67 downto 18 + 32) & '0';
input(170 downto (111 + 20 + 20)) <= reg3(69 downto 19 + 32) & '0';
input(233 downto (171 + 21 + 21)) <= reg4(71 downto 20 + 32) & '0';
input(299 downto (234 + 22 + 22)) <= reg5(73 downto 21 + 32) & '0';
input(368 downto (300 + 23 + 23)) <= reg6(75 downto 22 + 32) & '0';
input(440 downto (369 + 24 + 24)) <= reg7(77 downto 23 + 32) & '0';
input(515 downto (441 + 25 + 25)) <= reg8(79 downto 24 + 32) & '0';
input(593 downto (516 + 26 + 26)) <= reg9(81 downto 25 + 32) & '0';
input(674 downto (594 + 27 + 27)) <= reg10(83 downto 26 + 32) & '0';
input(758 downto (675 + 28 + 28)) <= reg11(85 downto 27 + 32) & '0';
input(845 downto (759 + 29 + 29)) <= reg12(87 downto 28 + 32) & '0';
input(935 downto (846 + 30 + 30)) <= reg13(89 downto 29 + 32) & '0';
input(1028 downto (936 + 31 + 31)) <= reg14(91 downto 30 + 32) & '0';

ands: for i in 0 to 15 generate
begin
    input(i) <= reg1(0) and reg1(i + 16);
    input(i + 18 + 1) <= reg1(1) and reg1(i + 16);
    input(i + 36 + 2) <= reg1(2) and reg1(i + 16);
      
    input(i + 54 + 3) <= reg2(3) and reg2(i + 16);
    input(i + 111 + 4) <= reg3(4) and reg3(i + 16);
    input(i + 171 + 5) <= reg4(5) and reg4(i + 16);
    input(i + 234 + 6) <= reg5(6) and reg5(i + 16);
    input(i + 300 + 7) <= reg6(7) and reg6(i + 16);
    input(i + 369 + 8) <= reg7(8) and reg7(i + 16);
    input(i + 441 + 9) <= reg8(9) and reg8(i + 16);
    input(i + 516 + 10) <= reg9(10) and reg9(i + 16);
    input(i + 594 + 11) <= reg10(11) and reg10(i + 16);
    input(i + 675 + 12) <= reg11(12) and reg11(i + 16);
    input(i + 759 + 13) <= reg12(13) and reg12(i + 16);
    input(i + 846 + 14) <= reg13(14) and reg13(i + 16);
    input(i + 936 + 15) <= reg14(15) and reg14(i + 16); 
end generate ands;

lvl1: for i in 0 to 17 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(i),
                                       y => input(18 + i),
                                       tin => input(36 + i), 
                                       s => output(i + 32),
                                       tout => output(i + 18 + 32));  
end generate lvl1; 

lvl2: for i in 0 to 18 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(54 + i),
                                       y => input(54 + 19 + i),
                                       tin => input(54 + 2 * 19 + i), 
                                       s => output(i + 68 + 32),
                                       tout => output(i + 19 + 68 + 32));  
end generate lvl2; 

lvl3: for i in 0 to 19 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(111 + i),
                                       y => input(111 + 20 + i),
                                       tin => input(111 + 2 * 20 + i), 
                                       s => output(i + 138 + 32),
                                       tout => output(i + 20 + 138 + 32));  
end generate lvl3; 

lvl4: for i in 0 to 20 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(171 + i),
                                       y => input(171 + 21 + i),
                                       tin => input(171 + 2 * 21 + i), 
                                       s => output(i + 210 + 32),
                                       tout => output(i + 21 + 210 + 32));  
end generate lvl4; 

lvl5: for i in 0 to 21 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(234 + i),
                                       y => input(234 + 22 + i),
                                       tin => input(234 + 2 * 22 + i), 
                                       s => output(i + 284 + 32),
                                       tout => output(i + 22 + 284 + 32));  
end generate lvl5; 

lvl6: for i in 0 to 22 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(300 + i),
                                       y => input(300 + 23 + i),
                                       tin => input(300 + 2 * 23 + i), 
                                       s => output(i + 360 + 32),
                                       tout => output(i + 23 + 360 + 32));  
end generate lvl6; 

lvl7: for i in 0 to 23 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(369 + i),
                                       y => input(369 + 24 + i),
                                       tin => input(369 + 2 * 24 + i), 
                                       s => output(i + 438 + 32),
                                       tout => output(i + 24 + 438 + 32));  
end generate lvl7;
 
lvl8: for i in 0 to 24 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(441 + i),
                                       y => input(441 + 25 + i),
                                       tin => input(441 + 2 * 25 + i), 
                                       s => output(i + 518 + 32),
                                       tout => output(i + 25 + 518 + 32));  
end generate lvl8; 

lvl9: for i in 0 to 25 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(516 + i),
                                       y => input(516 + 26 + i),
                                       tin => input(516 + 2 * 26 + i), 
                                       s => output(i + 600 + 32),
                                       tout => output(i + 26 + 600 + 32));  
end generate lvl9; 

lvl10: for i in 0 to 26 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(594 + i),
                                       y => input(594 + 27 + i),
                                       tin => input(594 + 2 * 27 + i), 
                                       s => output(i + 684 + 32),
                                       tout => output(i + 27 + 684 + 32));  
end generate lvl10;
 
lvl11: for i in 0 to 27 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(675 + i),
                                       y => input(675 + 28 + i),
                                       tin => input(675 + 2 * 28 + i), 
                                       s => output(i + 770 + 32),
                                       tout => output(i + 28 + 770 + 32));  
end generate lvl11;
 
lvl12: for i in 0 to 28 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(759 + i),
                                       y => input(759 + 29 + i),
                                       tin => input(759 + 2 * 29 + i), 
                                       s => output(i + 858 + 32),
                                       tout => output(i + 29 + 858 + 32));  
end generate lvl12; 

lvl13: for i in 0 to 29 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(846 + i),
                                       y => input(846 + 30 + i),
                                       tin => input(846 + 2 * 30 + i), 
                                       s => output(i + 948 + 32),
                                       tout => output(i + 30 + 948 + 32));  
end generate lvl13;
 
lvl14: for i in 0 to 30 generate
begin 
   comp: entity WORK.sum_elem port map(x => input(936 + i),
                                       y => input(936 + 31 + i),
                                       tin => input(936 + 2 * 31 + i), 
                                       s => output(i + 1040),
                                       tout => output(i + 31 + 1040));  
end generate lvl14; 

final_s <= output(1070 downto 1040);
final_t <= output(1100 downto 1071) & '0';

spt: entity WORK.spt15 port map (a => final_s,
                                 b => final_t,
                                 sum => p);

end Behavioral;