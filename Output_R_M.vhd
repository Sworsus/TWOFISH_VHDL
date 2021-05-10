----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:09:38 05/05/2021 
-- Design Name: 
-- Module Name:    Output_R_M - Output_R_M 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: El Output Register Module combina los datos para
-- que se obtnega la salida del algoritmo. La implementacion es igual que
-- que la del modulo de datos de entrada Input_R_M.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Output_R_M is
	port	(
				in_orm : in std_logic_vector (127 downto 0);
				out_orm : out std_logic_vector (127 downto 0)
			);
end Output_R_M;

architecture Output_R_M of Output_R_M is

	-- Nota: bN es una referencia al byte N.
	signal b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15 : std_logic_vector (7 downto 0);
	signal C0, C1, C2, C3 : std_logic_vector (31 downto 0);
	
begin
	-- Se hacen las asignaciones de los conjuntos de 8 bits que 
	-- corresponden a cada byte.
	b15 <= in_orm(7 downto 0);
	b14 <= in_orm(15 downto 8);
	b13 <= in_orm(23 downto 16);
	b12 <= in_orm(31 downto 24);
	b11 <= in_orm(39 downto 32);
	b10 <= in_orm(47 downto 40);
	b9 <= in_orm(55 downto 48);
	b8 <= in_orm(63 downto 56);
	b7 <= in_orm(71 downto 64);
	b6 <= in_orm(79 downto 72);
	b5 <= in_orm(87 downto 80);
	b4 <= in_orm(95 downto 88);
	b3 <= in_orm(103 downto 96);
	b2 <= in_orm(111 downto 104);
	b1	<= in_orm(119 downto 112);
	b0 <= in_orm(127 downto 120);
	
	-- Se combinan tal y como se indica en el Paper para obetener los 4 conjuntos.
	C0 <= b3 & b2 & b1 & b0;
	C1 <= b7 & b6 & b5 & b4;
	C2 <= b11 & b10 & b9 & b8;
	C3 <= b15 & b14 & b13 & b12;

	out_orm <= C0 & C1 & C2 & C3;
	
end Output_R_M;

