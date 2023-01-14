----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.01.2023 12:53:12
-- Design Name: 
-- Module Name: mux16_1_tb - Behavioral
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

entity mux16_1_tb is
--  Port ( );
end mux16_1_tb;

architecture testbench of mux16_1_tb is

    component mux16_1
        port (
                in_vec : in std_logic_vector (0 to 15);
                s : in std_logic_vector (3 downto 0);
                y : out std_logic 
        );
    end component;


    -- Segnali di ingresso e uscita del multiplexer
    signal in_vec: std_logic_vector(0 to 15);
    signal s: std_logic_vector(3 downto 0);
    signal y: std_logic;

begin
    -- Istanza del multiplexer
    uut: mux16_1 port map(
        in_vec => in_vec,
        s => s,
        y => y
    );
    
    test_process : process
    begin
    
        wait for 100 ns;
        -- Test case 1: in_vec = "0000", s = "00"
        in_vec <= "0000000000000001";
        s <= "1111";
        wait for 10 ns;
        assert y = '1' report "Test case 1 failed";

        -- Test case 2: in_vec = "0010", s = "01"
        in_vec <= "1000000000000000";
        s <= "0000";
        wait for 10 ns;
        assert y = '1' report "Test case 2 failed";
    
        wait;
    end process;

end testbench;
