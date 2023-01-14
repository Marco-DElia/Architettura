-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Wed Jan  4 13:07:41 2023
-- Host        : LAPTOP-RRM7JM00 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/Marco/Desktop/GitHub/Architettura/Esercizio1-Multiplexer/Esercizio/MUX16-1.sim/sim_1/synth/func/xsim/mux16_1_tb_func_synth.vhd
-- Design      : mux16_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a12ticsg325-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mux16_1 is
  port (
    in_vec : in STD_LOGIC_VECTOR ( 0 to 15 );
    s : in STD_LOGIC_VECTOR ( 3 downto 0 );
    y : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of mux16_1 : entity is true;
end mux16_1;

architecture STRUCTURE of mux16_1 is
  signal in_vec_IBUF : STD_LOGIC_VECTOR ( 0 to 15 );
  signal s_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal y_OBUF : STD_LOGIC;
  signal y_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal y_OBUF_inst_i_3_n_0 : STD_LOGIC;
  signal y_OBUF_inst_i_4_n_0 : STD_LOGIC;
  signal y_OBUF_inst_i_5_n_0 : STD_LOGIC;
  signal y_OBUF_inst_i_6_n_0 : STD_LOGIC;
  signal y_OBUF_inst_i_7_n_0 : STD_LOGIC;
begin
\in_vec_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(0),
      O => in_vec_IBUF(0)
    );
\in_vec_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(10),
      O => in_vec_IBUF(10)
    );
\in_vec_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(11),
      O => in_vec_IBUF(11)
    );
\in_vec_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(12),
      O => in_vec_IBUF(12)
    );
\in_vec_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(13),
      O => in_vec_IBUF(13)
    );
\in_vec_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(14),
      O => in_vec_IBUF(14)
    );
\in_vec_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(15),
      O => in_vec_IBUF(15)
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
\in_vec_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(4),
      O => in_vec_IBUF(4)
    );
\in_vec_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(5),
      O => in_vec_IBUF(5)
    );
\in_vec_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(6),
      O => in_vec_IBUF(6)
    );
\in_vec_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(7),
      O => in_vec_IBUF(7)
    );
\in_vec_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(8),
      O => in_vec_IBUF(8)
    );
\in_vec_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_vec(9),
      O => in_vec_IBUF(9)
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
\s_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => s(2),
      O => s_IBUF(2)
    );
\s_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => s(3),
      O => s_IBUF(3)
    );
y_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => y_OBUF,
      O => y
    );
y_OBUF_inst_i_1: unisim.vcomponents.MUXF8
     port map (
      I0 => y_OBUF_inst_i_2_n_0,
      I1 => y_OBUF_inst_i_3_n_0,
      O => y_OBUF,
      S => s_IBUF(3)
    );
y_OBUF_inst_i_2: unisim.vcomponents.MUXF7
     port map (
      I0 => y_OBUF_inst_i_4_n_0,
      I1 => y_OBUF_inst_i_5_n_0,
      O => y_OBUF_inst_i_2_n_0,
      S => s_IBUF(2)
    );
y_OBUF_inst_i_3: unisim.vcomponents.MUXF7
     port map (
      I0 => y_OBUF_inst_i_6_n_0,
      I1 => y_OBUF_inst_i_7_n_0,
      O => y_OBUF_inst_i_3_n_0,
      S => s_IBUF(2)
    );
y_OBUF_inst_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => in_vec_IBUF(3),
      I1 => in_vec_IBUF(2),
      I2 => s_IBUF(1),
      I3 => in_vec_IBUF(1),
      I4 => s_IBUF(0),
      I5 => in_vec_IBUF(0),
      O => y_OBUF_inst_i_4_n_0
    );
y_OBUF_inst_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => in_vec_IBUF(7),
      I1 => in_vec_IBUF(6),
      I2 => s_IBUF(1),
      I3 => in_vec_IBUF(5),
      I4 => s_IBUF(0),
      I5 => in_vec_IBUF(4),
      O => y_OBUF_inst_i_5_n_0
    );
y_OBUF_inst_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => in_vec_IBUF(11),
      I1 => in_vec_IBUF(10),
      I2 => s_IBUF(1),
      I3 => in_vec_IBUF(9),
      I4 => s_IBUF(0),
      I5 => in_vec_IBUF(8),
      O => y_OBUF_inst_i_6_n_0
    );
y_OBUF_inst_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => in_vec_IBUF(15),
      I1 => in_vec_IBUF(14),
      I2 => s_IBUF(1),
      I3 => in_vec_IBUF(13),
      I4 => s_IBUF(0),
      I5 => in_vec_IBUF(12),
      O => y_OBUF_inst_i_7_n_0
    );
end STRUCTURE;
