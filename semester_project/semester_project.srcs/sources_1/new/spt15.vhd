----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2017 09:44:53 PM
-- Design Name: 
-- Module Name: spt15 - Behavioral
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

entity spt15 is
    Port ( a : in STD_LOGIC_VECTOR (30 downto 0);
           b : in STD_LOGIC_VECTOR (30 downto 0);
           sum : out STD_LOGIC_VECTOR (31 downto 0));
end spt15;

architecture Behavioral of spt15 is

signal t_out: std_logic_vector(31 downto 0):= (others => '0');

begin

first: entity WORK.sum_elem port map(x => a(0),
                                     y => b(0),
                                     tin => t_out(0),
                                     s => sum(0),
                                     tout => t_out(1));

sum1: for i in 0 to 30 generate 
begin
    next1: entity WORK.sum_elem port map(x => a(i),
                                     y => b(i),
                                     tin => t_out(i),
                                     s => sum(i),
                                     tout => t_out(i + 1));
end generate;

sum(31) <= t_out(31);

end Behavioral;
