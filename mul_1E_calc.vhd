----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:16:07 04/23/2021 
-- Design Name: 
-- Module Name:    mul_1E_calc - mul_1E_calc 
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

entity mul_1E_calc is
	port (
			in_1E : in STD_LOGIC_VECTOR (7 downto 0);
			out_1E : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_1E_calc;

architecture mul_1E_calc of mul_1E_calc is

begin

	out_1E(7) <= in_1E(4) XOR in_1E(3);
	out_1E(6) <= in_1E(7) XOR in_1E(3) XOR in_1E(2);
	out_1E(5) <= in_1E(6) XOR in_1E(4) XOR in_1E(3) XOR in_1E(4) XOR in_1E(1);
	out_1E(4) <= in_1E(7) XOR in_1E(5) XOR in_1E(3) XOR in_1E(2) XOR in_1E(1) XOR in_1E(0);
	out_1E(3) <= in_1E(7) XOR in_1E(6) XOR in_1E(4) XOR in_1E(2) XOR in_1E(1) XOR in_1E(0);
	out_1E(2) <= in_1E(7) XOR in_1E(6) XOR in_1E(5) XOR in_1E(2) XOR in_1E(1) XOR in_1E(0);
	out_1E(1) <= in_1E(6) XOR in_1E(5) XOR in_1E(0);
	out_1E(0) <= in_1E(5) XOR in_1E(4);

end mul_1E_calc;

