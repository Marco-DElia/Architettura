----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.01.2023 09:49:31
-- Design Name: 
-- Module Name: debouncer - deb_arch
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

entity debouncer is
      Port (
                clk   : in std_logic;
                rst   : in std_logic;
                input : in std_logic;
                output : out std_logic
      );
end debouncer;

architecture deb_arch of debouncer is

    type state_type is (NOT_PRESSED, PRESSED_VRF, PRESSED, NOT_PRESSED_VRF);
    signal next_state, calculated_state : state_type;

begin
    process (clk)
    variable count : integer := 0;
    begin  
        if (rising_edge(clk)) then
            if (rst = '1') then
                next_state <= NOT_PRESSED;
                count := 0;
            else
                next_state <= calculated_state;
            end if;
        
            if (next_state = NOT_PRESSED) then
                output <= '0';
                if (input = '1') then
                    calculated_state <= PRESSED_VRF;
                end if;
            end if;
            
            if (next_state = PRESSED_VRF) then
                if (count < 100000) then
                    output <= '0';
                    count := count + 1;
                    calculated_state <= PRESSED_VRF;
                else
                    if (input = '1') then
                        output <= '1';
                        calculated_state <= PRESSED;
                    else
                        calculated_state <= NOT_PRESSED;
                    end if;
                    count := 0;
                end if;
            end if;
            
            if (next_state = PRESSED) then
                output <= '0';
                if (input = '1') then
                    calculated_state <= PRESSED;
                else
                    calculated_state <= NOT_PRESSED_VRF;
                end if;
            end if;
            
            if (next_state = NOT_PRESSED_VRF) then
                if (count < 100000) then
                    output <= '0';
                    calculated_state <= NOT_PRESSED_VRF;
                else
                    count := 0;
                    if (input = '0') then
                        calculated_state <= NOT_PRESSED;
                    else
                        calculated_state <= PRESSED_VRF;
                end if;
            end if;
        end if;
      end if;
    end process;
    
end deb_arch;
