----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:35 04/24/2021 
-- Design Name: 
-- Module Name:    mul_87_calc - mul_87_calc 
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

entity mul_87_calc is
	port (
			in_87 : in STD_LOGIC_VECTOR (7 downto 0);
			out_87 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_87_calc;

architecture mul_87_calc of mul_87_calc is

begin
	
	out_87(7) <= in_87(6) XOR in_87(4)  XOR in_87(2)  XOR in_87(0);
	out_87(6) <= in_87(7) XOR in_87(5)  XOR in_87(3)  XOR in_87(1);
	out_87(5) <= in_87(7);
	out_87(4) <= in_87(6);
	out_87(3) <= in_87(7) XOR in_87(5);
	out_87(2) <= in_87(2) XOR in_87(0);
	out_87(1) <= in_87(6) XOR in_87(4)  XOR in_87(2)  XOR in_87(1)  XOR in_87(0);
	out_87(0) <= in_87(7) XOR in_87(5)  XOR in_87(3)  XOR in_87(1)  XOR in_87(0);

end mul_87_calc;

