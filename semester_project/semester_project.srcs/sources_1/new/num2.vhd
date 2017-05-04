----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2017 07:47:11 PM
-- Design Name: 
-- Module Name: num2 - Behavioral
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

entity num2 is
    Port ( clk : in STD_LOGIC;
           number : out STD_LOGIC_VECTOR (1 downto 0));
end num2;

architecture Behavioral of num2 is
signal tmp: unsigned(1 downto 0) := "00";
begin

   process (clk)
    begin
        if rising_edge(clk) then
            tmp <= tmp + 1;           
        end if;
    end process;
    
    number <= std_logic_vector(tmp);
    
end Behavioral;
