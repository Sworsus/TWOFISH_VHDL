----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:25:52 04/23/2021 
-- Design Name: 
-- Module Name:    mul_3D_calc - mul_3D_calc 
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

entity mul_3D_calc is
	port (
			in_3D : in STD_LOGIC_VECTOR (7 downto 0);
			out_3D : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_3D_calc;

architecture mul_3D_calc of mul_3D_calc is

begin
	
		out_1E(7) <= in_1E(3) XOR in_1E(2);
		out_1E(6) <= in_1E(2) XOR in_1E(1);
		out_1E(5) <= in_1E(7) XOR in_1E(3) XOR in_1E(2) XOR in_1E(1) XOR in_1E(0);
		out_1E(4) <= in_1E(7) XOR in_1E(6) XOR in_1E(2) XOR in_1E(1) XOR in_1E(0);
		out_1E(3) <= in_1E(7) XOR in_1E(6) XOR in_1E(5) XOR in_1E(1) XOR in_1E(0);
		out_1E(2) <= in_1E(6) XOR in_1E(5) XOR in_1E(4) XOR in_1E(3) XOR in_1E(2) XOR in_1E(0);
		out_1E(1) <= in_1E(5) XOR in_1E(4) XOR in_1E(1);
		out_1E(0) <= in_1E(4) XOR in_1E(3) XOR in_1E(0);

end mul_3D_calc;

