----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:57:39 04/23/2021 
-- Design Name: 
-- Module Name:    mul_03_calc - mul_03_calc 
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

entity mul_03_calc is
	port	(
			in_03	: in STD_LOGIC_VECTOR(7 DOWNTO 0);
			out_03 : out STD_LOGIC_VECTOR(7 DOWNTO 0)
			);
end mul_03_calc;

architecture mul_03_calc of mul_03_calc is

begin

	out_03(7) <= in_03(7) XOR in_03(6);
	out_03(6) <= in_03(7) XOR in_03(6) XOR in_03(5);
	out_03(5) <= in_03(5) XOR in_03(4);
	out_03(4) <= in_03(4) XOR in_03(3);
	out_03(3) <= in_03(7) XOR in_03(3) XOR in_03(2);
	out_03(2) <= in_03(7) XOR in_03(2) XOR in_03(1);
	out_03(1) <= in_03(1) XOR in_03(0);
	out_03(0) <= in_03(7) XOR in_03(0);

end mul_03_calc;

