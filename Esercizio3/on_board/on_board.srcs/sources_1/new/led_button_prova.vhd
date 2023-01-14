----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.01.2023 11:13:42
-- Design Name: 
-- Module Name: led_button_prova - led_button_prova_arch
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

entity led_button_prova is
      Port (
            clock_in : in std_logic;
            rst : in std_logic;
            button : in std_logic;
            led    : out std_logic
      );
end led_button_prova;

architecture led_button_prova_arch of led_button_prova is

    type state_type is(ACCESO, SPENTO);
    signal state : state_type := SPENTO;
    signal cleared_btn : std_logic := '0';

   component ButtonDebouncer is
    generic (                       
        CLK_period: integer := 10;  -- periodo del clock in nanosec
        btn_noise_time: integer := 10000000 --durata dell'oscillazione in nanosec
        );
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           BTN : in STD_LOGIC; 
           CLEARED_BTN : out STD_LOGIC);
end component;

begin

    debouncer: ButtonDebouncer GENERIC MAP( 
            CLK_period => 10,  -- periodo del clock della board pari a 10ns
            btn_noise_time => 5000000 -- assumo un periodo di oscillazione di 5 millisec
    )
    PORT MAP ( RST => rst,
               CLK => clock_in, 
               BTN => button,
               CLEARED_BTN => cleared_btn --il bottone ripulito viene dato in input al contatore come enable del conteggio
                                          --per incrementare l'indirizzo della ROM e scandire le locazioni in sequenza
    );

    process (clock_in)
    variable count : integer := 0;
    begin
        if (rising_edge (clock_in)) then
            if (state = SPENTO) then
                led <= '0';
                if (cleared_btn = '1') then
                    state <= ACCESO;
                else
                    state <= SPENTO;
                end if;
             else
                led <= '1';
                if (cleared_btn = '1') then
                    state <= SPENTO;
                else
                    state <= ACCESO;
                end if;
             end if;
        end if;
    end process;
end led_button_prova_arch;
