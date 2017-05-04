----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2017 02:17:30 PM
-- Design Name: 
-- Module Name: final - Behavioral
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

entity final is
    Port ( clk : in STD_LOGIC;
           next_lvl : in STD_LOGIC;
           rst_mul : in STD_LOGIC;
           sel_mul : in STD_LOGIC;
           sel_x : in STD_LOGIC;
           incr_x : in STD_LOGIC;
           sel_y : in STD_LOGIC;
           incr_y : in STD_LOGIC;
           sel_display : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (7 downto 0));
end final;

architecture Behavioral of final is

signal x : std_logic_vector(15 downto 0) := (others => '0');
signal y : std_logic_vector(15 downto 0) := (others => '0');
signal result : std_logic_vector(31 downto 0) := (others => '0');
signal inputs : std_logic_vector(31 downto 0) := (others => '0');
signal data : std_logic_vector(31 downto 0) := (others => '0');
signal next_lvl_mpg : std_logic;
signal sel_x_mpg : std_logic;
signal incr_x_mpg : std_logic;
signal sel_y_mpg : std_logic;
signal incr_y_mpg : std_logic;

begin

mpg1: entity WORK.MPG port map (clk => clk,
                                btn => next_lvl,
                                en => next_lvl_mpg);

mpg2: entity WORK.MPG port map (clk => clk,
                                btn => sel_x,
                                en => sel_x_mpg);
                                
mpg3: entity WORK.MPG port map (clk => clk,
                                btn => incr_x,
                                en => incr_x_mpg);                              

mpg4: entity WORK.MPG port map (clk => clk,
                                btn => sel_y,
                                en => sel_y_mpg);

mpg5: entity WORK.MPG port map (clk => clk,
                                btn => incr_y,
                                en => incr_y_mpg);
                                      
mul: entity WORK.main port map (clk => next_lvl_mpg,
                                rst => rst_mul,
                                sel => sel_mul,
                                x => x,
                                y => y,
                                p => result);

op_x: entity WORK.input_circuit port map (sel => sel_x_mpg,
                                           incr => incr_x_mpg,
                                           number => x);

op_y: entity WORK.input_circuit port map (sel => sel_y_mpg,
                                          incr => incr_y_mpg,
                                          number => y);

inputs <= x & y;

data <= inputs WHEN sel_display ='1' ELSE
            result;


display: entity WORK.displ7seg port map(clk => clk,
                                        rst => rst_mul,
                                        data => data,
                                        an => an,
                                        seg => seg);

end Behavioral;
