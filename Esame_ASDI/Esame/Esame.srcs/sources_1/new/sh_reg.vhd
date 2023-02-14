----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/03/2023 01:02:12 AM
-- Design Name: 
-- Module Name: sh_reg - Behavioral
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

entity sh_reg is
    Generic(
        size : positive := 8
    );
    Port (
        clk, rst   : in std_logic;
        data_in    : in std_logic; -- serial input data
        l_data_out : out std_logic; -- leftmost data
        r_data_out : out std_logic; -- rightmost data
        p_data_in  : in std_logic_vector(size - 1 downto 0); -- parallel data input
        p_data_out : out std_logic_vector(size - 1 downto 0); -- parallel data out
        p_load     : in std_logic; -- load data from p_data_in
        sh_dir     : in std_logic; -- 0 for left, 1 for right
        do_shift   : in std_logic -- do shift at next clock cicle
    );
end sh_reg;

architecture Behavioral of sh_reg is

signal registers : std_logic_vector(size - 1 downto 0) := (others => '0');

begin

    p_data_out <= registers;
    l_data_out <= registers(size-1);
    r_data_out <= registers(0);
    
    process(clk)
    begin
    
        if(rising_edge(clk)) then
        
            if(rst = '1') then
                registers <= (others => '0');
            else
                
                if(p_load = '1') then
                    registers <= p_data_in;
                elsif(do_shift = '1') then
                    
                    case sh_dir is
                    
                        -- shift to the left
                        when '0' => registers <= registers(size - 2 downto 0) & data_in;
                        
                        -- shift to the right
                        when '1' => registers <= data_in & registers(size - 1 downto 1);
                        
                        when others =>
                    end case;
                    
                end if;
            end if;
        
        end if;
    
    end process;




end Behavioral;