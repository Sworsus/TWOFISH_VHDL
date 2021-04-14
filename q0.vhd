----------------------------------------------------------------------------------
-- Company: Universidad Complutense de Madrid
-- Engineer: Rafael Jose Martin Pelaez
-- 
-- Create Date:    18:20:29 03/22/2021 
-- Design Name: 
-- Module Name:    q0_op 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--		Hace la operacion correspondiente a 'q0', perteneciente a la funcion 'h'
--		del algoritmo de encriptado twofish
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity q0 is 
port (
		in_q0 : in STD_LOGIC_VECTOR (7 downto 0);
		out_q0 : out STD_LOGIC_VECTOR (7 downto 0)
		);	
end q0;

architecture q0_op of q0 is

	-- Se declaran las senales utilizadas internamente
	signal a0, b0, a1, b1, a2, b2, a3, b3, a4, b4 : STD_LOGIC_VECTOR (3 downto 0);
	-- Las senales '_ror4' son aquellas a las que se les hace una rotacion
	-- las senales '_x' son quellas qu se modifican siendo multiplicadas
	signal a0_x8, b0_ror4, a2_x8, b2_ror4 : STD_LOGIC_VECTOR (3 downto 0);
	
-- Comienza la drescripcion del modulo
begin

	-- little endian
	a0 <= in_q0(7 downto 4); 
	b0 <= in_q0(3 downto 0); -- Se usa little endian porque las look-up-tables t0, t1, t2 y t3
									 -- tienen 4 bits de entrada y generan 4 bits de salida,
									 -- y por tanto hay que dividir el byte en a0 y b0.
	a1 <= a0 XOR b0;
	
	-- Se multiplica a0 por 8, aunque en vez de utilizar una multiplicacion es mas sencillo
	-- hacer un desplazamiento y relleno con 0, siguiendo la igualdad 8*a0 = 2^3*a0 = a0 << 3
	a0_x8(2 downto 0) <= (others => '0');
	a0_x8(3) <= a0(0);
	
	-- Se rotan los bits de b0 1 vez a la derecha
	b0_ror4(2 downto 0) <= b0(3 downto 1);
	b0_ror4(3) <= b0(0);
	--b0_ror4 <= b0 ror 4;
	
	-- Se calcula b1 haciendo XOR de los desplazamientos hechos sobre a0 y b0
	b1 <= a0 XOR b0_ror4 XOR a0_x8;
	
	-- Las tablas estan en hexadecimal, pero es mas sencillo si se traduce a binario
	-- LUT t0 -> con esta tabla se obtiene a2 a partir de a1
	-- t0 = [ 8 1 7 D 6 F 3 2 0 B 5 9 E C A 4 ]
	with a1 select
		a2 <= "1000" when "0000", "0001" when "0001", "0111" when "0010",
			   "1101" when "0011", "0110" when "0100", "1111" when "0101",
			   "0011" when "0110", "0010" when "0111", "0000" when "1000",
			   "1011" when "1001", "0101" when "1010", "1001" when "1011",
			   "1110" when "1100", "1100" when "1101", "1010" when "1110", 
			   "0100" when others;

	-- LUT t1 -> con esta tabla se obtiene b2 a partir de b1
	-- t1 = [ E C B 8 1 2 3 5 F 4 A 6 7 0 9 D ]
	with b1 select
		b2 <=	"1110" when "0000", "1100" when "0001", "1011" when "0010",
				"1000" when "0011", "0001" when "0100", "0010" when "0101", 
				"0011" when "0110", "0101" when "0111", "1111" when "1000", 
				"0100" when "1001", "1010" when "1010", "0110" when "1011", 
				"0111" when "1100", "0000" when "1101", "1001" when "1110", 
				"1101" when others;
 
	-- Se calcula a3 haciendo la XOR de las senales obtenidas a partir de las tablas
	a3 <= a2 XOR b2; 

	-- Se va a repetir el proceso anterior otr vez hasta obtener la senal out_q0
	
	a2_x8(2 downto 0) <= (others => '0');
	a2_x8(3) <= a2(0);
	
	b2_ror4(2 downto 0) <= b2(3 downto 1);
	b2_ror4(3) <= b0(0);
	
	b3 <= a2 XOR b2_ror4 XOR a2_x8;
	
   -- LUT t2
	-- t2 = [ B A 5 E 6 D 9 0 C 8 F 3 2 4 7 1 ]
	with a3 select
		a4 <= "1011" when "0000", "1010" when "0001", "0101" when "0010",
			   "1110" when "0011", "0110" when "0100", "1101" when "0101",
			   "1001" when "0110", "0000" when "0111", "1100" when "1000",
			   "1000" when "1001", "1111" when "1010", "0011" when "1011",
			   "0010" when "1100", "0100" when "1101", "0111" when "1110", 
			   "0001" when others;

	-- LUT t3
	-- t3 = [ D 7 F 4 1 2 6 E 9 B 3 0 8 5 C A ]
	with b3 select
		b4 <=	"1101" when "0000", "0111" when "0001", "1111" when "0010",
				"0100" when "0011", "0001" when "0100", "0010" when "0101", 
				"0110" when "0110", "1110" when "0111", "1001" when "1000", 
				"1011" when "1001", "0011" when "1010", "0000" when "1011", 
				"1000" when "1100", "0101" when "1101", "1100" when "1110", 
				"1010" when others;
 
	-- Salida de q0
	out_q0 <= b4 & a4;

end q0_op;
