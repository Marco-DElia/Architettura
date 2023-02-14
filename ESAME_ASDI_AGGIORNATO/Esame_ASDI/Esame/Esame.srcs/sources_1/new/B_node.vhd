----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2023 13:02:18
-- Design Name: 
-- Module Name: B_node - B_node_v1
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
use ieee.numeric_std.all;
use IEEE.math_real.all;
USE ieee.math_real.log2;
USE ieee.math_real.ceil;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity B_node is -- N = 4
    Port(
        clk       : in std_logic;
        rst       : in std_logic;
        n_ones_in : in std_logic_vector(3 downto 0);
        req       : in std_logic;
        serial_in : in std_logic;
        ack : out std_logic
    );
end B_node;

architecture B_node_v1 of B_node is

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
    
    component adder_sub_structural is
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
    end component;
    
    component async_read_generic_ram is
    Generic(
        register_size : integer := 8;
        n_register    : integer := 64
    );
    port(
        clk, rst : in  std_logic;
        we       : in  std_logic; -- write enable
        addr     : in  std_logic_vector(integer(ceil(log2(real(n_register))))-1 downto 0);
        di       : in  std_logic_vector(register_size-1 downto 0);
        do       : out std_logic_vector(register_size-1 downto 0)
    );
    end component;

    signal left_data_sh, do_shift : std_logic := '0';
    signal p_data_sh    : std_logic_vector(7 downto 0) := (others => '0');
    
    signal is_one : std_logic := '0'; --segnale in input al contatore
    signal new_data : std_logic := '0'; --segnale per dire che è stato salvato un nuovo bit e che va visto se è uno
    signal n_ones : std_logic_vector(3 downto 0) := (others => '0'); -- numero di uni in uscita al contatore, 4 bit, massimo 8 uni
    signal reset_ones : std_logic := '0';
    
    
    signal write : std_logic := '0';
    signal address : std_logic_vector(1 downto 0) := (others => '0');
    
    signal n_shift : std_logic_vector(2 downto 0) := (others => '0');
    
    signal new_byte : std_logic := '0';
    signal n_byte_rcvd : std_logic_vector(1 downto 0) := (others => '0');
    
    signal n_flag : std_logic := '0';
    
    type state is (IDLE_ST, WAIT_REQ_ST, SAVE_ST, ACK_ST, NEW_DATA_ST, COMP_ST, WRITE_ST, NO_WRITE_ST, FINISH_ST);
    signal curr_state, next_state : state := IDLE_ST;

begin

    is_one <= left_data_sh and new_data;

    sh : sh_reg
    Generic map(
        8
    )
    Port map(
        clk,
        rst,
        serial_in,
        left_data_sh,
        open,
        (others => '0'),
        p_data_sh, -- parallel data out
        '0',
        '1',
        do_shift
    );
    
    sh_counter : generic_counter
    Generic map(
        8
    )
    Port map(
        rst,
        clk,
        do_shift,
        n_shift
    );
    
    counter_ones : generic_counter
    Generic map(
        9
    )
    Port map(
        reset_ones,
        clk,
        is_one,
        n_ones
    );
    
    mem_counter : generic_counter
    Generic map(
        4
    )
    Port map(
        rst,
        clk,
        write,
        address
    );
    
    byte_counter : generic_counter
    Generic map(
        4
    )
    Port map(
        rst,
        clk,
        new_byte,
        n_byte_rcvd
    );
    
    comp : adder_sub_structural -- confronto tra numeri unsigned, viene aggiunto un bit alla fine per complemento a 2
    Generic map(
        5
    )
    Port map(
        '0' & n_ones,
        '0' & n_ones_in,
        '1',
        open,
        n_flag, -- 1 se è negativo, se negativo non salvo
        open
    );
    
    ram : async_read_generic_ram
    Generic map(
        8, -- 8 bit 
        4  -- 4 byte
    )
    port map(
        clk,
        rst,
        write,
        address,
        p_data_sh,
        open
    );
    
    
    
    
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
    
    next_state_process : process (curr_state, req, n_shift, n_flag, n_byte_rcvd)
    begin
        
        case curr_state is
    
            when IDLE_ST =>
                
                new_data <= '0';
                ack      <= '0';
                new_byte <= '0';
                write    <= '0';
                do_shift <= '0';
                
                next_state <= WAIT_REQ_ST;
                
            when WAIT_REQ_ST => 
            
                write    <= '0';
                new_byte <= '0';
                new_data <= '0';
                
                reset_ones <= '0';
                
                if req = '0' then
                    next_state <= WAIT_REQ_ST;
                else 
                    next_state <= SAVE_ST;
                end if;
                
            when SAVE_ST => 
            
                do_shift <= '1';
                
                next_state <= ACK_ST;
                
            when ACK_ST => 
            
                ack <= '1';
                do_shift <= '0';
                
                if req = '1' then
                    next_state <= ACK_ST;
                else
                    next_state <= NEW_DATA_ST;
                end if;
            
            when NEW_DATA_ST => 
            
                ack <= '0';
                new_data <= '1';
                
                if unsigned(n_shift) = 0 then
                    next_state <= COMP_ST;
                else
                    next_state <= WAIT_REQ_ST;
                end if;    
                          
            when COMP_ST => 
            
                new_data <= '0';
                
                if n_flag = '0' then
                    next_state <= WRITE_ST;
                else
                    next_state <= NO_WRITE_ST;
                end if;
                
            when WRITE_ST =>
            
                new_byte <= '1';
                write <= '1';
                
                reset_ones <= '1';
                
                if unsigned(n_byte_rcvd) = 3 then
                    next_state <= FINISH_ST;
                else 
                    next_state <= WAIT_REQ_ST;
                end if;
                
            when NO_WRITE_ST =>
            
                new_byte <= '1';
                
                reset_ones <= '1';

                if unsigned(n_byte_rcvd) = 3 then
                    next_state <= FINISH_ST;
                else 
                    next_state <= WAIT_REQ_ST;
                end if;            
            
            when FINISH_ST => 
            
                write <= '0';
                new_byte <= '0';
                
                reset_ones <= '0';
                
                next_state <= FINISH_ST;
            
            when others =>
        end case;
    end process;
    
    
    
    
    
    
    
    
    

end B_node_v1;
