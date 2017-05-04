----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2016 01:33:20 PM
-- Design Name: 
-- Module Name: mpg - Behavioral
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
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MPG is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           en : out STD_LOGIC);
end MPG;

architecture Behavioral of mpg is
    signal count: std_logic_vector(15 downto 0);
    signal Q1,Q2,Q3: std_logic;
    begin
        en<=Q2 and (not Q3);

       process (clk)
       begin
           if rising_edge(clk) then
                count<=count+1;
           end if;
       end process;

       process(clk)
       begin
           if rising_edge(clk) then
               if count=X"FFFF" then
                   Q1<=btn;
               end if;
           end if;
       end process;

      process(clk)
      begin
          if rising_edge(clk)then
             Q2<=Q1;
          end if;
      end process;

      process(clk)
      begin
         if rising_edge(clk)then
              Q3<=Q2;
         end if;
      end process;
end Behavioral;
