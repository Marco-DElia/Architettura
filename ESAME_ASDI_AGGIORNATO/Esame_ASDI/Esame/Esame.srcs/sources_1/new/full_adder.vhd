
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2023 03:20:32 PM
-- Design Name: 
-- Module Name: full_adder - full_adder_v1
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

entity full_adder is
    Port (
        x, y : in std_logic;
        cin  : in std_logic;
        s    : out std_logic;
        cout : out std_logic
    );
end full_adder;

architecture full_adder_v1 of full_adder is

begin
    
    s    <= x xor y xor cin;
    cout <= (x and y) or (cin and (x xor y));

end full_adder_v1;