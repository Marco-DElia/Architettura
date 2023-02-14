----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2023 12:35:43
-- Design Name: 
-- Module Name: A_node_tb - A_node_tb_v1
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

entity A_node_tb is
--  Port ( );
end A_node_tb;

architecture A_node_tb_v1 of A_node_tb is

    
    component A_node is
        Port(
            clk    : in std_logic;
            rst    : in std_logic;
            switch : in std_logic_vector(7 downto 0); -- input esterno
            load   : in std_logic; -- segnale di caricamento dato esterno
            ack    : in std_logic;
            there_is   : out std_logic; --segnala all'utente esterno che il dato non è stato ancora usato
            req        : out std_logic;
            serial_out : out std_logic --uscita seriale
        );
    end component;

    
    signal clk    : std_logic := '0';
    signal rst    : std_logic := '0';
    signal switch : std_logic_vector(7 downto 0) := (others => '0'); -- input esterno
    signal load   : std_logic := '0'; -- segnale di caricamento dato esterno
    signal ack    : std_logic := '0';
    signal there_is   : std_logic := '0'; --segnala all'utente esterno che il dato non è stato ancora usato
    signal req        : std_logic := '0';
    signal serial_out : std_logic := '0'; --uscita seriale

begin

    A : A_node
        Port map(
            clk,
            rst,
            switch,
            load,
            ack,
            there_is,
            req,
            serial_out
        );

    process
    begin
        clk <= '0';
        wait for 5ns;
        clk <= '1';
        wait for 5ns;
    end process;
    
    process
    begin
        wait for 100 ns;
        
        switch <= "10101010";
        wait for 10ns;
        
        load <= '1';
        wait for 10ns;
        load <= '0';
        
        wait for 100ns;
        
        ack <= '1';
        wait for 30ns;
        ack <= '0';
        
        wait for 10ns;
        
        switch <= "11111111";
        load <= '1';
        wait for 10ns;
        load <= '0';
        
        ack <= '1';
        wait for 30ns;
        ack <= '0';
        
        wait;
    end process;
   

end A_node_tb_v1;
