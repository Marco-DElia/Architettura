----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2023 11:23:49
-- Design Name: 
-- Module Name: FF - FF_arch
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

entity FF is
    Port (
        clk: in std_logic;
        data_in  : in std_logic;
        output   : out std_logic
    );
end FF;

architecture FF_arch of FF is

    signal state : std_logic := '0';

begin 
    process (clk)
    begin
        --if rising_edge (clk) then
        state <= data_in;
        --end if;
        output <= state;
    end process;


end FF_arch;
