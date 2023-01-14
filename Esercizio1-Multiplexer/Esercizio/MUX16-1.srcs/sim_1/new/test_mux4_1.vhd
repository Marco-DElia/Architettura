-- Testbench per multiplexer 4 a 1 con vettore di ingresso std_logic_vector
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity del multiplexer
entity mux4_1_tb is
end mux4_1_tb;

-- Architettura del testbench
architecture testbench of mux4_1_tb is
    -- Dichiarazione del multiplexer
    component mux4_1 is
        port (
            in_vec: in std_logic_vector(3 downto 0); -- Vettore di ingresso
            s: in std_logic_vector(1 downto 0); -- Selector inputs
            y: out std_logic -- Output
        );
    end component;

    -- Segnali di ingresso e uscita del multiplexer
    signal in_vec: std_logic_vector(3 downto 0);
    signal s: std_logic_vector(1 downto 0);
    signal y: std_logic;

begin
    -- Istanza del multiplexer
    uut: mux4_1 port map(
        in_vec => in_vec,
        s => s,
        y => y
    );

    -- Processo di test
    test_process: process
    begin
        wait for 100 ns;
        -- Test case 1: in_vec = "0000", s = "00"
        in_vec <= "0001";
        s <= "11";
        wait for 10 ns;
        assert y = '1' report "Test case 1 failed" severity error;

        -- Test case 2: in_vec = "0010", s = "01"
        in_vec <= "0010";
        s <= "10";
        wait for 10 ns;
        assert y = '1' report "Test case 2 failed" severity error;

        -- Test case 3: in_vec = "0100", s = "10"
        in_vec <= "0100";
        s <= "01";
        wait for 10 ns;
        assert y = '0' report "Test case 3 failed";

        -- Test case 4: in_vec = "1000", s = "11"
        in_vec <= "1000";
        s <= "00";
        wait for 10 ns;
        assert y = '0' report "Test case 4 failed" severity FAILURE;

        -- End the test
        wait;
    end process;
end testbench;
