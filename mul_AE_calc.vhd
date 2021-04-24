----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:39 04/24/2021 
-- Design Name: 
-- Module Name:    mul_AE_calc - mul_AE_calc 
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

entity mul_AE_calc is
	port (
			in_AE : in STD_LOGIC_VECTOR (7 downto 0);
			out_AE : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_AE_calc;

architecture mul_AE_calc of mul_AE_calc is

begin

		out_AE(7) <= in_AE(6) XOR in_AE(4) XOR in_AE(0);
		out_AE(6) <= in_AE(5) XOR in_AE(3);
		out_AE(5) <= in_AE(7) XOR in_AE(6) XOR in_AE(2) XOR in_AE(0);
		out_AE(4) <= in_AE(7) XOR in_AE(6) XOR in_AE(5) XOR in_AE(1);
		out_AE(3) <= in_AE(7) XOR in_AE(6) XOR in_AE(5) XOR in_AE(4) XOR in_AE(0);
		out_AE(2) <= in_AE(5) XOR in_AE(3) XOR in_AE(0);
		out_AE(1) <= in_AE(6) XOR in_AE(2) XOR in_AE(0);
		out_AE(0) <= in_AE(7) XOR in_AE(5) XOR in_AE(1);

end mul_AE_calc;

