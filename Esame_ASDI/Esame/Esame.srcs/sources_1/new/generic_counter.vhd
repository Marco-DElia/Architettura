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

entity generic_counter is
    Generic(
        N : positive := 16
    );
    Port(
        rst, clk : in std_logic;
        evnt     : in std_logic; -- segnale di conteggio del counter
        count    : out std_logic_vector(integer(ceil(log2(real(N))))-1 downto 0) -- uscita di conteggio del counter
    );
end generic_counter;

architecture generic_counter_v1 of generic_counter is
    
    signal internal_count : integer range 0 to N-1 := 0;
    
begin
    
    count <= std_logic_vector(to_unsigned(internal_count, count'length));
    
    process(clk)
        begin
        
            if(rising_edge(clk)) then
                
                if(rst = '1') then
                    internal_count <= 0;
                elsif(evnt = '1') then
                    internal_count <= (internal_count + 1) mod N;
                end if;
                
            end if;
            
    end process;
    
end generic_counter_v1;