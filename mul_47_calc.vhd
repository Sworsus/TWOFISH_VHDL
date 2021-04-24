----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:42:02 04/24/2021 
-- Design Name: 
-- Module Name:    mul_47_calc - mul_47_calc 
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

entity mul_47_calc is
	port (
			in_47 : in STD_LOGIC_VECTOR (7 downto 0);
			out_47 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_47_calc;

architecture mul_47_calc of mul_47_calc is

begin

		out_47(7) <= in_47(3) XOR in_47(1);
		out_47(6) <= in_47(7) XOR in_47(2) XOR in_47(0);
		out_47(5) <= in_47(6) XOR in_47(3);
		out_47(4) <= in_47(5) XOR in_47(2);
		out_47(3) <= in_47(7) XOR in_47(4) XOR in_47(1);
		out_47(2) <= in_47(6) XOR in_47(1) XOR in_47(0);
		out_47(1) <= in_47(5) XOR in_47(3) XOR in_47(1) XOR in_47(0);
		out_47(0) <= in_47(4) XOR in_47(2) XOR in_47(0);

end mul_47_calc;

