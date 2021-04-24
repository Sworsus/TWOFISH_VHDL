----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:09:29 04/24/2021 
-- Design Name: 
-- Module Name:    mul_A1_calc - mul_A1_calc 
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

entity mul_A1_calc is
	port (
			in_A1 : in STD_LOGIC_VECTOR (7 downto 0);
			out_A1 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_A1_calc;

architecture mul_A1_calc of mul_A1_calc is

begin

	out_A1(7) <= in_A1(6) XOR in_A1(5) XOR in_A1(0);
	out_A1(6) <= in_A1(5) XOR in_A1(4);
	out_A1(5) <= in_A1(6) XOR in_A1(5) XOR in_A1(4) XOR in_A1(3) XOR in_A1(0);
	out_A1(4) <= in_A1(7) XOR in_A1(5) XOR in_A1(4) XOR in_A1(3) XOR in_A1(2);
	out_A1(3) <= in_A1(6) XOR in_A1(4) XOR in_A1(3) XOR in_A1(2) XOR in_A1(1);
	out_A1(2) <= in_A1(7) XOR in_A1(6) XOR in_A1(3) XOR in_A1(2) XOR in_A1(1);
	out_A1(1) <= in_A1(7) XOR in_A1(2) XOR in_A1(1);
	out_A1(0) <= in_A1(7) XOR in_A1(6) XOR in_A1(1) XOR in_A1(0);

end mul_A1_calc;

