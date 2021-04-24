----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:33 04/24/2021 
-- Design Name: 
-- Module Name:    mul_F3_calc - mul_F3_calc 
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

entity mul_F3_calc is
	port (
			in_F3 : in STD_LOGIC_VECTOR (7 downto 0);
			out_F3 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_F3_calc;

architecture mul_F3_calc of mul_F3_calc is

begin

		out_F3(7) <= in_F3(7) XOR in_F3(6) XOR in_F3(5) XOR in_F3(1) XOR in_F3(0);
		out_F3(6) <= in_F3(6) XOR in_F3(5) XOR in_F3(4) XOR in_F3(0);
		out_F3(5) <= in_F3(7) XOR in_F3(6) XOR in_F3(4) XOR in_F3(3) XOR in_F3(1) XOR in_F3(0);
		out_F3(4) <= in_F3(7) XOR in_F3(6) XOR in_F3(5) XOR in_F3(3) XOR in_F3(2) XOR in_F3(0);
		out_F3(3) <= in_F3(6) XOR in_F3(5) XOR in_F3(4) XOR in_F3(2) XOR in_F3(1);
		out_F3(2) <= in_F3(7) XOR in_F3(6) XOR in_F3(4) XOR in_F3(3);
		out_F3(1) <= in_F3(7) XOR in_F3(3) XOR in_F3(2) XOR in_F3(1) XOR in_F3(0);
		out_F3(0) <= in_F3(7) XOR in_F3(6) XOR in_F3(2) XOR in_F3(1) XOR in_F3(0);

end mul_F3_calc;

