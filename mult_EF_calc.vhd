----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:25 04/21/2021 
-- Design Name: 
-- Module Name:    mult_EF_calc - Behavioral 
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

entity mult_EF_calc is
	port (
			in_EF : in STD_LOGIC_VECTOR (7 downto 0);
			out_EF : out STD_LOGIC_VECTOR (7 downto 0)
			);	
end mult_EF_calc;

architecture mult_EF_calc of mult_EF_calc is
begin

	out_EF(7) <= in_EF(7) XOR in_EF(1) XOR in_EF(0);
	out_EF(6) <= in_EF(7) XOR in_EF(6) XOR in_EF(0);
	out_EF(5) <= in_EF(7) XOR in_EF(6) XOR in_EF(5) XOR in_EF(1) XOR in_EF(0);
	out_EF(4) <= in_EF(6) XOR in_EF(5) XOR in_EF(4) XOR in_EF(1);
	out_EF(3) <= in_EF(5) XOR in_EF(4) XOR in_EF(3) XOR in_EF(0);
	out_EF(2) <= in_EF(4) XOR in_EF(3) XOR in_EF(2) XOR in_EF(1) XOR in_EF(0);
	out_EF(1) <= in_EF(3) XOR in_EF(2) XOR in_EF(1) XOR in_EF(0);
	out_EF(0) <= in_EF(2) XOR in_EF(1) XOR in_EF(0);
	
end mult_EF_calc;
