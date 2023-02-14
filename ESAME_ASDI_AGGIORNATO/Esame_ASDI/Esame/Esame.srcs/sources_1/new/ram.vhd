library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;
USE ieee.math_real.log2;
USE ieee.math_real.ceil;


entity async_read_generic_ram is
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
    end async_read_generic_ram;

architecture async_read_generic_ram_v1 of async_read_generic_ram is 

type ram_type is array (n_register-1 downto 0) of std_logic_vector(register_size-1 downto 0);
signal RAM : ram_type := (others => (others => '0'));

begin 
process(clk) 
    begin
        if (rising_edge(clk)) then
            
            if (rst = '1') then
                RAM <= (others => (others => '0'));
            elsif (we = '1') then
                RAM(to_integer(unsigned(addr))) <= di;
            end if;
        end if;
    end process;
    do <= RAM(to_integer(unsigned(addr)));
end async_read_generic_ram_v1;