----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.01.2023 18:04:36
-- Design Name: 
-- Module Name: encoder_on_board - encoder_on_board_arch
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

entity encoder_on_board is
     Port (
            input : in std_logic_vector (9 downto 0);
            output : out std_logic_vector (3 downto 0)
     );
end encoder_on_board;

architecture encoder_on_board_arch of encoder_on_board is

    component encoder is
        port (
            input : in std_logic_vector (9 downto 0);
            output : out std_logic_vector (3 downto 0)      
        );
    end component;
begin

    encoder0 : encoder
        port map (
            input(9 downto 0),
            output(3 downto 0)
        );

end encoder_on_board_arch;
