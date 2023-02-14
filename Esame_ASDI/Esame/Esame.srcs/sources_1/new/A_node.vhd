----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2023 11:49:54
-- Design Name: 
-- Module Name: A_node - A_node_v1
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
USE ieee.math_real.log2;
USE ieee.math_real.ceil;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity A_node is
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
end A_node;

architecture A_node_v1 of A_node is

    component sh_reg is
        Generic(
            size : positive := 8
        );
        Port (
            clk, rst   : in std_logic;
            data_in    : in std_logic; -- serial input data
            l_data_out : out std_logic; -- leftmost data
            r_data_out : out std_logic; -- rightmost data
            p_data_in  : in std_logic_vector(size - 1 downto 0); -- parallel data input
            p_data_out : out std_logic_vector(size - 1 downto 0); -- parallel data out
            p_load     : in std_logic; -- load data from p_data_in
            sh_dir     : in std_logic; -- 0 for left, 1 for right
            do_shift   : in std_logic -- do shift at next clock cicle
        );
    end component;
    
    component generic_counter is
    Generic(
        N : positive := 16
    );
    Port(
        rst, clk : in std_logic;
        evnt     : in std_logic; -- segnale di conteggio del counter
        count    : out std_logic_vector(integer(ceil(log2(real(N))))-1 downto 0) -- uscita di conteggio del counter
    );
    end component;
    
    
    signal data_regs : std_logic_vector(7 downto 0) := (others => '0');
    signal internal_there_is : std_logic := '0';
    
    signal write    : std_logic := '0';
    signal do_shift : std_logic := '0';
    
    signal count_value : std_logic_vector(2 downto 0) := (others => '0');


    type state is (IDLE_ST, WRITE_ST, STOP_WRITE_ST, REQ_ST, WAIT_ACK_ZERO_ST, SHIFT_ST);
    signal curr_state, next_state : state := IDLE_ST;

begin

    there_is <= internal_there_is;

    data_regs_process : process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                data_regs <= (others => '0');
            elsif load = '1' then
                data_regs <= switch;
            end if;
        end if;
    end process;
    
    there_is_process : process (clk) --load deve essere alto per un solo colpo di clock
    begin
        if rising_edge(clk) then
            if rst = '1' then
                internal_there_is <= '0';
            elsif load = '1' then
                internal_there_is <= '1';
            elsif write = '1' then
                internal_there_is <= '0';
            end if;
        end if;
    end process;


    shreg : sh_reg
        generic map(
            8
        )
        Port map(
            clk,
            rst,
            '0',
            open,
            serial_out,
            data_regs,
            open,
            write,
            '1',
            do_shift
        );

    counter : generic_counter
    Generic map(
        8
    )
    Port map(
        rst,
        clk,
        do_shift,
        count_value
    );
    
--    type state is (IDLE_ST, WRITE_ST, STOP_WRITE_ST, REQ_ST, WAIT_ACK_ZERO_ST, SHIFT_ST);
--    signal curr_state, next_state : state := IDLE_ST;

    curr_state_process : process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                curr_state <= IDLE_ST;
            else
                curr_state <= next_state;
            end if;
        end if;
    end process;
    
    next_state_process : process (curr_state, ack, internal_there_is, count_value)
    begin
        case curr_state is
        
            when IDLE_ST =>
                -- inserire il reset del contatore
                do_shift <= '0';
                write <= '0';
                req <= '0';
                
                if internal_there_is = '1' then
                    next_state <= WRITE_ST;
                else
                    next_state <= IDLE_ST;
                end if;
                
            when WRITE_ST =>    
                
                write <= '1';
                next_state <= STOP_WRITE_ST;
                
            when STOP_WRITE_ST =>
            
                write <= '0';
                next_state <= REQ_ST;
                
            when REQ_ST =>
            
                req <= '1';
                do_shift <= '0';
                
                if ack = '1' then
                    next_state <= WAIT_ACK_ZERO_ST;
                else
                    next_state <= REQ_ST;
                end if;
                
            when WAIT_ACK_ZERO_ST =>
                
                req <= '0';
                
                if ack = '1' then
                    next_state <= WAIT_ACK_ZERO_ST;
                else
                    next_state <= SHIFT_ST;
                end if;
            
            when SHIFT_ST =>
            
                do_shift <= '1';
                
                if unsigned(count_value) /= 7 then
                    next_state <= REQ_ST;
                else
                    next_state <= IDLE_ST;
                end if;
            
            when others =>
            
            end case;
    end process;


end A_node_v1;
