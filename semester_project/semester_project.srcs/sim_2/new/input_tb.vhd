
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity input_tb is
--  Port ( );
end input_tb;

architecture Behavioral of input_tb is

signal sel : STD_LOGIC := '0';
signal clk: STD_LOGIC;
signal number : STD_LOGIC_VECTOR (15 downto 0);
constant CLK_PERIOD : TIME := 10 ns;

begin

gen_clk: process
    begin
        Clk <= '0';
        wait for (CLK_PERIOD/2);
         Clk <= '1';
         wait for (CLK_PERIOD/2);
 end process gen_clk;

dut: entity WORK.input_circuit port map(sel => sel,
                                        incr => clk,
                                        number => number);

test: process
begin
     
        wait for CLK_PERIOD;             
         wait for CLK_PERIOD;             
         wait for CLK_PERIOD;
         sel <= '1';
         wait for CLK_PERIOD;
         sel <= '0';
         wait for CLK_PERIOD;
         wait for CLK_PERIOD;
         sel <= '1';
         wait for CLK_PERIOD;
         sel <= '0';
         wait for CLK_PERIOD;
         wait for CLK_PERIOD;
         sel <= '1';
         wait for CLK_PERIOD;
         sel <= '0';  
          wait for CLK_PERIOD;
                 wait for CLK_PERIOD;
                 sel <= '1';
                 wait for CLK_PERIOD;
                 sel <= '0';
                
   wait;               
end process test;

end Behavioral;
