----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:46:10 04/24/2021 
-- Design Name: 
-- Module Name:    mul_9E_calc - mul_9E_calc 
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

entity mul_9E_calc is
	port (
			in_9E : in STD_LOGIC_VECTOR (7 downto 0);
			out_9E : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_9E_calc;

architecture mul_9E_calc of mul_9E_calc is

begin

	out_9E(7) <= in_9E(5) XOR in_9E(3) XOR in_9E(2) XOR in_9E(0);
	out_9E(6) <= in_9E(7) XOR in_9E(4) XOR in_9E(2) XOR in_9E(1);
	out_9E(5) <= in_9E(7) XOR in_9E(6) XOR in_9E(5) XOR in_9E(2) XOR in_9E(1);
	out_9E(4) <= in_9E(6) XOR in_9E(5) XOR in_9E(4) XOR in_9E(1) XOR in_9E(0);
	out_9E(3) <= in_9E(5) XOR in_9E(4) XOR in_9E(3) XOR in_9E(0);
	out_9E(2) <= in_9E(5) XOR in_9E(4) XOR in_9E(0);
	out_9E(1) <= in_9E(7) XOR in_9E(5) XOR in_9E(4) XOR in_9E(2) XOR in_9E(0);
	out_9E(0) <= in_9E(6) XOR in_9E(4) XOR in_9E(3) XOR in_9E(1);

end mul_9E_calc;

