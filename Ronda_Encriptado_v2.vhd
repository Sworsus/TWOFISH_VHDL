----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:00:13 06/28/2021 
-- Design Name: 
-- Module Name:    Ronda_Encriptado_v2 - Ronda_Encriptado_v2_arch 
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

entity Ronda_Encriptado_v2 is
	port	(
			in_RE_1, in_RE_2, in_RE_3, in_RE_4,
			in_S0_RE, in_S1_RE,
			in_key_up_ter128, in_key_down_ter128 : in std_logic_vector(31 downto 0);
			out_RE_1, out_RE_2, out_RE_3, out_RE_4 : out std_logic_vector(31 downto 0)
			);
end Ronda_Encriptado_v2;

architecture Ronda_Encriptado_v2_arch of Ronda_Encriptado_v2 is

	signal	t_L_shift, f_R_shift, t_XOR_w3, t_XOR_w4	: std_logic_vector(31 downto 0);
 
	component F_v2
		port	(
				in_top_f, in_bot_f, in_S0_f, in_S1_f, key_top_f, key_bot_f : in std_logic_vector(31 downto 0);
				out_top_f, out_bot_f : out std_logic_vector(31 downto 0)
				);
	end component;

begin
 
	-- Asignacion de entradas y salidas de la funcion F
	function_f: F_v2
		port map	(
					in_top_f => in_RE_1,
					in_bot_f => in_RE_2,
					in_S0_f => in_S0_RE,	
					in_S1_f => in_S1_RE,
					key_top_f => in_key_up_ter128,
					key_bot_f => in_key_down_ter128,
					out_top_f => t_XOR_w3,
					out_bot_f => t_XOR_w4
					);
 
	-- Se realizan los intercambios iniciales
	-- in_RE_1 -> out_RE_3
	-- in_RE_2 -> out_RE_4
	-- in_RE_3 -> out_RE_1
	-- in_RE_4 -> out_RE_2	
 
	-- Se hace la XOR izquierda entre la funcion Top F y 
	-- el tercer input.
	t_L_shift <= t_XOR_w3 XOR in_RE_3;
 
	-- Se hace la rotacion de esta parte (izquierda) hacia 
	-- la derecha de 1 bit y se realiza el intercambio.
	out_RE_1(30 downto 0) <= t_L_shift(31 downto 1);
	out_RE_1(31) <= t_L_shift(0);
 
	-- Se hace la rotacion de la parte derecha hacia 
	-- la izquierda de 1 bit.
	f_R_shift(0) <= in_RE_4(31);
	f_R_shift(31 downto 1) <= in_RE_4(30 downto 0);
 
	-- Se hace la XOR derecha entre la funcion Bot F y 
	-- el cuarto input.
	out_RE_2 <= f_R_shift XOR t_XOR_w4;
 
	-- Se realiza el ultimo intercambio.
	out_RE_3 <= in_RE_1;
	out_RE_4 <= in_RE_2;
	
end Ronda_Encriptado_v2_arch;

