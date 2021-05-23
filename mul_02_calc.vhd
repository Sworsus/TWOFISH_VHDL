----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:20 04/23/2021 
-- Design Name: 
-- Module Name:    mul_02_calc - mul_02_calc 
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

entity mul_02_calc is
	port	(
			in_02	: in std_logic_vector(7 downto 0);
			out_02 : out std_logic_vector(7 downto 0)
			);
end mul_02_calc;

architecture mul_02_calc of mul_02_calc is

begin

	out_02(7) <= in_02(6);
	out_02(6) <= in_02(7) XOR in_02(5);
	out_02(5) <= in_02(4);
	out_02(4) <= in_02(3);
	out_02(3) <= in_02(7) XOR in_02(2);
	out_02(2) <= in_02(7) XOR in_02(1);
	out_02(1) <= in_02(0);
	out_02(0) <= in_02(7);

end mul_02_calc;

