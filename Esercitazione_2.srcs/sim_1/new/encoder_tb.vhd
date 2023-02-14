----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2023 11:04:41
-- Design Name: 
-- Module Name: encoder_tb - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity encoder_tb is
--  Port ( );
end encoder_tb;

architecture Behavioral of encoder_tb is

    signal input : std_logic_vector (9 downto 0);
    signal output : std_logic_vector (3 downto 0);
    
    component encoder is
    Port (
            input : in std_logic_vector (9 downto 0);
            output : out std_logic_vector (3 downto 0)
    );
    end component;

begin
    utt_enc : encoder Port map(
                input,
                output
        );
        
    tb: process
    begin
        wait for 100 ns;
        input <= "0000000001";
        
        for I in 1 to 10 loop
            
            wait for 10 ns;
            assert (unsigned(output) = I) report "error" severity FAILURE;
            input <= input (8 downto 0) & '0';
            
        end loop;
        
        wait;
    end process;


end Behavioral;
