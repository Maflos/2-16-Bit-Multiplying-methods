----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2017 02:18:38 PM
-- Design Name: 
-- Module Name: mul16b - Behavioral
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

entity mul16b is
    Port (clk : in STD_LOGIC;
          rst : in STD_LOGIC;
          en: in STD_LOGIC;
          x : in STD_LOGIC_VECTOR (15 downto 0);
          y : in STD_LOGIC_VECTOR (15 downto 0);
          p : out STD_LOGIC_VECTOR (31 downto 0));
end mul16b;

architecture Behavioral of mul16b is

signal reg1 : std_logic_vector(31 + 1 downto 0) := (others => '0');
signal reg2 : std_logic_vector(47 + 2 downto 0) := (others => '0');
signal reg3 : std_logic_vector(47 + 3 downto 0) := (others => '0');
signal reg4 : std_logic_vector(47 + 4 downto 0) := (others => '0');
signal reg5 : std_logic_vector(47 + 5 downto 0) := (others => '0');
signal reg6 : std_logic_vector(47 + 6 downto 0) := (others => '0');
signal reg7 : std_logic_vector(47 + 7 downto 0) := (others => '0');
signal reg8 : std_logic_vector(47 + 8 downto 0) := (others => '0');
signal reg9 : std_logic_vector(47 + 9 downto 0) := (others => '0');
signal reg10 : std_logic_vector(47 + 10 downto 0) := (others => '0');
signal reg11 : std_logic_vector(47 + 11 downto 0) := (others => '0');
signal reg12 : std_logic_vector(47 + 12 downto 0) := (others => '0');
signal reg13 : std_logic_vector(47 + 13 downto 0) := (others => '0');
signal reg14 : std_logic_vector(47 + 14 downto 0) := (others => '0');
signal reg15 : std_logic_vector(47 + 15 downto 0) := (others => '0');

signal input : std_logic_vector(479 downto 0) := (others => '0');
signal output : std_logic_vector(790 + 32 downto 0) := (others => '0');
signal trans : std_logic_vector(254 downto 0) := (others => '0');
signal propag: std_logic_vector(100 downto 0) := (others => '0');
signal sumt : std_logic_vector(255 downto 0) := (others => '0');

begin

clk_proc: process(clk)
begin

if en = '1' then 
    if rising_edge(clk) then
           if rst = '1' then
                reg1(32 downto 0) <= (others => '0'); 
                reg2(49 downto 0) <= (others => '0');
                reg3(50 downto 0) <= (others => '0');
                reg4(51 downto 0) <= (others => '0');
                reg5(52 downto 0) <= (others => '0');
                reg6(53 downto 0) <= (others => '0');
                reg7(54 downto 0) <= (others => '0');
                reg8(55 downto 0) <= (others => '0');
                reg9(56 downto 0) <= (others => '0');
                reg10(57 downto 0) <= (others => '0');
                reg11(58 downto 0) <= (others => '0');
                reg12(59 downto 0) <= (others => '0');
                reg13(60 downto 0) <= (others => '0');
                reg14(61 downto 0) <= (others => '0');
                reg15(62 downto 0) <= (others => '0');                                                     
            else          
                reg1(15 downto 0) <= y;
                reg1(31 downto 16) <= x;
                reg1(32) <= x(0) and y(0); 
                reg2(49 downto 0) <= output(49 downto 0);
                reg3(50 downto 0) <= output(100 downto 50);
                reg4(51 downto 0) <= output(152 downto 101);
                reg5(52 downto 0) <= output(205 downto 153);
                reg6(53 downto 0) <= output(259 downto 206);
                reg7(54 downto 0) <= output(314 downto 260);
                reg8(55 downto 0) <= output(370 downto 315);
                reg9(56 downto 0) <= output(427 downto 371);
                reg10(57 downto 0) <= output(485 downto 428);
                reg11(58 downto 0) <= output(544 downto 486);
                reg12(59 downto 0) <= output(604 downto 545);
                reg13(60 downto 0) <= output(665 downto 605);
                reg14(61 downto 0) <= output(727 downto 666);
                reg15(62 downto 0) <= output(790 downto 728);
           end if;
        end if;
end if;
end process clk_proc;

--upper level sums + that carry from the upper level
input(16 * 4 - 1 downto 16 * 3) <= reg2(49 downto 34);
input(16 * 6 - 1 downto 16 * 5) <= reg3(50 downto 35);
input(16 * 8 - 1 downto 16 * 7) <= reg4(51 downto 36);
input(16 * 10 - 1 downto 16 * 9) <= reg5(52 downto 37);
input(16 * 12 - 1 downto 16 * 11) <= reg6(53 downto 38);
input(16 * 14 - 1 downto 16 * 13) <= reg7(54 downto 39);
input(16 * 16 - 1 downto 16 * 15) <= reg8(55 downto 40);
input(16 * 18 - 1 downto 16 * 17) <= reg9(56 downto 41);
input(16 * 20 - 1 downto 16 * 19) <= reg10(57 downto 42);
input(16 * 22 - 1 downto 16 * 21) <= reg11(58 downto 43);
input(16 * 24 - 1 downto 16 * 23) <= reg12(59 downto 44);
input(16 * 26 - 1 downto 16 * 25) <= reg13(60  downto 45);
input(16 * 28 - 1 downto 16 * 27) <= reg14(61 downto 46);
input(16 * 30 - 1 downto 16 * 29) <= reg15(62  downto 47);
              
--input propagation
output(31 + 1 downto 0) <= reg1(31 + 1 downto 0);
output(81 + 2 downto 50) <= reg2(31 + 2 downto 0);
output(132 + 3 downto 101) <= reg3(31 + 3 downto 0);
output(184 + 4 downto 153) <= reg4(31 + 4 downto 0);
output(237 + 5 downto 206) <= reg5(31 + 5 downto 0);
output(291 + 6 downto 260) <= reg6(31 + 6 downto 0);
output(346 + 7 downto 315) <= reg7(31 + 7 downto 0);
output(402 + 8 downto 371) <= reg8(31 + 8 downto 0);
output(459 + 9 downto 428) <= reg9(31 + 9 downto 0);
output(517 + 10 downto 486) <= reg10(31 + 10 downto 0);
output(576 + 11 downto 545) <= reg11(31 + 11 downto 0);
output(636 + 12 downto 605) <= reg12(31 + 12 downto 0);
output(697 + 13 downto 666) <= reg13(31 + 13 downto 0);
output(759 + 14 downto 728) <= reg14(31 + 14 downto 0);
output(805 downto 791) <= reg15(32 + 14 downto 32);

--partial sums
output(48 downto 33) <= sumt(15 downto 0);
output(99 downto 84) <= sumt(16 * 3 - 1 downto 16 * 2);
output(151 downto 136) <= sumt(16 * 4 - 1 downto 16 * 3);
output(204 downto 189) <= sumt(16 * 5 - 1 downto 16 * 4);
output(258 downto 243) <= sumt(16 * 6 - 1 downto 16 * 5);
output(313 downto 298) <= sumt(16 * 7 - 1 downto 16 * 6);
output(369 downto 354) <= sumt(16 * 8 - 1 downto 16 * 7);
output(426 downto 411) <= sumt(16 * 9 - 1 downto 16 * 8);
output(484 downto 469) <= sumt(16 * 10 - 1 downto 16 * 9);
output(543 downto 528) <= sumt(16 * 11 - 1 downto 16 * 10);
output(603 downto 588) <= sumt(16 * 12 - 1 downto 16 * 11);
output(664 downto 649) <= sumt(16 * 13 - 1 downto 16 * 12);
output(726 downto 711) <= sumt(16 * 14 - 1 downto 16 * 13);
output(789 downto 774) <= sumt(16 * 15 - 1 downto 16 * 14);
output(821 downto 806) <= sumt(16 * 16 - 1 downto 16 * 15);

--the transport from the upper level
output(49) <= trans(16);
output(100) <= trans(17 * 2 - 1);
output(152) <= trans(17 * 3 - 1);
output(205) <= trans(17 * 4 - 1);
output(259) <= trans(17 * 5 - 1);
output(314) <= trans(17 * 6 - 1);
output(370) <= trans(17 * 7 - 1);
output(427) <= trans(17 * 8 - 1);
output(485) <= trans(17 * 9 - 1);
output(544) <= trans(17 * 10 - 1);
output(604) <= trans(17 * 11 - 1);
output(665) <= trans(17 * 12 - 1);
output(727) <= trans(17 * 13 - 1);
output(790) <= trans(17 * 14 - 1);
output(822) <= trans(17 * 15 - 1);

fist_level: for i in 0 to 14 generate
begin
    input(i + 16) <= reg1(0) and reg1(i + 17);
    input(i) <= reg1(1) and reg1(i + 17);
end generate;

input(15) <= reg1(1) and reg1(31);

ands: for i in 0 to 15 generate
begin
    input(i + 2 * 16) <= reg2(2) and reg1(i + 16);
    input(i + 4 * 16) <= reg3(3) and reg1(i + 16);
    input(i + 6 * 16) <= reg4(4) and reg1(i + 16);
    input(i + 8 * 16) <= reg5(5) and reg1(i + 16);
    input(i + 10 * 16) <= reg6(6) and reg1(i + 16);
    input(i + 12 * 16) <= reg7(7) and reg1(i + 16);
    input(i + 14 * 16) <= reg8(8) and reg1(i + 16);
    input(i + 16 * 16) <= reg9(9) and reg1(i + 16);
    input(i + 18 * 16) <= reg10(10) and reg1(i + 16);
    input(i + 20 * 16) <= reg11(11) and reg1(i + 16);
    input(i + 22 * 16) <= reg12(12) and reg1(i + 16);
    input(i + 24 * 16) <= reg13(13) and reg1(i + 16);
    input(i + 26 * 16) <= reg14(14) and reg1(i + 16);
    input(i + 28 * 16) <= reg15(15) and reg1(i + 16);
    
end generate ands;

lvl1: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i),
                                        y => input(i + 16),
                                        tin => trans(i),
                                        s => sumt(i),
                                        tout => trans(i + 1));                                       
end generate;

lvl2: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 2),
                                        y => input(i + 16 * 2 + 16),
                                        tin => trans(i + 17),
                                        s => sumt(i + 16 * 2),
                                        tout => trans(i + 17 + 1));
end generate;

lvl3: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 4),
                                        y => input(i + 16 * 4 + 16),
                                        tin => trans(i + 17 * 2),
                                        s => sumt(i + 16 * 3),
                                        tout => trans(i + 17 * 2 + 1));
end generate;

lvl4: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 6),
                                        y => input(i + 16 * 6 + 16),
                                        tin => trans(i + 17 * 3),
                                        s => sumt(i + 16 * 4),
                                        tout => trans(i + 17 * 3 + 1));
end generate;

lvl5: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 8),
                                        y => input(i + 16 * 8 + 16),
                                        tin => trans(i + 17 * 4),
                                        s => sumt(i + 16 * 5),
                                        tout => trans(i + 17 * 4 + 1));
end generate;

lvl6: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 10),
                                        y => input(i + 16 * 10 + 16),
                                        tin => trans(i + 17 * 5),
                                        s => sumt(i + 16 * 6),
                                        tout => trans(i + 17 * 5 + 1));
end generate;

lvl7: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 12),
                                        y => input(i + 16 * 12 + 16),
                                        tin => trans(i + 17 * 6),
                                        s => sumt(i + 16 * 7),
                                        tout => trans(i + 17 * 6 + 1));
end generate;

lvl8: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 14),
                                        y => input(i + 16 * 14 + 16),
                                        tin => trans(i + 17 * 7),
                                        s => sumt(i + 16 * 8),
                                        tout => trans(i + 17 * 7 + 1));
end generate;

lvl9: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 16),
                                        y => input(i + 16 * 16 + 16),
                                        tin => trans(i + 17 * 8),
                                        s => sumt(i + 16 * 9),
                                        tout => trans(i + 17 * 8 + 1));
end generate;

lvl10: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 18),
                                        y => input(i + 16 * 18 + 16),
                                        tin => trans(i + 17 * 9),
                                        s => sumt(i + 16 * 10),
                                        tout => trans(i + 17 * 9 + 1));
end generate;

lvl11: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 20),
                                        y => input(i + 16 * 20 + 16),
                                        tin => trans(i + 17 * 10),
                                        s => sumt(i + 16 * 11),
                                        tout => trans(i + 17 * 10 + 1));
end generate;

lvl12: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 22),
                                        y => input(i + 16 * 22 + 16),
                                        tin => trans(i + 17 * 11),
                                        s => sumt(i + 16 * 12),
                                        tout => trans(i + 17 * 11 + 1));
end generate;

lvl13: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 24),
                                        y => input(i + 16 * 24 + 16),
                                        tin => trans(i + 17 * 12),
                                        s => sumt(i + 16 * 13),
                                        tout => trans(i + 17 * 12 + 1));
end generate;

lvl14: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 26),
                                        y => input(i + 16 * 26 + 16),
                                        tin => trans(i + 17 * 13),
                                        s => sumt(i + 16 * 14),
                                        tout => trans(i + 17 * 13 + 1));
end generate;

lvl15: for i in 0 to 15 generate
begin
    sum: entity WORK.sum_elem port map (x => input(i + 16 * 28),
                                        y => input(i + 16 * 28 + 16),
                                        tin => trans(i + 17 * 14),
                                        s => sumt(i + 16 * 15),
                                        tout => trans(i + 17 * 14 + 1));
end generate;

p(14 downto 0) <= output(805 downto 791);
p(30 downto 15) <= output(821 downto 806);
p(31) <= output(822);

end Behavioral;
