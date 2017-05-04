----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2017 07:46:05 PM
-- Design Name: 
-- Module Name: input_circuit - Behavioral
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

entity input_circuit is
    Port ( sel : in STD_LOGIC;
           incr : in STD_LOGIC;
           number : out STD_LOGIC_VECTOR (15 downto 0));
end input_circuit;

architecture Behavioral of input_circuit is

signal enable : std_logic_vector(3 downto 0) := "1000"; 
signal num2_sel : std_logic_vector(1 downto 0) := "00";
signal num1 : std_logic_vector(3 downto 0) := "0000";
signal num2 : std_logic_vector(3 downto 0) := "0000";
signal num3 : std_logic_vector(3 downto 0) := "0000";
signal num4 : std_logic_vector(3 downto 0) := "0000";

begin

sel_num: entity WORK.num2 port map (clk => sel,
                                    number => num2_sel);

select_proc: process(num2_sel)
begin
    case num2_sel is
        when "00" => enable <= "1000";
        when "01" => enable <= "0100";
        when "10" => enable <= "0010";
        when "11" => enable <= "0001";
        when others => enable <= "0001";
    end case;
    
end process select_proc;

num1_map: entity WORK.num4 port map (en => enable(3),
                                 clk => incr,
                                 number => num1);

num2_map: entity WORK.num4 port map (en => enable(2),
                                 clk => incr,
                                 number => num2);

num3_map: entity WORK.num4 port map (en => enable(1),
                                 clk => incr,
                                 number => num3);

num4_map: entity WORK.num4 port map (en => enable(0),
                                 clk => incr,
                                 number => num4);

number <= num1 & num2 & num3 & num4;

end Behavioral;
