----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:43 05/11/2021 
-- Design Name: 
-- Module Name:    mul_01 - mul_01 
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

entity mul_01 is
	port	(
			in_01	: in std_logic_vector(7 downto 0);
			out_01 : out std_logic_vector(7 downto 0)
			);
end mul_01;

architecture mul_01 of mul_01 is

begin

	out_01 <= in_01;

end mul_01;

