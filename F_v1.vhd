----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:28 05/22/2021 
-- Design Name: 
-- Module Name:    F_v1 - F_v1_arch 
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

entity F_v1 is
	port (
			in_top_f, in_bot_f, in_S0_f, in_S1_f, key_top_f, key_bot_f : in std_logic_vector(31 downto 0);
			out_top_f, out_bot_f : out std_logic_vector(31 downto 0)
			);
end F_v1;

architecture F_v1_arch of F_v1 is

	signal f_shift8, t_top_pht, t_bot_pht, t_top_key, t_bot_key, carry1, carry2 : std_logic_vector(31 downto 0);
	component G_calc
		port (
				in_g, in_S0_g, in_S1_g : in std_logic_vector(31 downto 0);
				out_g : out std_logic_vector(31 downto 0)
				);
	end component;

	component PHT_v1
		port (
				in_top_pht, in_bot_pht : in std_logic_vector(31 downto 0);
				out_top_pht, out_bot_pht : out std_logic_vector(31 downto 0)
				);
	end component;

	component adder_v1
		port (
				a, b, cin : in std_logic;
				result, cout : out std_logic
				);
	end component;

begin
	
	-- Operacion G de arriba
	top_g: G_calc
			port map	(
						in_g => in_top_f,
						in_S0_g => in_S0_f,
						in_S1_g => in_S1_f,
						out_g => t_top_pht
						);

	-- Desplazamiento a la izquierda de 8 bits
	f_shift8(31 downto 8) <= in_bot_f(23 downto 0);
	f_shift8(7 downto 0) <= in_bot_f(31 downto 24);
	
	-- Operacion G de abajo
	bot_g: G_calc
		port map	(
					in_g => f_shift8,
					in_S0_g => in_S0_f,
					in_S1_g => in_S1_f,
					out_g => t_bot_pht
					);
	
	-- PHT
	funct_pht: PHT_v1
		port map(
					in_top_pht => t_top_pht,
					in_bot_pht => t_bot_pht,
					out_top_pht => t_top_key,
					out_bot_pht => t_bot_key
					);

	-- Sumador de arriba de 32 bits
	top_adder: 
		for i in 0 to 31 generate
			adder_z:
				if i = 0 generate
					adderTOP1: adder_v1
					port map(
								a => t_top_key(0),
								b => key_top_f(0),
								cin => '0',
								result => out_top_f(0),
								cout => carry1(0)
								);
			end generate adder_z;
			adder_r:
				if i > 0 generate
					adderTOP2: adder_v1
					port map(
								a => t_top_key(i),
								b => key_top_f(i),
								cin => carry1(i-1),
								result => out_top_f(i),
								cout => carry1(i)
								);
			end generate adder_r;
	end generate top_adder;
	
	-- Se crea el sumador de abajo
	bot_adder: 
		for i in 0 to 31 generate
			adder_z:
				if i = 0 generate
					adderBOT1: adder_v1
					port map(
								a => t_bot_key(0),
								b => key_bot_f(0),
								cin => '0',
								result => out_bot_f(0),
								cout => carry2(0)
								);
			end generate adder_z;
			adder_r:
				if i > 0 generate
					adderBOT2: adder_v1
					port map(
								a => t_bot_key(i),
								b => key_bot_f(i),
								cin => carry1(i-1),
								result => out_bot_f(i),
								cout => carry2(i)
								);
			end generate adder_r;
	end generate bot_adder;
	
end F_v1_arch;

