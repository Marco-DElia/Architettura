----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2023 16:32:24
-- Design Name: 
-- Module Name: MUX4-1 - MUX4-1
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

entity mux4_1 is
     Port (
            in_vec: in std_logic_vector (0 to 3);
            s: in std_logic_vector (1 downto 0);
            y: out std_logic
            );
end mux4_1;

architecture rtl of mux4_1 is

begin
        with s select
            y <= in_vec(0) when "00",
                 in_vec(1) when "01",
                 in_vec(2) when "10",
                 in_vec(3) when "11",
                 '-'  when others;

-- si è scelto il costrutto with perchè senza, nell'RTL Analysis
-- viene inferita un'architettura con dei multiplexer 2 a 1 connessi.

end rtl;
