----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.01.2023 12:25:05
-- Design Name: 
-- Module Name: mux16_1 - architectural
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

entity mux16_1 is
  Port (
        in_vec: in std_logic_vector (0 to 15);
        s : in std_logic_vector (3 downto 0);
        y : out std_logic
  );
end mux16_1;

architecture structural of mux16_1 is

    signal sig: std_logic_vector (0 to 3);
    
    component mux4_1
        port (
            in_vec : in std_logic_vector (0 to 3);
            s : in std_logic_vector (1 downto 0);
            y : out std_logic 
        );
    end component;
    
begin
    
    mux0to3 : for i in 0 to 3 generate 
    
        m : mux4_1
        port map (
                    in_vec(i*4 to i*4 + 3),
                    s(1 downto 0),
                    sig(i)
        );
    end generate;
    
    m_out : mux4_1
        port map (
                    sig,
                    s(3 downto 2),
                    y
        );

end structural;
