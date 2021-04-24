----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:25 04/24/2021 
-- Design Name: 
-- Module Name:    mul_FC_calc - mul_FC_calc 
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

entity mul_FC_calc is
	port (
			in_FC : in STD_LOGIC_VECTOR (7 downto 0);
			out_FC : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_FC_calc;

architecture mul_FC_calc of mul_FC_calc is

begin

		out_FC(7) <= in_FC(7) XOR in_FC(6) XOR in_FC(4) XOR in_FC(1) XOR in_FC(0);
		out_FC(6) <= in_FC(6) XOR in_FC(5) XOR in_FC(3) XOR in_FC(0);
		out_FC(5) <= in_FC(6) XOR in_FC(5) XOR in_FC(2) XOR in_FC(1) XOR in_FC(0);
		out_FC(4) <= in_FC(7) XOR in_FC(5) XOR in_FC(4) XOR in_FC(1) XOR in_FC(0);
		out_FC(3) <= in_FC(7) XOR in_FC(6) XOR in_FC(4) XOR in_FC(3) XOR in_FC(0);
		out_FC(2) <= in_FC(5) XOR in_FC(4) XOR in_FC(3) XOR in_FC(2) XOR in_FC(1) XOR in_FC(0);
		out_FC(1) <= in_FC(6) XOR in_FC(3) XOR in_FC(2);
		out_FC(0) <= in_FC(7) XOR in_FC(5) XOR in_FC(2) XOR in_FC(1);

end mul_FC_calc;

