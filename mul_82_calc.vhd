----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:22:27 04/24/2021 
-- Design Name: 
-- Module Name:    mul_82_calc - mul_82_calc 
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

entity mul_82_calc is
	port (
			in_82 : in STD_LOGIC_VECTOR (7 downto 0);
			out_82 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_82_calc;

architecture mul_82_calc of mul_82_calc is

begin

		out_82(7) <= in_82(6) XOR in_82(5) XOR in_82(4) XOR in_82(2) XOR in_82(0);
		out_82(6) <= in_82(7) XOR in_82(5) XOR in_82(4) XOR in_82(3) XOR in_82(1);
		out_82(5) <= in_82(7) XOR in_82(5) XOR in_82(3);
		out_82(4) <= in_82(7) XOR in_82(6) XOR in_82(4) XOR in_82(2);
		out_82(3) <= in_82(6) XOR in_82(5) XOR in_82(3) XOR in_82(1);
		out_82(2) <= in_82(6);
		out_82(1) <= in_82(7) XOR in_82(6) XOR in_82(4) XOR in_82(2) XOR in_82(0);
		out_82(0) <= in_82(7) XOR in_82(6) XOR in_82(5) XOR in_82(3) XOR in_82(1);

end mul_82_calc;

