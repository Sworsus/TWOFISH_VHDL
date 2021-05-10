----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:48:51 05/05/2021 
-- Design Name: 
-- Module Name:    Input_R_M - Input_R_M 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: El Input Register Module combina los datos para
-- que encajen en la primera fase del algoritmo, como para la primera acción
-- se tienen 4 entradas, es necesario combinar los 128 bits de entrada a 4 modulos
-- de 32 bits cada uno.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Input_R_M is
	port	(
				in_irm : in std_logic_vector (127 downto 0);
				out_irm : out std_logic_vector (127 downto 0)
			);
end Input_R_M;

architecture Input_R_M of Input_R_M is

	-- Se delcaran variables internas para poder hacer los calculos
	-- combinatorios necesarios. Se dividen los 128 bits en 16 bytes, 
	-- y luego estos se combinaran para obtener 4 salidas de 32 bits.
	-- Nota: bN es una referencia al byte N.
	signal b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15 : std_logic_vector (7 downto 0);
	signal P0, P1, P2, P3 : std_logic_vector (31 downto 0);
	
begin
	-- Se hacen las asignaciones de los conjuntos de 8 bits que 
	-- corresponden a cada byte.
	b15 <= in_irm(7 downto 0);
	b14 <= in_irm(15 downto 8);
	b13 <= in_irm(23 downto 16);
	b12 <= in_irm(31 downto 24);
	b11 <= in_irm(39 downto 32);
	b10 <= in_irm(47 downto 40);
	b9 <= in_irm(55 downto 48);
	b8 <= in_irm(63 downto 56);
	b7 <= in_irm(71 downto 64);
	b6 <= in_irm(79 downto 72);
	b5 <= in_irm(87 downto 80);
	b4 <= in_irm(95 downto 88);
	b3 <= in_irm(103 downto 96);
	b2 <= in_irm(111 downto 104);
	b1	<= in_irm(119 downto 112);
	b0 <= in_irm(127 downto 120);
	
	-- Se combinan tal y como se indica en el Paper para obetener los 4 conjuntos.
	P0 <= b3 & b2 & b1 & b0;
	P1 <= b7 & b6 & b5 & b4;
	P2 <= b11 & b10 & b9 & b8;
	P3 <= b15 & b14 & b13 & b12;

	out_irm <= P0 & P1 & P2 & P3;
	
end Input_R_M;

