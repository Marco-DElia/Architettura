----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.01.2023 13:24:18
-- Design Name: 
-- Module Name: encoder_on_board_display - encoder_on_board_display_arch
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

entity encoder_on_board_display is
      Port (
                switch : in std_logic_vector (9 downto 0); -- segnale di ingesso all'encoder
                anodes : out std_logic_vector (7 downto 0); -- 8 cifre del display
                cathodes : out std_logic_vector (7 downto 0); -- 7 segmenti + 1 dot
                led  : out std_logic_vector (3 downto 0)
      );
end encoder_on_board_display;



architecture encoder_on_board_display_arch of encoder_on_board_display is

    signal encoder_output : std_logic_vector (3 downto 0);
    signal dots : std_logic;
    
    
    component encoder
        Port (
                input : in std_logic_vector (9 downto 0);
                output : out std_logic_vector (3 downto 0)
        );
    end component;
    
    component cathodes_manager
        Port (
                value : in std_logic_vector (3 downto 0); -- valore da mostrare su tutte le 8 cifre del display
                dots  : in std_logic; -- punti se accesi o spenti
                cathodes : out std_logic_vector (7 downto 0) -- 7 segmenti + 1 dot     
        );
    
    end component;
    
    
begin

    anodes <= "00000001";
    dots <= '1';    
    led <= encoder_output;

    enc : encoder port map (
        
            switch (9 downto 0),
            encoder_output (3 downto 0)
    );
    
    cat_m : cathodes_manager port map (
    
            encoder_output (3 downto 0),
            dots,
            cathodes (7 downto 0)
    );


end encoder_on_board_display_arch;
