----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:49:08 04/21/2021 
-- Design Name: 
-- Module Name:    mult_5B_calc - Behavioral 
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

entity mult_5B_calc is
	port (
			in_5B : in STD_LOGIC_VECTOR (7 downto 0);
			out_5B : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mult_5B_calc;

architecture mult_5B_calc of mult_5B_calc is
begin

	out_5B(7) <= in_5B(7) XOR in_5B(1);
	out_5B(6) <= in_5B(6) XOR in_5B(0);
	out_5B(5) <= in_5B(7) XOR in_5B(5) XOR in_5B(1);
	out_5B(4) <= in_5B(6) XOR in_5B(4) XOR in_5B(1) XOR in_5B(0);
	out_5B(3) <= in_5B(5) XOR in_5B(3) XOR in_5B(0);
	out_5B(2) <= in_5B(4) XOR in_5B(2) XOR in_5B(1);
	out_5B(1) <= in_5B(3) XOR in_5B(1) XOR in_5B(0);
	out_5B(0) <= in_5B(2) XOR in_5B(0);

end mult_5B_calc;
