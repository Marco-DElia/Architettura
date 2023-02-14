----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2023 14:58:46
-- Design Name: 
-- Module Name: A_B_tb - A_B_tb_v1
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

entity A_B_tb is
--  Port ( );
end A_B_tb;

architecture A_B_tb_v1 of A_B_tb is


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
    
    component B_node is -- N = 4
    Port(
        clk       : in std_logic;
        rst       : in std_logic;
        n_ones_in : in std_logic_vector(3 downto 0);
        req       : in std_logic;
        serial_in : in std_logic;
        ack : out std_logic
    );
    end component;

    
    signal clk_A, clk_B    : std_logic := '0';
    signal rst    : std_logic := '0';
    signal switch : std_logic_vector(7 downto 0) := (others => '0'); -- input esterno
    signal load   : std_logic := '0'; -- segnale di caricamento dato esterno
    signal ack    : std_logic := '0';
    signal there_is   : std_logic := '0'; --segnala all'utente esterno che il dato non è stato ancora usato
    signal req        : std_logic := '0';
    signal serial_out : std_logic := '0'; --uscita seriale
    
    signal n_ones_in : std_logic_vector(3 downto 0) := (others => '0'); -- numero di uni di riferimento



begin

    A : A_node
    Port map(
        clk_A,
        rst,
        switch,
        load,
        ack,
        there_is,
        req,
        serial_out
    );
        
    B : B_node -- N = 4
    Port map(
        clk_B,
        rst,
        n_ones_in,
        req,
        serial_out,
        ack
    );
    
    
   clk_A_process : process
    begin
        clk_A <= '0';
        wait for 5ns;
        clk_A <= '1';
        wait for 5ns;
    end process;
    
    clk_B_process : process
    begin
        clk_B <= '0';
        wait for 10ns;
        clk_B <= '1';
        wait for 10ns;
    end process;
    
    
    process
    begin
        wait for 100 ns;
        
        n_ones_in <= "0100";
        
        switch <= "11111111";
        wait for 10ns;
        
        load <= '1';
        wait for 10ns;
        load <= '0';
        
        wait for 50ns;

        
        switch <= "11111110";
        load <= '1';
        wait for 10ns;
        load <= '0';
        
        wait for 1500ns;
        switch <= "11100000";
        wait for 10ns;
        
        load <= '1';
        wait for 10ns;
        load <= '0';
        
        wait for 50ns;

        
        switch <= "00011111";
        load <= '1';
        wait for 10ns;
        load <= '0';
        
        
        wait for 1500ns;
        switch <= "11111111";
        wait for 10ns;
        
        load <= '1';
        wait for 10ns;
        load <= '0';
        
        wait;
    end process;


end A_B_tb_v1;
