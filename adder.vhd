----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:10:02 05/21/2021 
-- Design Name: 
-- Module Name:    adder - adder_behave 
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

entity adder_v1 is
        port(
				a, b, cin: in std_logic;
				result, cout: out std_logic
				);
end adder_v1;

architecture adder_v1_behave of adder_v1 is

begin

	result <= a XOR b XOR cin;
	cout <= (a AND b) OR (cin AND (a XOR b));
						
end adder_v1_behave;

