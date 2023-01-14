----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2023 13:05:54
-- Design Name: 
-- Module Name: shift_unit_tb - shift_unit_tb_arch
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_unit_tb is
--  Port ( );
end shift_unit_tb;

architecture shift_unit_tb_arch of shift_unit_tb is

    constant nbits_shift_quantity : integer := 3;

component shift_unit is
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
end component;

    signal clk, rst, sh_dir, do_shift, output : std_logic := '0';
    signal input_left, input_right : std_logic_vector (0 to 2**nbits_shift_quantity - 1);
    signal sh_qnt : std_logic_vector (nbits_shift_quantity - 1 downto 0);

begin

    sh : shift_unit
        generic map (
            nbits_shift_quantity
        )
        port map (
            clk,
            rst,
            input_left,
            input_right,
            sh_dir,
            sh_qnt,
            do_shift,
            output
        );

    process
    begin
        clk <= '1';
        wait for 5 ns;
        clk <= '0';
        wait for 5 ns;
    end process;
    
    process
    begin
        wait for 100 ns;
        input_left  <= "01010101";
        input_right <= "01010101";
        sh_dir <= '0'; -- seleziono left
        sh_qnt <= "000";
        
        wait for 10 ns;
        
        do_shift <= '1';
        wait for 10 ns;
        do_shift <= '0';
      
        for j in 0 to 1 loop
            
            sh_qnt <= "000";
            
            wait for 10 ns;
            
            do_shift <= '1';
            wait for 10 ns;
            do_shift <= '0';
            
            for i in 1 to 7 loop
            
                sh_qnt <= std_logic_vector(unsigned(sh_qnt) + 1);
                wait for 10 ns;
                
                do_shift <= '1';
                wait for 10 ns;
                do_shift <= '0';
         
            end loop;
            sh_dir <= '1';
        end loop;
        
        --wait for 10 ns;
        
        --sh_dir <= '1'; -- seleziono right
        --sh_qnt <= "111";
        --wait for 10 ns;
        
        --do_shift <= '1';
        --wait for 10 ns;
        --do_shift <= '0';
        
        wait;
    end process;

end shift_unit_tb_arch;
