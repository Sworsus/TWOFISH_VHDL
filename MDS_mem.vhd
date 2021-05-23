----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:58 04/21/2021 
-- Design Name: 
-- Module Name:    MDS_mem - Behavioral 
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

entity MDS_mem is
	port (
		y0, y1, y2, y3 : in STD_LOGIC_VECTOR(7 downto 0);
		z0, z1, z2, z3 : out STD_LOGIC_VECTOR(7 downto 0)
		);	
end MDS_mem;

architecture MDS_mem of MDS_mem is

	--No se implementa la multiplicacion por 01, ya que el resultado
	--es el mismo elemnto (01 es el neutro en GF(2^8))

	--Multiplicacion por EF
	component mult_EF_mem is
		port (
				in_EF : in STD_LOGIC_VECTOR (7 downto 0);
				out_EF : out STD_LOGIC_VECTOR (7 downto 0)
				);	
	end component;
	
	--Multiplicacion por 5B
	component mult_5B_mem is
		port (
				in_5B : in STD_LOGIC_VECTOR (7 downto 0);
				out_5B : out STD_LOGIC_VECTOR (7 downto 0)
				);	
	end component;
	
	--Salida de las multiplicaciones
	signal y0_EF, y1_EF, y2_EF, y3_EF, y0_5B, y1_5B, y2_5B, y3_5B : STD_LOGIC_VECTOR(7 downto 0); 

begin

	--Realizo las multiplicaciones
	y0_x_EF: mult_EF_mem
		port map(
					in_EF => y0,
					out_EF =>y0_EF
					);
	y1_x_EF: mult_EF_mem
		port map(
					in_EF => y1,
					out_EF =>y1_EF
					);
	y2_x_EF: mult_EF_mem
		port map(
					in_EF => y2,
					out_EF =>y3_EF
					);
	y3_x_EF: mult_EF_mem
		port map(
					in_EF => y3,
					out_EF =>y3_EF
					);

	y0_x_5B: mult_5B_mem
		port map(
					in_5B => y0,
					out_5B =>y0_EF
					);
	y1_x_5B: mult_5B_mem
		port map(
					in_5B => y1,
					out_5B =>y1_EF
					);
	y2_x_5B: mult_5B_mem
		port map(
					in_5B => y2,
					out_5B =>y2_EF
					);
	y3_x_5B: mult_5B_mem
		port map(
					in_5B => y3,
					out_5B =>y3_EF
					);
	
	--Se calculan los elementos Z, como los resultados
	--de las multiplicacion de matrices z = MDS*y
	
	--Z0 = y0*01 + y1*EF + y2*5B + y3*5B
	z0 <= y0 XOR y1_EF XOR y2_5B XOR y3_5B;
	
	--Z1 = y0*5B + y1*EF + y2*EF + y3*01
	z1 <= y0_5B XOR y1_EF XOR y2_EF XOR y3;
	
	--Z2 = y0*EF + y1*5B + y2*01 + y3*EF
	z2 <= y0_EF XOR y1_5B XOR y2 XOR y3_EF;
	
	--Z3 = y0*EF + y1*01 + y2*EF + y3*5B
	z3 <= y0_EF XOR y1 XOR y2_EF XOR y3_5B;

end MDS_mem;



