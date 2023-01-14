----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2023 15:49:43
-- Design Name: 
-- Module Name: prova_to_downto - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity prova_to_downto is
    Port (
        s1   : in std_logic_vector (0 to 3);
        s2   : in std_logic_vector (3 downto 0);
        sel  : in std_logic_vector (1 downto 0);
        output1 : out std_logic;
        output2 : out std_logic
    );
end prova_to_downto;

architecture Behavioral of prova_to_downto is

    --signal s : std_logic_vector (0 to 7);
    
begin
    
    output1 <=  s1(to_integer(unsigned(sel)));
    output2 <=  s2(to_integer(unsigned(sel)));
    
end Behavioral;
