----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2023 11:20:14
-- Design Name: 
-- Module Name: shift_unit - shift_unit_arch
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
use IEEE.math_real.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_unit is
    Generic (
        nbits_shift_quantity : integer := 3
    );
    Port (
        clk, rst    : in std_logic;
        input_left  : in std_logic_vector (0 to 2**nbits_shift_quantity - 1);
        input_right : in std_logic_vector (0 to 2**nbits_shift_quantity - 1);
        sh_dir      : in std_logic;
        sh_qnt      : in std_logic_vector (nbits_shift_quantity - 1 downto 0);
        do_shift    : in std_logic;
        output      : out std_logic
    );
end shift_unit;


architecture shift_unit_arch of shift_unit is
    
    signal sh_selection : std_logic_vector (nbits_shift_quantity downto 0) := (others => '0');
    signal input        : std_logic_vector (0 to 2**(nbits_shift_quantity + 1) - 1):= (others => '0');

begin
    sh_selection <= sh_dir & sh_qnt;
    input        <= input_left & input_right;

    process (clk)
    begin
        if rising_edge (clk) then
        
            if rst = '1' then
                output <= '0';
            else
                if do_shift = '1' then
                    output <= input(to_integer(unsigned(sh_selection)));
                end if;
            end if;
        end if;
    end process;

end shift_unit_arch;