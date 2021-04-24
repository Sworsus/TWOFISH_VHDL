----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:41:38 04/24/2021 
-- Design Name: 
-- Module Name:    mul_5A_calc - mul_5A_calc 
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

entity mul_5A_calc is
	port (
			in_5A : in STD_LOGIC_VECTOR (7 downto 0);
			out_5A : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_5A_calc;

architecture mul_5A_calc of mul_5A_calc is

begin

	out_5A(7) <= in_5A(7) XOR in_5A(6) XOR in_5A(4) XOR in_5A(1);
	out_5A(6) <= in_5A(7) XOR in_5A(6) XOR in_5A(5) XOR in_5A(3) XOR in_5A(0);
	out_5A(5) <= in_5A(5) XOR in_5A(2) XOR in_5A(1);
	out_5A(4) <= in_5A(7) XOR in_5A(4) XOR in_5A(1) XOR in_5A(0);
	out_5A(3) <= in_5A(7) XOR in_5A(6) XOR in_5A(3) XOR in_5A(0);
	out_5A(2) <= in_5A(5) XOR in_5A(4) XOR in_5A(2) XOR in_5A(1);
	out_5A(1) <= in_5A(6) XOR in_5A(3) XOR in_5A(0);
	out_5A(0) <= in_5A(7) XOR in_5A(5) XOR in_5A(2);
	

end mul_5A_calc;

