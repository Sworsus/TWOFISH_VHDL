----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:10:12 04/24/2021 
-- Design Name: 
-- Module Name:    mul_56_calc - mul_56_calc 
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

entity mul_56_calc is
	port (
			in_56 : in STD_LOGIC_VECTOR (7 downto 0);
			out_56 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_56_calc;

architecture mul_56_calc of mul_56_calc is

begin

	out_56(7) <= in_56(5) XOR in_56(1);
	out_56(6) <= in_56(4) XOR in_56(0);
	out_56(5) <= in_56(7) XOR in_56(5) XOR in_56(3) XOR in_56(1);
	out_56(4) <= in_56(7) XOR in_56(6) XOR in_56(4) XOR in_56(2) XOR in_56(0);
	out_56(3) <= in_56(7) XOR in_56(6) XOR in_56(5) XOR in_56(3) XOR in_56(1);
	out_56(2) <= in_56(6) XOR in_56(4) XOR in_56(2) XOR in_56(1) XOR in_56(0);
	out_56(1) <= in_56(7) XOR in_56(3) XOR in_56(0);
	out_56(0) <= in_56(6) XOR in_56(2);

end mul_56_calc;

