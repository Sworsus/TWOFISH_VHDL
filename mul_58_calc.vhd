----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:32:20 04/24/2021 
-- Design Name: 
-- Module Name:    mul_58_calc - mul_58_calc 
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

entity mul_58_calc is
	port (
			in_58 : in STD_LOGIC_VECTOR (7 downto 0);
			out_58 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_58_calc;

architecture mul_58_calc of mul_58_calc is

begin

	out_58(7) <= in_58(7) XOR in_58(4) XOR in_58(1);
	out_58(6) <= in_58(6) XOR in_58(3) XOR in_58(0);
	out_58(5) <= in_58(5) XOR in_58(4) XOR in_58(2) XOR in_58(1);
	out_58(4) <= in_58(7) XOR in_58(4) XOR in_58(3) XOR in_58(1) XOR in_58(0);
	out_58(3) <= in_58(6) XOR in_58(3) XOR in_58(2) XOR in_58(0);
	out_58(2) <= in_58(7) XOR in_58(5) XOR in_58(4) XOR in_58(2);
	out_58(1) <= in_58(6) XOR in_58(3);
	out_58(0) <= in_58(5) XOR in_58(2);

end mul_58_calc;

