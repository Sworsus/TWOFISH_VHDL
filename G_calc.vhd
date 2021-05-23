----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:30:04 05/22/2021 
-- Design Name: 
-- Module Name:    G_calc - G_calc 
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

entity G_calc is
	port (
			in_g, in_S0_g, in_S1_g : in std_logic_vector(31 downto 0);
			out_g : out std_logic_vector(31 downto 0)
			);
end G_calc;

architecture G_calc of G_calc is
	
	-- Señales internas, f(from), t(to) y r(row)
	signal f1r, t2r, f2r, t3r, tMDS : std_logic_vector(31 downto 0);
	
	-- Componentes q y mds
	component q0
		port (
				in_q0 : in std_logic_vector(7 downto 0);
				out_q0 : out std_logic_vector(7 downto 0)
				);
	end component;
	
	component q1
		port (
				in_q1 : in std_logic_vector(7 downto 0);
				out_q1 : out std_logic_vector(7 downto 0)
				);
	end component;
	
	component MDS_calc
		port (
				y0, y1, y2, y3 : in std_logic_vector(7 downto 0);
				z0, z1, z2, z3 : out std_logic_vector(7 downto 0)
				);
	end component;
	
begin

	-- Primera fila de modulos q
	r1_q0_1: q0
	port map (
				in_q0 => in_g(7 downto 0),
				out_q0 => f1r(7 downto 0)
				);
	r1_q1_1: q1
	port map (
				in_q1 => in_g(15 downto 8),
				out_q1 => f1r(15 downto 8)
				);
	r1_q0_2: q0
	port map (
				in_q0 => in_g(23 downto 16),
				out_q0 => f1r(23 downto 16)
				);
	r1_q1_2: q1
	port map (
				in_q1 => in_g(31 downto 24),
				out_q1 => f1r(31 downto 24)
				);
				
	-- Se hace la suma de los resultados de la primera fila
	-- con S0.
	t2r <= f1r XOR in_S0_g;
	
	-- Segunda fila de modulos q
	r2_q0_1: q0
	port map (
				in_q0 => t2r(7 downto 0),
				out_q0 => f2r(7 downto 0)
				);
	r2_q0_2: q0
	port map (
				in_q0 => t2r(15 downto 8),
				out_q0 => f2r(15 downto 8)
				);
	r2_q1_1: q1
	port map (
				in_q1 => t2r(23 downto 16),
				out_q1 => f2r(23 downto 16)
				);
	r2_q1_2: q1
	port map (
				in_q1 => t2r(31 downto 24),
				out_q1 => f2r(31 downto 24)
				);
				
	-- Se hace la suma de los resultados de la segunda fila
	-- con S1.
	t3r <= f2r XOR in_S1_g;
	
	-- Tercer fila de modulos q
	r3_q1_1: q1
	port map (
				in_q1 => t3r(7 downto 0),
				out_q1 => tMDS(7 downto 0)
				);
	r3_q0_1: q0
	port map (
				in_q0 => t3r(15 downto 8),
				out_q0 => tMDS(15 downto 8)
				);
	r3_q1_2: q1
	port map (
				in_q1 => t3r(23 downto 16),
				out_q1 => tMDS(23 downto 16)
				);
	r3_q0_2: q0
	port map (
				in_q0 => t3r(31 downto 24),
				out_q0 => tMDS(31 downto 24)
				);
				
	-- Se hacen las multiplicaciones en MDS
	mult_mds: MDS_calc
	port map (
				y0 => tMDS(7 downto 0),
				y1 => tMDS(15 downto 8),
				y2 => tMDS(23 downto 16),
				y3 => tMDS(31 downto 24),
				z0 => out_g(7 downto 0),
				z1 => out_g(15 downto 8),
				z2 => out_g(23 downto 16),
				z3 => out_g(31 downto 24)
				);
				
end G_calc;

