----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:54 05/21/2021 
-- Design Name: 
-- Module Name:    PHT - PHT 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PHT_v1 is
	port (
			in_top_pht, in_bot_pht : in std_logic_vector(31 downto 0);
			out_top_pht, out_bot_pht : out std_logic_vector(31 downto 0)
			);
end PHT_v1;

architecture PHT_v1 of PHT_v1 is

	signal carry1, carry2, to_top : std_logic_vector(31 downto 0);

	component adder_v1
		port (
				a, b, cin : in std_logic;
				result, cout : out std_logic
				);
	end component;

begin
	
	-- Se crea el sumador de arriba 
	top_adder: 
		for i in 0 to 31 generate
			adder_z:
				if i = 0 generate
					adderTOP1: adder_v1
					port map(
								a => in_top_pht(0),
								b => in_bot_pht(0),
								cin => '0',
								result => to_top(0),
								cout => carry1(0)
								);
			end generate adder_z;
			adder_r:
				if i > 0 generate
					adderTOP2: adder_v1
					port map(
								a => in_top_pht(i),
								b => in_bot_pht(i),
								cin => carry1(i-1),
								result => to_top(i),
								cout => carry1(i)
								);
			end generate adder_r;
	end generate top_adder;
	
	carry1(31) <= '0';

	-- Se recive la salida del sumador de arriba
	
	-- Se crea el sumador de abajo
	bot_adder: 
		for i in 0 to 31 generate
			adder_z:
				if i = 0 generate
					adderBOT1: adder_v1
					port map(
								a => in_top_pht(0),
								b => in_bot_pht(0),
								cin => '0',
								result => to_top(0),
								cout => carry2(0)
								);
			end generate adder_z;
			adder_r:
				if i > 0 generate
					adderBOT2: adder_v1
					port map(
								a => in_top_pht(i),
								b => in_bot_pht(i),
								cin => carry2(i-1),
								result => to_top(i),
								cout => carry2(i)
								);
			end generate adder_r;
	end generate bot_adder;

	carry2(31) <= '0';

end PHT_v1;

