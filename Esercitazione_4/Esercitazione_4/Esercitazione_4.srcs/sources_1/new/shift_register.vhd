----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2023 17:29:33
-- Design Name: 
-- Module Name: shift_register - shift_register_behavioral
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

entity shift_register is
    Generic (
        nbits_shift_quantity : integer := 2 --numero di bits
    );
    Port (
        clk, rst : in std_logic;
        data_in  : in std_logic; -- bit in ingresso allo shift register
        sh_dir   : in std_logic; -- direzione dello shift
        sh_qnt   : in std_logic_vector (nbits_shift_quantity - 1 downto 0); -- numero di posizioni da shiftare
        do_shift : in std_logic; -- comando di shift
        left_out, right_out : out std_logic -- uscite dello shift register
    );
end shift_register;

architecture shift_register_structural of shift_register is

    constant nbits : integer := 2**nbits_shift_quantity;

    signal data_in_vector  : std_logic_vector (0 to nbits - 1);
    signal internal_output : std_logic_vector (0 to nbits - 1);
    signal internal_output_reverse : std_logic_vector (nbits - 1 downto 0);

    component shift_unit is
    Generic (
        nbits_shift_quantity : integer := 2
    );
    Port (
        clk, rst    : in std_logic;
        input_left  : in std_logic_vector (0 to 2**nbits_shift_quantity - 1);
        input_right : in std_logic_vector (0 to 2**nbits_shift_quantity - 1);
        sh_dir      : in std_logic;
        sh_qnt      : in std_logic_vector (nbits_shift_quantity - 1 downto 0);
        do_shift    : in std_logic;
        output      : out std_logic
    );
    end component;

    begin
    
    data_in_vector <= (others => data_in);
    internal_output_reverse <= internal_output;
    
    left_out <= internal_output(0);
    right_out <= internal_output(nbits - 1);
    

    sh_u_first : shift_unit
    generic map (
        nbits_shift_quantity
    )
    port map (
        clk,
        rst,
        internal_output(1 to nbits - 1) & data_in_vector(0 to 0), -- shift a sinistra (nbits - 1 - i   +    i + 1)
        data_in_vector(0 to nbits - 1), -- shift a destra (i  +   nbits - i)
        sh_dir,
        sh_qnt,
        do_shift,
        internal_output(0)
    );
    
    
    shift_units : for i in 1 to nbits - 2 generate

        sh_u : shift_unit
        generic map (
            nbits_shift_quantity
        )
        port map (
            clk => clk,
            rst => rst,
            input_left => internal_output(i + 1 to nbits - 1) & data_in_vector(0 to i), -- shift a sinistra (nbits - 1 - i   +    i + 1)
            input_right => internal_output_reverse(nbits - 1 downto nbits - i) & data_in_vector(0 to nbits - i - 1), -- shift a destra (i  +   nbits - i)
            sh_dir => sh_dir,
            sh_qnt => sh_qnt,
            do_shift => do_shift,
            output => internal_output(i)
        );

    end generate;
    
    
    sh_u_last : shift_unit
    generic map (
        nbits_shift_quantity
    )
    port map (
        clk,
        rst,
        data_in_vector(0 to nbits - 1), -- shift a sinistra (nbits - 1 - i   +    i + 1)
        internal_output_reverse(nbits - 1 downto 1) & data_in_vector(0), -- shift a destra (i  +   nbits - i)
        sh_dir,
        sh_qnt,
        do_shift,
        internal_output(nbits - 1)
    );


end shift_register_structural;




























--architecture shift_register_behavioral of shift_register is

--    signal registers: std_logic_vector (0 to 3) := "0000";

--begin
    
--    left_out <= registers (0);
--    right_out <= registers (3);

--    process (clk)
--    begin
--        if rising_edge (clk) then
        
--            if rst = '1' then
--                registers <= "0000";
            
--            else
--                if do_shift = '1' then
                
--                    if sh_dir = '0' then
--                        -- shitf a sinistra
--                        case sh_qnt is
--                            when "00"   => registers <= registers(1 to 3) & data_in;
--                            when "01"   => registers <= registers(2 to 3) & data_in & data_in;
--                            when "10"   => registers <= registers(3) & data_in & data_in & data_in;
--                            when "11"   => registers <= data_in & data_in & data_in & data_in;
--                            when others =>
--                        end case;
--                    else
--                        -- shift a destra
--                        case sh_qnt is
--                            when "00"   => registers <= data_in & registers(0 to 2);
--                            when "01"   => registers <= data_in & data_in & registers(0 to 1);
--                            when "10"   => registers <= data_in & data_in & data_in & registers(0);
--                            when "11"   => registers <= data_in & data_in & data_in & data_in;
--                            when others =>
--                        end case;
--                    end if;
--                end if;
--            end if;
--        end if;
    
--    end process;


--end shift_register_behavioral;



-- VERSIONE NON GENERIC COMPORTAMENTALE

--architecture shift_register_behavioral of shift_register is

--    signal registers: std_logic_vector (0 to 3) := "0000";

--begin
    
--    left_out <= registers (0);
--    right_out <= registers (3);

--    process (clk)
--    begin
--        if rising_edge (clk) then
        
--            if rst = '1' then
--                registers <= "0000";
            
--            else
--                if do_shift = '1' then
                
--                    if sh_dir = '0' then
--                        -- shitf a sinistra
--                        case sh_qnt is
--                            when "00"   => registers <= registers(1 to 3) & data_in;
--                            when "01"   => registers <= registers(2 to 3) & data_in & data_in;
--                            when "10"   => registers <= registers(3) & data_in & data_in & data_in;
--                            when "11"   => registers <= data_in & data_in & data_in & data_in;
--                            when others =>
--                        end case;
--                    else
--                        -- shift a destra
--                        case sh_qnt is
--                            when "00"   => registers <= data_in & registers(0 to 2);
--                            when "01"   => registers <= data_in & data_in & registers(0 to 1);
--                            when "10"   => registers <= data_in & data_in & data_in & registers(0);
--                            when "11"   => registers <= data_in & data_in & data_in & data_in;
--                            when others =>
--                        end case;
--                    end if;
--                end if;
--            end if;
--        end if;
    
--    end process;


--end shift_register_behavioral;
