----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:12 06/28/2021 
-- Design Name: 
-- Module Name:    KeySched_v2 - KeySched_v2_arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

entity KeySched_v2 is
	port	(
			in_odd_ks, in_even_ks : in std_logic_vector(7 downto 0); 
			in_key_ks : in std_logic_vector(127 downto 0);
			out_key_up_ks, out_key_low_ks : out std_logic_vector(31 downto 0)
			);
end KeySched_v2;

architecture KeySched_v2_arch of KeySched_v2 is

	signal t_top_pht, t_shift8, f_shift8, t_shift9, M0, M1, M2, M3  : std_logic_vector(31 downto 0);
	signal b0 ,b1 ,b2 ,b3 ,b4 ,b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15 : std_logic_vector(7 downto 0);
		
	component PHT_v1
		port (
				in_top_pht, in_bot_pht : in std_logic_vector(31 downto 0);
				out_top_pht, out_bot_pht : out std_logic_vector(31 downto 0)
				);
	end component;
	 
	component H_mem 
		port (
				in_h : in std_logic_vector(7 downto 0);
				S0_h, S1_h : in std_logic_vector(31 downto 0);
				out_h : out std_logic_vector(31 downto 0)
				);
	end component;
	
begin

	-- Se asignan las se;ales como se indica en el paper
	b15 <= in_key_ks(7 downto 0);
	b14 <= in_key_ks(15 downto 8);
	b13 <= in_key_ks(23 downto 16);
	b12 <= in_key_ks(31 downto 24);
	b11 <= in_key_ks(39 downto 32);
	b10 <= in_key_ks(47 downto 40);
	b9 <= in_key_ks(55 downto 48);
	b8 <= in_key_ks(63 downto 56);
	b7 <= in_key_ks(71 downto 64);
	b6 <= in_key_ks(79 downto 72);
	b5 <= in_key_ks(87 downto 80);
	b4 <= in_key_ks(95 downto 88);
	b3 <= in_key_ks(103 downto 96);
	b2 <= in_key_ks(111 downto 104);
	b1 <= in_key_ks(119 downto 112);
	b0 <= in_key_ks(127 downto 120);
 
	-- Se crean las se;ales M{0..3}
	M0 <= b3 & b2 & b1 & b0;
	M1 <= b7 & b6 & b5 & b4;
	M2 <= b11 & b10 & b9 & b8;
	M3 <= b15 & b14 & b13 & b12;
 
	-- Modulo Top H
	top_H: H_mem
		port map	(
					in_h => in_even_ks,
					S0_h => M2,
					S1_h => M0,
					out_h => t_top_pht
					);
 
	-- Modulo Low H
	low_H: H_mem
		port map	(
					in_h => in_odd_ks,
					S0_h => M3,
					S1_h => M1,
					out_h => t_shift8
					);
 
	-- Rotacion a la izquierda de 8
	f_shift8(31 downto 8) <= t_shift8(23 downto 0);
	f_shift8(7 downto 0) <= t_shift8(31 downto 24);
 
	-- Modulo transformacion PHT
	funct_pht: PHT_v1
		port map	(
					in_top_pht => t_top_pht,
					in_bot_pht => f_shift8,
					out_top_pht => out_key_up_ks,
					out_bot_pht => t_shift9
					);
 
	-- Rotacion a la izquierda de 9
	out_key_low_ks(31 downto 9) <= t_shift9(22 downto 0);
	out_key_low_ks(8 downto 0) <= t_shift9(31 downto 23);

end KeySched_v2_arch;
