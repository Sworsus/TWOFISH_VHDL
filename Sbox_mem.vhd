----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:09:51 06/28/2021 
-- Design Name: 
-- Module Name:    Sbox_mem - Sbox_mem_arch 
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

entity Sbox_mem is
	port	(
			in_key_Sbox		: in std_logic_vector(127 downto 0);
			out_S0_Sbox,
			out_S1_Sbox			: out std_logic_vector(31 downto 0)
			);
end Sbox_mem;

architecture Sbox_mem_arch of Sbox_mem is

	component RS128_mem
		port	(
				in_rs128	: in std_logic_vector(127 downto 0);
				out_S0_rs128,
				out_S1_rs128		: out std_logic_vector(31 downto 0)
				);
	end component;
 
	signal twofish_key : std_logic_vector(127 downto 0);
	signal b0 ,b1 ,b2 ,b3 ,b4 ,b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15 : std_logic_vector(7 downto 0);
 
begin
 
	-- Se divide el input en los distintos bytes
	b15 <= in_key_Sbox(7 downto 0);
	b14 <= in_key_Sbox(15 downto 8);
	b13 <= in_key_Sbox(23 downto 16);
	b12 <= in_key_Sbox(31 downto 24);
	b11 <= in_key_Sbox(39 downto 32);
	b10 <= in_key_Sbox(47 downto 40);
	b9 <= in_key_Sbox(55 downto 48);
	b8 <= in_key_Sbox(63 downto 56);
	b7 <= in_key_Sbox(71 downto 64);
	b6 <= in_key_Sbox(79 downto 72);
	b5 <= in_key_Sbox(87 downto 80);
	b4 <= in_key_Sbox(95 downto 88);
	b3 <= in_key_Sbox(103 downto 96);
	b2 <= in_key_Sbox(111 downto 104);
	b1 <= in_key_Sbox(119 downto 112);
	b0 <= in_key_Sbox(127 downto 120);
 
	-- Se crea la key
	twofish_key <= b15 & b14 & b13 & b12 & b11 & b10 & b9 & b8 & b7 & b6 & b5 & b4 & b3 & b2 & b1 & b0;
 
 
	-- Se generan S0,1
	Generar_S0_S1: RS128_mem
		port map	(
					in_rs128 => twofish_key,
					out_S0_rs128 => out_S0_Sbox,
					out_S1_rs128 => out_S1_Sbox
					);

end Sbox_mem_arch;

