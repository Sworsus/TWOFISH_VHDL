----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:55:03 04/24/2021 
-- Design Name: 
-- Module Name:    mul_DB_calc - mul_DB_calc 
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

entity mul_DB_calc is
	port (
			in_DB : in STD_LOGIC_VECTOR (7 downto 0);
			out_DB : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_DB_calc;

architecture mul_DB_calc of mul_DB_calc is

begin

	out_DB(7) <= in_DB(6) XOR in_DB(5) XOR in_DB(2) XOR in_DB(1) XOR in_DB(0);
	out_DB(6) <= in_DB(7) XOR in_DB(5) XOR in_DB(4) XOR in_DB(1) XOR in_DB(0);
	out_DB(5) <= in_DB(7) XOR in_DB(5) XOR in_DB(4) XOR in_DB(3) XOR in_DB(2) XOR in_DB(1);
	out_DB(4) <= in_DB(6) XOR in_DB(4) XOR in_DB(3) XOR in_DB(2) XOR in_DB(1) XOR in_DB(0);
	out_DB(3) <= in_DB(5) XOR in_DB(3) XOR in_DB(2) XOR in_DB(1) XOR in_DB(0);
	out_DB(2) <= in_DB(7) XOR in_DB(6) XOR in_DB(5) XOR in_DB(4);
	out_DB(1) <= in_DB(7) XOR in_DB(4) XOR in_DB(3) XOR in_DB(2) XOR in_DB(1) XOR in_DB(0);
	out_DB(0) <= in_DB(7) XOR in_DB(6) XOR in_DB(3) XOR in_DB(2) XOR in_DB(1) XOR in_DB(0);

end mul_DB_calc;

