----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.01.2023 13:35:02
-- Design Name: 
-- Module Name: cathods_manager - cathods_manager_arch
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

entity cathodes_manager is
      Port (
                value : in std_logic_vector (3 downto 0); -- valore da mostrare su tutte le 8 cifre del display
                dots  : in std_logic; -- punti se accesi o spenti
                cathodes : out std_logic_vector (7 downto 0) -- 7 segmenti + 1 dot
      );
end cathodes_manager;

architecture cathodes_manager_arch of cathodes_manager is

    -- segnale per gestire temporanemamente i 7 catodi
    signal seven_cathodes : std_logic_vector (6 downto 0);

    -- definisco costanti che rappresentano la cifra da scrivere in funzione di come sono disposti i cadoti
    -- il primo bit è per la barra orizzonate, dopo si va in senso antiorario a partire da in alto a sinistra
    constant zero   : std_logic_vector (6 downto 0) := "1000000";
    constant one    : std_logic_vector (6 downto 0) := "1111001";
    constant two    : std_logic_vector (6 downto 0) := "0100100";
    constant three  : std_logic_vector (6 downto 0) := "0110000"; 
    constant four   : std_logic_vector (6 downto 0) := "0011001"; 
    constant five   : std_logic_vector (6 downto 0) := "0010010"; 
    constant six    : std_logic_vector (6 downto 0) := "0000010"; 
    constant seven  : std_logic_vector (6 downto 0) := "1111000"; 
    constant eight  : std_logic_vector (6 downto 0) := "0000000"; 
    constant nine   : std_logic_vector (6 downto 0) := "0010000"; 
    constant a   	: std_logic_vector (6 downto 0) := "0001000"; 
    constant b      : std_logic_vector (6 downto 0) := "0000011"; 
    constant c      : std_logic_vector (6 downto 0) := "1000110"; 
    constant d      : std_logic_vector (6 downto 0) := "0100001"; 
    constant e      : std_logic_vector (6 downto 0) := "0000110"; 
    constant f      : std_logic_vector (6 downto 0) := "0001110";


begin

    with value select
        
            seven_cathodes <= zero   when "0000",
                             one    when "0001",
                             two    when "0010",
                             three  when "0011",
                             four   when "0100",
                             five   when "0101",
                             six    when "0110",
                             seven  when "0111",
                             eight  when "1000",
                             nine   when "1001",
                             a      when "1010",
                             b      when "1011",
                             c      when "1100",
                             d      when "1101",
                             e      when "1110",
                             f      when "1111",
                             zero   when others;
                             
    cathodes <= not(dots) & seven_cathodes;

end cathodes_manager_arch;
