----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2023 15:33:06
-- Design Name: 
-- Module Name: prova_tb - Behavioral
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

entity prova_tb is
--  Port ( );
end prova_tb;

architecture Behavioral of prova_tb is

    signal s1   : std_logic_vector (0 to 3) := "0111";
    signal s2   : std_logic_vector (3 downto 0) := "0111";
    signal s1_0 : std_logic := s1(0);
    signal s2_0 : std_logic := s2(0);
begin

    process
    begin
        wait;
    end process;
end Behavioral;
