----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:40:08 06/28/2021 
-- Design Name: 
-- Module Name:    White_KeySched_v2 - White_KeySched_v2_arch 
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

entity White_KeySched_v2 is
	port	(
			in_key_wks : in std_logic_vector(127 downto 0);
			out_K0_wks, out_K1_wks, out_K2_wks, out_K3_wks,
			out_K4_wks, out_K5_wks, out_K6_wks, out_K7_wks : out std_logic_vector(31 downto 0)
			);
end White_KeySched_v2;
 
architecture White_KeySched_v2_arch of White_KeySched_v2 is
 
	signal t_up_pht_1, t_shift8_1, f_shift8_1, t_shift9_1, 
			 t_up_pht_2, t_shift8_2, f_shift8_2, t_shift9_2, 
			 t_up_pht_3, t_shift8_3, f_shift8_3, t_shift9_3, 
			 t_up_pht_4, t_shift8_4, f_shift8_4, t_shift9_4, M0, M1, M2, M3 : std_logic_vector(31 downto 0);
 
	signal b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15 : std_logic_vector(7 downto 0);
  
	component PHT_v1
		port	(
				in_top_pht, in_bot_pht : in std_logic_vector(31 downto 0);
				out_top_pht, out_bot_pht : out std_logic_vector(31 downto 0)
				);
	end component;
 
	component H_mem 
		port	(
				in_h : in std_logic_vector(7 downto 0);
				S0_h, S1_h : in std_logic_vector(31 downto 0);
				out_h : out std_logic_vector(31 downto 0)
				);
	end component;
 
begin

	-- Se asignan las se;ales tal y como se indica en el paper
	b15 <= in_key_wks(7 downto 0);
	b14 <= in_key_wks(15 downto 8);
	b13 <= in_key_wks(23 downto 16);
	b12 <= in_key_wks(31 downto 24);
	b11 <= in_key_wks(39 downto 32);
	b10 <= in_key_wks(47 downto 40);
	b9 <= in_key_wks(55 downto 48);
	b8 <= in_key_wks(63 downto 56);
	b7 <= in_key_wks(71 downto 64);
	b6 <= in_key_wks(79 downto 72);
	b5 <= in_key_wks(87 downto 80);
	b4 <= in_key_wks(95 downto 88);
	b3 <= in_key_wks(103 downto 96);
	b2 <= in_key_wks(111 downto 104);
	b1 <= in_key_wks(119 downto 112);
	b0 <= in_key_wks(127 downto 120);
 
	-- Se forman M{0..3}
	M0 <= b3 & b2 & b1 & b0;
	M1 <= b7 & b6 & b5 & b4;
	M2 <= b11 & b10 & b9 & b8;
	M3 <= b15 & b14 & b13 & b12;
 
	-- Se crean las keys para el blanqueado
		-- Keys K0 y K1
			-- Modulo Top H
			top_h1: H_mem
				port map	(
							in_h => "00000000", -- Numero 0
							S0_h => M2,
							S1_h => M0,
							out_h => t_up_pht_1
							);
			-- Modulo Bottom H
			bot_h1: H_mem
				port map	(
							in_h => "00000001", -- Numero 1
							S0_h => M3,
							S1_h => M1,
							out_h => t_shift8_1
							);
		
			-- Se hace la rotacion de 8 bits a la izquierda
			f_shift8_1(31 downto 8) <= t_shift8_1(23 downto 0);
			f_shift8_1(7 downto 0) <= t_shift8_1(31 downto 24);
		
			-- Se realiza la transformacion PHT
			funct1_pht: PHT_v1
				port map	(
							in_top_pht => t_up_pht_1,
							in_bot_pht => f_shift8_1,
							out_top_pht => out_K0_wks,
							out_bot_pht => t_shift9_1
							);
		
			-- Se hace la rotacion de 9 bits a la izquierda
			out_K1_wks(31 downto 9) <= t_shift9_1(22 downto 0);
			out_K1_wks(8 downto 0) <= t_shift9_1(31 downto 23);
	
	-- Se realizan las mismas operaciones para calcular el resto de pasos
	-- para el blanqueo de las keys.

		-- Keys K2 y K3
			top_h2: H_mem
				port map	(
							in_h => "00000010", -- Numero 2
							S0_h => M2,
							S1_h => M0,
							out_h => t_up_pht_2
							);

			bot_h2: H_mem
				port map	(
							in_h => "00000011", -- Numero 3
							S0_h => M3,
							S1_h => M1,
							out_h => t_shift8_2
							);

			f_shift8_2(31 downto 8) <= t_shift8_2(23 downto 0);
			f_shift8_2(7 downto 0) <= t_shift8_2(31 downto 24);

			funct2_pht: PHT_v1
				port map	(
							in_top_pht => t_up_pht_2,
							in_bot_pht => f_shift8_2,
							out_top_pht => out_K2_wks,
							out_bot_pht => t_shift9_2
							);
		
			out_K3_wks(31 downto 9) <= t_shift9_2(22 downto 0);
			out_K3_wks(8 downto 0) <= t_shift9_2(31 downto 23);
	
		-- Keys K4 y K5
			top_h3: H_mem
				port map	(
							in_h => "00000100", -- Numero 4
							S0_h => M2,
							S1_h => M0,
							out_h => t_up_pht_3
							);
		
			bot_h3: H_mem
				port map	(
							in_h => "00000101", -- Numero 5
							S0_h => M3,
							S1_h => M1,
							out_h => t_shift8_3
							);
		
			f_shift8_3(31 downto 8) <= t_shift8_3(23 downto 0);
			f_shift8_3(7 downto 0) <= t_shift8_3(31 downto 24);
		
			funct3_pht: PHT_v1
				port map	(
							in_top_pht => t_up_pht_3,
							in_bot_pht => f_shift8_3,
							out_top_pht => out_K4_wks,
							out_bot_pht => t_shift9_3
							);
		
			out_K5_wks(31 downto 9) <= t_shift9_3(22 downto 0);
			out_K5_wks(8 downto 0) <= t_shift9_3(31 downto 23);
	
		-- Keys K6 y K7
			top_h4: H_mem
				port map	(
							in_h => "00000110", -- Numero 6
							S0_h => M2,
							S1_h => M0,
							out_h => t_up_pht_4
							);
		
			bot_h4: H_mem
				port map	(
							in_h => "00000111", -- Numero 7
							S0_h => M3,
							S1_h => M1,
							out_h => t_shift8_4
							);
		
			f_shift8_4(31 downto 8) <= t_shift8_4(23 downto 0);
			f_shift8_4(7 downto 0) <= t_shift8_4(31 downto 24);
		
			funct4_pht: PHT_v1
				port map	(
							in_top_pht => t_up_pht_4,
							in_bot_pht => f_shift8_4,
							out_top_pht => out_K6_wks,
							out_bot_pht => t_shift9_4
							);
		
			out_K7_wks(31 downto 9) <= t_shift9_4(22 downto 0);
			out_K7_wks(8 downto 0) <= t_shift9_4(31 downto 23);

end White_KeySched_v2_arch;

