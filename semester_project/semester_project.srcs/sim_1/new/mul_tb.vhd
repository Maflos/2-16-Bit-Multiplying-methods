----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2017 03:59:57 PM
-- Design Name: 
-- Module Name: mul_tb - Behavioral
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

entity mul_tb is
--  Port ( );
end mul_tb;

architecture Behavioral of mul_tb is

signal clk : STD_LOGIC;
signal x : STD_LOGIC_VECTOR (15 downto 0) := X"FFFF";
signal y : STD_LOGIC_VECTOR (15 downto 0) := X"FFFF";
signal p : STD_LOGIC_VECTOR (31 downto 0);
constant CLK_PERIOD : TIME := 10 ns;

begin

gen_clk: process
    begin
        Clk <= '0';
        wait for (CLK_PERIOD/2);
         Clk <= '1';
         wait for (CLK_PERIOD/2);
 end process gen_clk;

dut: entity WORK.mul16a port map(clk => clk,
                               x => x,
                               y => y,
                               p => p); 

test: process
begin
     
         wait for CLK_PERIOD;         
         x <= x"1111";
         y <= x"8001";      
         wait for CLK_PERIOD;
         x <= x"AAAA";
         y <= x"0001";                       
         wait for CLK_PERIOD;                                     
         wait for CLK_PERIOD;
         wait for CLK_PERIOD; 
         wait for CLK_PERIOD;               
         wait for CLK_PERIOD;                       
         wait for CLK_PERIOD;                                     
         wait for CLK_PERIOD;
         wait for CLK_PERIOD; 
         wait for CLK_PERIOD;               
         wait for CLK_PERIOD;                       
         wait for CLK_PERIOD;                                     
         wait for CLK_PERIOD;
         wait for CLK_PERIOD;
         wait for CLK_PERIOD;                       
         wait for CLK_PERIOD;                                     
         wait for CLK_PERIOD;
         wait for CLK_PERIOD;

   wait;               
end process test;

end Behavioral;
