----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:05:44 04/23/2021 
-- Design Name: 
-- Module Name:    mul_19_calc - mul_19_calc 
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

entity mul_19_calc is
	port (
			in_19 : in STD_LOGIC_VECTOR (7 downto 0);
			out_19 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_19_calc;

architecture mul_19_calc of mul_19_calc is

begin

	out_19(7) <= in_19(6) XOR in_19(5) XOR in_19(4) XOR in_19(3);
	out_19(6) <= in_19(5) XOR in_19(4) XOR in_19(3) XOR in_19(2);
	out_19(5) <= in_19(6) XOR in_19(5) XOR in_19(2) XOR in_19(1);
	out_19(4) <= in_19(5) XOR in_19(4) XOR in_19(1) XOR in_19(0);
	out_19(3) <= in_19(7) XOR in_19(4) XOR in_19(3) XOR in_19(0);
	out_19(2) <= in_19(5) XOR in_19(4) XOR in_19(2);
	out_19(1) <= in_19(7) XOR in_19(6) XOR in_19(5) XOR in_19(1);
	out_19(0) <= in_19(7) XOR in_19(6) XOR in_19(5) XOR in_19(4) XOR in_19(0);

end mul_19_calc;

