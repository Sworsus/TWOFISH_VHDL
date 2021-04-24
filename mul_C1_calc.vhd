----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:38:13 04/24/2021 
-- Design Name: 
-- Module Name:    mul_C1_calc - mul_C1_calc 
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

entity mul_C1_calc is
	port (
			in_C1 : in STD_LOGIC_VECTOR (7 downto 0);
			out_C1 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_C1_calc;

architecture mul_C1_calc of mul_C1_calc is

begin

	out_C1(7) <= in_C1(7) XOR in_C1(6) XOR in_C1(4) XOR in_C1(3) XOR in_C1(2) XOR in_C1(1) XOR in_C1(0);
	out_C1(6) <= in_C1(6) XOR in_C1(5) XOR in_C1(3) XOR in_C1(2) XOR in_C1(1) XOR in_C1(0);
	out_C1(5) <= in_C1(7) XOR in_C1(6) XOR in_C1(5) XOR in_C1(3);
	out_C1(4) <= in_C1(6) XOR in_C1(5) XOR in_C1(4) XOR in_C1(2);
	out_C1(3) <= in_C1(5) XOR in_C1(4) XOR in_C1(3) XOR in_C1(1);
	out_C1(2) <= in_C1(6) XOR in_C1(1);
	out_C1(1) <= in_C1(6) XOR in_C1(5) XOR in_C1(4) XOR in_C1(3) XOR in_C1(2) XOR in_C1(1);
	out_C1(0) <= in_C1(7) XOR in_C1(5) XOR in_C1(4) XOR in_C1(3) XOR in_C1(2) XOR in_C1(1) XOR in_C1(0);

end mul_C1_calc;

