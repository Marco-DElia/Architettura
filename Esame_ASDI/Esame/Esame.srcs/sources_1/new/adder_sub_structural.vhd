----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2023 03:17:08 PM
-- Design Name: 
-- Module Name: adder_sub_structural - adder_sub_structural_v1
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

entity adder_sub_structural is
    Generic(
        size : positive := 8
    );
    Port (
        op1           : in std_logic_vector(size-1 downto 0);
        op2           : in std_logic_vector(size-1 downto 0);
        mode          : in std_logic; -- 0 for addition, 1 for subtraction
        result        : out std_logic_vector(size-1 downto 0);
        negative_flag : out std_logic;
        zero_flag     : out std_logic
    );
end adder_sub_structural;

architecture adder_sub_structural_v1 of adder_sub_structural is
    
    signal cout : std_logic_vector(size-1 downto 0);
    signal int_res : std_logic_vector(size-1 downto 0);
    signal zero_test : std_logic_vector(size-1 downto 0) := (others => '0');
    
    component full_adder is
        Port (
            x, y : in std_logic;
            cin  : in std_logic;
            s    : out std_logic;
            cout : out std_logic
        );
    end component;

begin
    
    f_h_0 : full_adder
        port map(
            op1(0),
            op2(0) xor mode,
            mode,
            int_res(0),
            cout(0)
        );
    
    full_adders : for I in 1 to size-1 generate
    
        f_h_i : full_adder
        port map(
            op1(i),
            op2(i) xor mode,
            cout(i-1),
            int_res(i),
            cout(i)
        );
    
    end generate;
    
    result <= int_res;
    negative_flag <= int_res(size-1);
    zero_flag     <= '1' when int_res = zero_test else '0';

end adder_sub_structural_v1;