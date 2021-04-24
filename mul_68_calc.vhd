----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:10:57 04/24/2021 
-- Design Name: 
-- Module Name:    mul_68_calc - mul_68_calc 
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

entity mul_68_calc is
	port (
			in_68 : in STD_LOGIC_VECTOR (7 downto 0);
			out_68 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_68_calc;

architecture mul_68_calc of mul_68_calc is

begin

	out_68(7) <= in_68(7) XOR in_68(6) XOR in_68(5) XOR in_68(3) XOR in_68(2) XOR in_68(1);
	out_68(6) <= in_68(7) XOR in_68(6) XOR in_68(5) XOR in_68(4) XOR in_68(2) XOR in_68(1) XOR in_68(0);
	out_68(5) <= in_68(4) XOR in_68(2) XOR in_68(0);
	out_68(4) <= in_68(3) XOR in_68(1);
	out_68(3) <= in_68(7) XOR in_68(2) XOR in_68(0);
	out_68(2) <= in_68(7) XOR in_68(5) XOR in_68(3) XOR in_68(2);
	out_68(1) <= in_68(7) XOR in_68(5) XOR in_68(4) XOR in_68(3);
	out_68(0) <= in_68(7) XOR in_68(2) XOR in_68(4) XOR in_68(3) XOR in_68(2);

end mul_68_calc;

