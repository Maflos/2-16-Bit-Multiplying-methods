----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2017 01:54:17 PM
-- Design Name: 
-- Module Name: spt_tb - Behavioral
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

entity spt_tb is
--  Port ( );
end spt_tb;

architecture Behavioral of spt_tb is
signal a : STD_LOGIC_VECTOR (6 downto 0);
signal b : STD_LOGIC_VECTOR (6 downto 0);
signal sum : STD_LOGIC_VECTOR (7 downto 0);
begin

sum: entity WORK.spt(a => "1111110",
                     b => "0101010",
                     sum => sum);


end Behavioral;
