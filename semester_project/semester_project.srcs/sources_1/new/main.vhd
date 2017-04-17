----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2017 12:49:10 PM
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           sel : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           p : out STD_LOGIC_VECTOR (31 downto 0));
end main;

architecture Behavioral of main is

signal en1, en2 : std_logic := '0';
signal p1, p2 : std_logic_vector(31 downto 0) := (others => '0');

begin

--enable for the multipliers
en1 <= sel xor '1';
en2 <= sel and '1';

mul1: entity WORK.mul16a port map (clk => clk,
                                   rst => rst,
                                   en => en1,
                                   x => x,
                                   y => y,
                                   p => p1);

mul2: entity WORK.mul16b port map (clk => clk,
                                   rst => rst,
                                   en => en2,
                                   x => x,
                                   y => y,
                                   p => p2);

--choose result
mux: process(sel, p1, p2)
begin
    case sel is
        when '0' => p <= p1;
        when '1' => p <= p2;
        when others => p <= (others => '0');
    end case;
end process mux;

end Behavioral;
