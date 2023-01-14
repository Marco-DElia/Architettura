----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2023 18:31:19
-- Design Name: 
-- Module Name: shift_register_tb - shift_register_tb_arch
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

entity shift_register_tb is
--  Port ( );
end shift_register_tb;

architecture shift_register_tb_arch of shift_register_tb is

    signal clk, rst, data_in, sh_dir, do_shift, left_out, right_out : std_logic := '0';
    signal sh_qnt : std_logic_vector (1 downto 0);

    component shift_register is
    Port (
        clk, rst : in std_logic;
        data_in  : in std_logic; -- bit in ingresso allo shift register
        sh_dir   : in std_logic; -- direzione dello shitf
        sh_qnt   : in std_logic_vector (1 downto 0); -- numero di posizioni da shiftare
        do_shift : in std_logic; -- comando di shift
        left_out, right_out : out std_logic -- uscite dello shift register
    );
    end component;


begin

    sh: shift_register
        port map (
            clk,
            rst,
            data_in,
            sh_dir,
            sh_qnt,
            do_shift,
            left_out,
            right_out
        );

    process
    begin
        clk <= '1';
        wait for 5 ns;
        clk <= '0';
        wait for 5 ns;
    end process;
    
    tb : process
    begin
        wait for 100 ns;
        
        -- precaricare registri con "1111"
        -- aspetto "1111" nei registri
        data_in <= '1';
        sh_qnt  <= "11";
        sh_dir  <= '0';
        wait for 10 ns;
        do_shift <= '1';
        wait for 10 ns;
        do_shift <= '0';
        
        
        wait for 10 ns;
        
        
        -- inserire a sinistra (shiftare a destra) '0'
        -- aspetto "0111" nei registri
        data_in <= '0';
        sh_qnt  <= "00";
        sh_dir  <= '1';
        wait for 10 ns;
        do_shift <= '1';
        wait for 10 ns;
        do_shift <= '0';
        
        
        wait for 10 ns;
        
        -- inserire a sinistra (shiftare a destra) "111"
        -- aspetto "1110" nei registri
        data_in <= '1';
        sh_qnt  <= "10";
        sh_dir  <= '1';
        wait for 10 ns;
        do_shift <= '1';
        wait for 10 ns;
        do_shift <= '0';
        
        wait;
        
    end process;
end shift_register_tb_arch;
