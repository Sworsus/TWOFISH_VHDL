----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:49 04/24/2021 
-- Design Name: 
-- Module Name:    mul_E5_calc - mul_E5_calc 
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

entity mul_E5_calc is
	port (
			in_E5 : in STD_LOGIC_VECTOR (7 downto 0);
			out_E5 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_E5_calc;

architecture mul_E5_calc of mul_E5_calc is

begin

		out_E5(7) <= in_E5(7) XOR in_E5(5) XOR in_E5(3) XOR in_E5(1) XOR in_E5(0);
		out_E5(6) <= in_E5(6) XOR in_E5(4) XOR in_E5(2) XOR in_E5(0);
		out_E5(5) <= in_E5(0);
		out_E5(4) <= in_E5(7);
		out_E5(3) <= in_E5(6);
		out_E5(2) <= in_E5(3) XOR in_E5(1) XOR in_E5(0);
		out_E5(1) <= in_E5(7) XOR in_E5(5) XOR in_E5(3) XOR in_E5(2) XOR in_E5(1);
		out_E5(0) <= in_E5(6) XOR in_E5(4) XOR in_E5(2) XOR in_E5(1) XOR in_E5(0);

end mul_E5_calc;

