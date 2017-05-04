----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2017 07:18:51 PM
-- Design Name: 
-- Module Name: num4 - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity num4 is
    Port ( en : in STD_LOGIC;
           clk : in STD_LOGIC;
           number : out STD_LOGIC_VECTOR (3 downto 0));
end num4;

architecture Behavioral of num4 is

signal tmp: unsigned(3 downto 0) := "0000";

begin

   process (clk)
    begin
        if rising_edge(clk) then
          if (en='1') then
            tmp <= tmp + 1;           
          end if;
        end if;
    end process;

    number <= std_logic_vector(tmp);
    
end Behavioral;