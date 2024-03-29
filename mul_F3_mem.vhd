----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:19 04/24/2021 
-- Design Name: 
-- Module Name:    mul_F3_mem - mul_F3_mem 
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

entity mul_F3_mem is
	port (
			in_F3 : in STD_LOGIC_VECTOR (7 downto 0);
			out_F3 : out STD_LOGIC_VECTOR (7 downto 0)
			);
end mul_F3_mem;

architecture mul_F3_mem of mul_F3_mem is

begin
	
	with in_F3 select
	out_F3 <= "00000000" when "00000000", 
				"11110011" when "00000001", 
				"10001111" when "00000010", 
				"01111100" when "00000011", 
				"01110111" when "00000100", 
				"10000100" when "00000101", 
				"11111000" when "00000110", 
				"00001011" when "00000111", 
				"11101110" when "00001000", 
				"00011101" when "00001001", 
				"01100001" when "00001010", 
				"10010010" when "00001011", 
				"10011001" when "00001100", 
				"01101010" when "00001101", 
				"00010110" when "00001110", 
				"11100101" when "00001111", 
				"10110101" when "00010000", 
				"01000110" when "00010001", 
				"00111010" when "00010010", 
				"11001001" when "00010011", 
				"11000010" when "00010100", 
				"00110001" when "00010101", 
				"01001101" when "00010110", 
				"10111110" when "00010111", 
				"01011011" when "00011000", 
				"10101000" when "00011001", 
				"11010100" when "00011010", 
				"00100111" when "00011011", 
				"00101100" when "00011100", 
				"11011111" when "00011101", 
				"10100011" when "00011110", 
				"01010000" when "00011111", 
				"00000011" when "00100000", 
				"11110000" when "00100001", 
				"10001100" when "00100010", 
				"01111111" when "00100011", 
				"01110100" when "00100100", 
				"10000111" when "00100101", 
				"11111011" when "00100110", 
				"00001000" when "00100111", 
				"11101101" when "00101000", 
				"00011110" when "00101001", 
				"01100010" when "00101010", 
				"10010001" when "00101011", 
				"10011010" when "00101100", 
				"01101001" when "00101101", 
				"00010101" when "00101110", 
				"11100110" when "00101111", 
				"10110110" when "00110000", 
				"01000101" when "00110001", 
				"00111001" when "00110010", 
				"11001010" when "00110011", 
				"11000001" when "00110100", 
				"00110010" when "00110101", 
				"01001110" when "00110110", 
				"10111101" when "00110111", 
				"01011000" when "00111000", 
				"10101011" when "00111001", 
				"11010111" when "00111010", 
				"00100100" when "00111011", 
				"00101111" when "00111100", 
				"11011100" when "00111101", 
				"10100000" when "00111110", 
				"01010011" when "00111111", 
				"00000110" when "01000000", 
				"11110101" when "01000001", 
				"10001001" when "01000010", 
				"01111010" when "01000011", 
				"01110001" when "01000100", 
				"10000010" when "01000101", 
				"11111110" when "01000110", 
				"00001101" when "01000111", 
				"11101000" when "01001000", 
				"00011011" when "01001001", 
				"01100111" when "01001010", 
				"10010100" when "01001011", 
				"10011111" when "01001100", 
				"01101100" when "01001101", 
				"00010000" when "01001110", 
				"11100011" when "01001111", 
				"10110011" when "01010000", 
				"01000000" when "01010001", 
				"00111100" when "01010010", 
				"11001111" when "01010011", 
				"11000100" when "01010100", 
				"00110111" when "01010101", 
				"01001011" when "01010110", 
				"10111000" when "01010111", 
				"01011101" when "01011000", 
				"10101110" when "01011001", 
				"11010010" when "01011010", 
				"00100001" when "01011011", 
				"00101010" when "01011100", 
				"11011001" when "01011101", 
				"10100101" when "01011110", 
				"01010110" when "01011111", 
				"00000101" when "01100000", 
				"11110110" when "01100001", 
				"10001010" when "01100010", 
				"01111001" when "01100011", 
				"01110010" when "01100100", 
				"10000001" when "01100101", 
				"11111101" when "01100110", 
				"00001110" when "01100111", 
				"11101011" when "01101000", 
				"00011000" when "01101001", 
				"01100100" when "01101010", 
				"10010111" when "01101011", 
				"10011100" when "01101100", 
				"01101111" when "01101101", 
				"00010011" when "01101110", 
				"11100000" when "01101111", 
				"10110000" when "01110000", 
				"01000011" when "01110001", 
				"00111111" when "01110010", 
				"11001100" when "01110011", 
				"11000111" when "01110100", 
				"00110100" when "01110101", 
				"01001000" when "01110110", 
				"10111011" when "01110111", 
				"01011110" when "01111000", 
				"10101101" when "01111001", 
				"11010001" when "01111010", 
				"00100010" when "01111011", 
				"00101001" when "01111100", 
				"11011010" when "01111101", 
				"10100110" when "01111110", 
				"01010101" when "01111111", 
				"00001100" when "10000000", 
				"11111111" when "10000001", 
				"10000011" when "10000010", 
				"01110000" when "10000011", 
				"01111011" when "10000100", 
				"10001000" when "10000101", 
				"11110100" when "10000110", 
				"00000111" when "10000111", 
				"11100010" when "10001000", 
				"00010001" when "10001001", 
				"01101101" when "10001010", 
				"10011110" when "10001011", 
				"10010101" when "10001100", 
				"01100110" when "10001101", 
				"00011010" when "10001110", 
				"11101001" when "10001111", 
				"10111001" when "10010000", 
				"01001010" when "10010001", 
				"00110110" when "10010010", 
				"11000101" when "10010011", 
				"11001110" when "10010100", 
				"00111101" when "10010101", 
				"01000001" when "10010110", 
				"10110010" when "10010111", 
				"01010111" when "10011000", 
				"10100100" when "10011001", 
				"11011000" when "10011010", 
				"00101011" when "10011011", 
				"00100000" when "10011100", 
				"11010011" when "10011101", 
				"10101111" when "10011110", 
				"01011100" when "10011111", 
				"00001111" when "10100000", 
				"11111100" when "10100001", 
				"10000000" when "10100010", 
				"01110011" when "10100011", 
				"01111000" when "10100100", 
				"10001011" when "10100101", 
				"11110111" when "10100110", 
				"00000100" when "10100111", 
				"11100001" when "10101000", 
				"00010010" when "10101001", 
				"01101110" when "10101010", 
				"10011101" when "10101011", 
				"10010110" when "10101100", 
				"01100101" when "10101101", 
				"00011001" when "10101110", 
				"11101010" when "10101111", 
				"10111010" when "10110000", 
				"01001001" when "10110001", 
				"00110101" when "10110010", 
				"11000110" when "10110011", 
				"11001101" when "10110100", 
				"00111110" when "10110101", 
				"01000010" when "10110110", 
				"10110001" when "10110111", 
				"01010100" when "10111000", 
				"10100111" when "10111001", 
				"11011011" when "10111010", 
				"00101000" when "10111011", 
				"00100011" when "10111100", 
				"11010000" when "10111101", 
				"10101100" when "10111110", 
				"01011111" when "10111111", 
				"00001010" when "11000000", 
				"11111001" when "11000001", 
				"10000101" when "11000010", 
				"01110110" when "11000011", 
				"01111101" when "11000100", 
				"10001110" when "11000101", 
				"11110010" when "11000110", 
				"00000001" when "11000111", 
				"11100100" when "11001000", 
				"00010111" when "11001001", 
				"01101011" when "11001010", 
				"10011000" when "11001011", 
				"10010011" when "11001100", 
				"01100000" when "11001101", 
				"00011100" when "11001110", 
				"11101111" when "11001111", 
				"10111111" when "11010000", 
				"01001100" when "11010001", 
				"00110000" when "11010010", 
				"11000011" when "11010011", 
				"11001000" when "11010100", 
				"00111011" when "11010101", 
				"01000111" when "11010110", 
				"10110100" when "11010111", 
				"01010001" when "11011000", 
				"10100010" when "11011001", 
				"11011110" when "11011010", 
				"00101101" when "11011011", 
				"00100110" when "11011100", 
				"11010101" when "11011101", 
				"10101001" when "11011110", 
				"01011010" when "11011111", 
				"00001001" when "11100000", 
				"11111010" when "11100001", 
				"10000110" when "11100010", 
				"01110101" when "11100011", 
				"01111110" when "11100100", 
				"10001101" when "11100101", 
				"11110001" when "11100110", 
				"00000010" when "11100111", 
				"11100111" when "11101000", 
				"00010100" when "11101001", 
				"01101000" when "11101010", 
				"10011011" when "11101011", 
				"10010000" when "11101100", 
				"01100011" when "11101101", 
				"00011111" when "11101110", 
				"11101100" when "11101111", 
				"10111100" when "11110000", 
				"01001111" when "11110001", 
				"00110011" when "11110010", 
				"11000000" when "11110011", 
				"11001011" when "11110100", 
				"00111000" when "11110101", 
				"01000100" when "11110110", 
				"10110111" when "11110111", 
				"01010010" when "11111000", 
				"10100001" when "11111001", 
				"11011101" when "11111010", 
				"00101110" when "11111011", 
				"00100101" when "11111100", 
				"11010110" when "11111101", 
				"10101010" when "11111110", 
				"01011001" when "11111111";

end mul_F3_mem;

