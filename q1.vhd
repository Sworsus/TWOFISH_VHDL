----------------------------------------------------------------------------------
-- Company: Universidad Complutense de Madrid
-- Engineer: Rafael Jose Martin Pelaez
-- 
-- Create Date:    18:20:29 03/22/2021 
-- Design Name: 
-- Module Name:    q1_op 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--		Esta operacion q1 es igual a q0, cambian LUT
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity q1 is 
port (
		in_q1 : in STD_LOGIC_VECTOR (7 downto 0);
		out_q1 : out STD_LOGIC_VECTOR (7 downto 0)
		);	
end q1;

architecture q1_op of q1 is

	signal a0, b0, a1, b1, a2, b2, a3, b3, a4, b4 : STD_LOGIC_VECTOR (3 downto 0);
	signal a0_x8, b0_ror4, a2_x8, b2_ror4 : STD_LOGIC_VECTOR (3 downto 0);
	
-- Comienza la drescripcion del modulo
begin

	a0 <= in_q1(7 downto 4); 
	b0 <= in_q1(3 downto 0);
	
	a1 <= a0 XOR b0;
	
	a0_x8(2 downto 0) <= (others => '0');
	a0_x8(3) <= a0(0);
	
	b0_ror4(2 downto 0) <= b0(3 downto 1);
	b0_ror4(3) <= b0(0);
	
	b1 <= a0 XOR b0_ror4 XOR a0_x8;
	
	-- LUT t0
	-- t0 = [ 2 8 B D F 7 6 E 3 1 9 4 0 A C 5 ]
	with a1 select
		a2 <= "0010" when "0000", "1000" when "0001", "1011" when "0010",
			   "1101" when "0011", "1111" when "0100", "0111" when "0101",
			   "0110" when "0110", "1110" when "0111", "0011" when "1000",
			   "0001" when "1001", "1001" when "1010", "0100" when "1011",
			   "0000" when "1100", "1010" when "1101", "1100" when "1110", 
			   "0101" when others;

	-- LUT t1
	-- t1 = [ 1 E 2 B 4 C 3 7 6 D A 5 F 9 0 8 ]
	with b1 select
		b2 <=	"0001" when "0000", "1110" when "0001", "0010" when "0010",
				"1011" when "0011", "0100" when "0100", "1100" when "0101", 
				"0011" when "0110", "0111" when "0111", "0110" when "1000", 
				"1101" when "1001", "1010" when "1010", "0101" when "1011", 
				"1111" when "1100", "1001" when "1101", "0000" when "1110", 
				"1000" when others;
 
	a3 <= a2 XOR b2; 

	a2_x8(2 downto 0) <= (others => '0');
	a2_x8(3) <= a2(0);
	
	b2_ror4(2 downto 0) <= b2(3 downto 1);
	b2_ror4(3) <= b0(0);
	
	b3 <= a2 XOR b2_ror4 XOR a2_x8;
	
   -- LUT t2
	-- t2 = [ 4 C 7 5 1 6 9 A 0 E D 8 2 B 3 F ]
	with a3 select
		a4 <= "0100" when "0000", "1100" when "0001", "0111" when "0010",
			   "0101" when "0011", "0001" when "0100", "0110" when "0101",
			   "1001" when "0110", "1010" when "0111", "0000" when "1000",
			   "1110" when "1001", "1101" when "1010", "1000" when "1011",
			   "0010" when "1100", "1011" when "1101", "0011" when "1110", 
			   "1111" when others;

	-- LUT t3
	-- t3 = [ B 9 5 1 C 3 D E 6 4 7 F 2 0 8 A ]
	with b3 select
		b4 <=	"1011" when "0000", "1001" when "0001", "0101" when "0010",
				"0001" when "0011", "1100" when "0100", "0011" when "0101", 
				"1101" when "0110", "1110" when "0111", "0110" when "1000", 
				"0100" when "1001", "0111" when "1010", "1111" when "1011", 
				"0010" when "1100", "0000" when "1101", "1000" when "1110", 
				"1010" when others;
 
	-- Salida de q1
	out_q1 <= b4 & a4;

end q1_op;