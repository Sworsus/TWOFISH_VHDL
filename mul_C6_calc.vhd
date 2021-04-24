----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:48:44 04/24/2021 
-- Design Name: 
-- Module Name:    mul_C6_calc - mul_C6_calc 
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

entity mul_C6_calc is
	port (
			in_C6 : in STD_LOGIC_VECTOR (7 downto 0);
			out_C6 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_C6_calc;

architecture mul_C6_calc of mul_C6_calc is

begin

	out_C6(7) <= in_C6(7) XOR in_C6(5) XOR in_C6(4) XOR in_C6(3) XOR in_C6(2) XOR in_C6(1) XOR in_C6(0);
	out_C6(6) <= in_C6(7) XOR in_C6(6) XOR in_C6(4) XOR in_C6(3) XOR in_C6(2) XOR in_C6(1) XOR in_C6(0);
	out_C6(5) <= in_C6(7) XOR in_C6(6) XOR in_C6(4);
	out_C6(4) <= in_C6(7) XOR in_C6(6) XOR in_C6(5) XOR in_C6(3);
	out_C6(3) <= in_C6(6) XOR in_C6(5) XOR in_C6(4) XOR in_C6(2);
	out_C6(2) <= in_C6(7) XOR in_C6(2) XOR in_C6(0);
	out_C6(1) <= in_C6(7) XOR in_C6(6) XOR in_C6(5) XOR in_C6(4) XOR in_C6(3) XOR in_C6(2) XOR in_C6(0);
	out_C6(0) <= in_C6(6) XOR in_C6(5) XOR in_C6(4) XOR in_C6(3) XOR in_C6(2) XOR in_C6(1);

end mul_C6_calc;

