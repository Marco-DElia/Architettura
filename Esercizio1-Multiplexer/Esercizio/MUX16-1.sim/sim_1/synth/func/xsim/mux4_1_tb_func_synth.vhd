-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Wed Jan  4 11:56:40 2023
-- Host        : LAPTOP-RRM7JM00 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/Marco/Desktop/GitHub/Architettura/Esercizio1-Multiplexer/Esercizio/MUX16-1.sim/sim_1/synth/func/xsim/mux4_1_tb_func_synth.vhd
-- Design      : mux4_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a12ticsg325-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mux4_1 is
  port (
    in_vec : in STD_LOGIC_VECTOR ( 0 to 3 );
    s : in STD_LOGIC_VECTOR ( 1 downto 0 );
    y : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of mux4_1 : entity is true;
end mux4_1;

architecture STRUCTURE of mux4_1 is
  signal in_vec_IBUF : STD_LOGIC_VECTOR ( 0 to 3 );
  signal s_IBUF : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal y_OBUF : STD_LOGIC;
begin
\in_vec_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(0),
      O => in_vec_IBUF(0)
    );
\in_vec_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(1),
      O => in_vec_IBUF(1)
    );
\in_vec_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(2),
      O => in_vec_IBUF(2)
    );
\in_vec_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(3),
      O => in_vec_IBUF(3)
    );
\s_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => s(0),
      O => s_IBUF(0)
    );
\s_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => s(1),
      O => s_IBUF(1)
    );
y_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => y_OBUF,
      O => y
    );
y_OBUF_inst_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => in_vec_IBUF(2),
      I1 => in_vec_IBUF(3),
      I2 => in_vec_IBUF(0),
      I3 => s_IBUF(1),
      I4 => s_IBUF(0),
      I5 => in_vec_IBUF(1),
      O => y_OBUF
    );
end STRUCTURE;
