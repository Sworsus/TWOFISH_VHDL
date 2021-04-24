----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:02:49 04/24/2021 
-- Design Name: 
-- Module Name:    mul_55_calc - mul_55_calc 
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

entity mul_55_calc is
	port (
			in_55 : in STD_LOGIC_VECTOR (7 downto 0);
			out_55 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_55_calc;

architecture mul_55_calc of mul_55_calc is

begin

	out_55(7) <= in_55(7) XOR in_55(6) XOR in_55(5) XOR in_55(1);
	out_55(6) <= in_55(7) XOR in_55(6) XOR in_55(5) XOR in_55(4) XOR in_55(0);
	out_55(5) <= in_55(7) XOR in_55(4) XOR in_55(3) XOR in_55(1);
	out_55(4) <= in_55(7) XOR in_55(6) XOR in_55(3) XOR in_55(2) XOR in_55(0);
	out_55(3) <= in_55(6) XOR in_55(5) XOR in_55(2) XOR in_55(1);
	out_55(2) <= in_55(7) XOR in_55(6) XOR in_55(4) XOR in_55(0);
	out_55(1) <= in_55(7) XOR in_55(3) XOR in_55(1);
	out_55(0) <= in_55(7) XOR in_55(6) XOR in_55(2) XOR in_55(0);

end mul_55_calc;

