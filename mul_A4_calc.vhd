----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:16 04/24/2021 
-- Design Name: 
-- Module Name:    mul_A4_calc - mul_A4_calc 
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

entity mul_A4_calc is
	port (
			in_A4 : in STD_LOGIC_VECTOR (7 downto 0);
			out_A4 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_A4_calc;

architecture mul_A4_calc of mul_A4_calc is

begin

	out_A4(7) <= in_A4(6) XOR in_A4(0);
	out_A4(6) <= in_A4(5);
	out_A4(5) <= in_A4(6) XOR in_A4(4) XOR in_A4(0);
	out_A4(4) <= in_A4(5) XOR in_A4(3);
	out_A4(3) <= in_A4(7) XOR in_A4(4) XOR in_A4(2);
	out_A4(2) <= in_A4(7) XOR in_A4(3) XOR in_A4(1) XOR in_A4(0);
	out_A4(1) <= in_A4(2);
	out_A4(0) <= in_A4(7) XOR in_A4(1);

end mul_A4_calc;

