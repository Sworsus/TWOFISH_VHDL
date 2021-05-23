----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:07 05/10/2021 
-- Design Name: 
-- Module Name:    RS128_calc - RS128_calc 
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

entity RS128_calc is
	port (
			in_rs128 : in std_logic_vector(127 downto 0);
			out_S0_rs128, out_S1_rs128 : out std_logic_vector(31 downto 0)
			);
end RS128_calc;

architecture RS128_calc of RS128_calc is

	-- Se declaran todos los factores que componen la matriz, 
	-- esta es una matriz 4*8, y tiene 24 componentes distintos.
	
	-- Multiplicacion por 01
	component mul_01
		port	(
				in_01	: in std_logic_vector(7 downto 0);
				out_01 : out std_logic_vector(7 downto 0)
				);
		end component;

	-- Multiplicacion por 02
	component mul_02_calc
		port (
				in_02 : in std_logic_vector(7 downto 0);
				out_02 : out std_logic_vector(7 downto 0)
				);
	end component;
	
	-- Multiplicacion por 03
	component mul_03_calc
		port (
				in_03 : in std_logic_vector(7 downto 0);
				out_03 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 19
	component mul_19_calc
		port (
				in_19 : in std_logic_vector(7 downto 0);
				out_19 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 1E
	component mul_1E_calc
		port (
				in_1E : in std_logic_vector(7 downto 0);
				out_1E : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 3D
	component mul_3D_calc
		port (
				in_3D : in std_logic_vector(7 downto 0);
				out_3D : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 47
	component mul_47_calc
		port (
				in_47 : in std_logic_vector(7 downto 0);
				out_47 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 55
	component mul_55_calc
		port (
				in_55 : in std_logic_vector(7 downto 0);
				out_55 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 56
	component mul_56_calc
		port (
				in_56 : in std_logic_vector(7 downto 0);
				out_56 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 58
	component mul_58_calc
		port (
				in_58 : in std_logic_vector(7 downto 0);
				out_58 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 5A
	component mul_5A_calc
		port (
				in_5A : in std_logic_vector(7 downto 0);
				out_5A : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 68
	component mul_68_calc
		port (
				in_68 : in std_logic_vector(7 downto 0);
				out_68 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 82
	component mul_82_calc
		port (
				in_82 : in std_logic_vector(7 downto 0);
				out_82 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 87
	component mul_87_calc
		port (
				in_87 : in std_logic_vector(7 downto 0);
				out_87 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por 9E
	component mul_9E_calc
		port (
				in_9E : in std_logic_vector(7 downto 0);
				out_9E : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por A1
	component mul_A1_calc
		port (
				in_A1 : in std_logic_vector(7 downto 0);
				out_A1 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por A4
	component mul_A4_calc
		port (
				in_A4 : in std_logic_vector(7 downto 0);
				out_A4 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por AE
	component mul_AE_calc
		port (
				in_AE : in std_logic_vector(7 downto 0);
				out_AE : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por C1
	component mul_C1_calc
		port (
				in_C1 : in std_logic_vector(7 downto 0);
				out_C1 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por C6
	component mul_C6_calc
		port (
				in_C6 : in std_logic_vector(7 downto 0);
				out_C6 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por DB
	component mul_DB_calc
		port (
				in_DB : in std_logic_vector(7 downto 0);
				out_DB : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por E5
	component mul_E5_calc
		port (
				in_E5 : in std_logic_vector(7 downto 0);
				out_E5 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por F3
	component mul_F3_calc
		port (
				in_F3 : in std_logic_vector(7 downto 0);
				out_F3 : out std_logic_vector(7 downto 0)
				);
	end component;
		
	-- Multiplicacion por FC
	component mul_FC_calc
		port (
				in_FC : in std_logic_vector(7 downto 0);
				out_FC : out std_logic_vector(7 downto 0)
				);
	end component;

	-- Separacion en variables de 8 bits de la entrada a la matriz de 128 bits.
	signal m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15 : std_logic_vector(7 downto 0);	
	
	-- Declaro variables para guardar los resultados de las multiplicaciones de m0, m1, m2...
	-- por cada uno de los factores de la matriz.
	signal s00, s01, s02, s03, s10, s11, s12, s13 : std_logic_vector(7 downto 0);	
	
	signal m0_01,  m1_A4, m2_55,  m3_87,  m4_5A,  m5_58,  m6_DB,  m7_9E,
			 m0_A4,  m1_56, m2_82,  m3_F3,  m4_1E,  m5_C6,  m6_68,  m7_E5,
			 m0_02,  m1_A1, m2_FC,  m3_C1,  m4_47,  m5_AE,  m6_3D,  m7_19,
			 m0_A4p, m1_55, m2_87,  m3_5A,  m4_58,  m5_DB,  m6_9E,  m7_03 : std_logic_vector(7 downto 0);	
	signal m8_01,  m9_A4, m10_55, m11_87, m12_5A, m13_58, m14_DB, m15_9E,
			 m8_A4,  m9_56, m10_82, m11_F3, m12_1E, m13_C6, m14_68, m15_E5,
			 m8_02,  m9_A1, m10_FC, m11_C1, m12_47, m13_AE, m14_3D, m15_19,
			 m8_A4p, m9_55, m10_87, m11_5A, m12_58, m13_DB, m14_9E, m15_03 : std_logic_vector(7 downto 0);	

begin
	 
		-- Primero, se separa el input de rs128 en m0, m1, m2...
		-- Para S1
		m0 <= in_rs128(7 downto 0);
		m1 <= in_rs128(15 downto 8);
		m2 <= in_rs128(23 downto 16);
		m3 <= in_rs128(31 downto 24);
		m4 <= in_rs128(39 downto 32);
		m5 <= in_rs128(47 downto 40);
		m6 <= in_rs128(55 downto 48);
		m7 <= in_rs128(63 downto 56);
	 
		-- Para S0
		m8 <= in_rs128(71 downto 64);
		m9 <= in_rs128(79 downto 72);
		m10 <= in_rs128(87 downto 80);
		m11 <= in_rs128(95 downto 88);
		m12 <= in_rs128(103 downto 96);
		m13 <= in_rs128(111 downto 104);
		m14 <= in_rs128(119 downto 112);
		m15 <= in_rs128(127 downto 120);
	 
	 
		-- Despues de separar en variables de 8 bits, se hacen las multiplicaciones
		-- por cada uno de los factores de la matriz.
		-- Con la primera fila se calcula s00
		m0_x_01: mul_01
		port map	(
					in_01 => m0,
					out_01 => m0_01
					);
	 
		m1_x_A4: mul_A4_calc
		port map	(
					in_A4 => m1,
					out_A4 => m1_A4
					);
	 
		m2_x_55: mul_55_calc
		port map	(
					in_55 => m2,
					out_55 => m2_55
					);
	 
		m3_x_87: mul_87_calc
		port map	(
					in_87 => m3,
					out_87 => m3_87
					);
	 
		m4_x_5A: mul_5A_calc
		port map	(
					in_5A => m4,
					out_5A => m4_5A
					);
	 
		m5_x_58: mul_58_calc
		port map	(
					in_58 => m5,
					out_58 => m5_58
					);
	 
		m6_x_DB: mul_DB_calc
		port map	(
					in_DB => m6,
					out_DB => m6_DB
					);
	 
		m7_x_9E: mul_9E_calc
		port map	(
					in_9E => m7,
					out_9E => m7_9E
					);
	 
		-- Con la segunda fila se calcula s01
		m0_x_A4: mul_A4_calc
		port map	(
					in_A4 => m0,
					out_A4 => m0_A4
					);
	 
		m1_x_56: mul_56_calc
		port map	(
					in_56 => m1,
					out_56 => m1_56
					);
	 
		m2_x_82: mul_82_calc
		port map	(
					in_82 => m2,
					out_82 => m2_82
					);
	 
		m3_x_F3: mul_F3_calc
		port map	(
					in_F3 => m3,
					out_F3 => m3_F3
					);
	 
		m4_x_1E: mul_1E_calc
		port map	(
					in_1E => m4,
					out_1E => m4_1E
					);
	 
		m5_x_C6: mul_C6_calc
		port map	(
					in_C6 => m5,
					out_C6 => m5_C6
					);
	 
		m6_x_68: mul_68_calc
		port map	(
					in_68 => m6,
					out_68 => m6_68
					);
	 
		m7_x_E5: mul_E5_calc
		port map	(
					in_E5 => m7,
					out_E5 => m7_E5
					);
	 
		-- Con la tercera fila se calcula s02
		m0_x_02: mul_02_calc
		port map	(
					in_02 => m0,
					out_02 => m0_02
					);
	 
		m1_x_A1: mul_A1_calc
		port map	(
					in_A1 => m1,
					out_A1 => m1_A1
					);
	 
		m2_x_FC: mul_FC_calc
		port map	(
					in_FC => m2,
					out_FC => m2_FC
					);
	 
		m3_x_C1: mul_C1_calc
		port map	(
					in_C1 => m3,
					out_C1 => m3_C1
					);
	 
		m4_x_47: mul_47_calc
		port map	(
					in_47 => m4,
					out_47 => m4_47
					);
	 
		m5_x_AE: mul_AE_calc
		port map	(
					in_AE => m5,
					out_AE => m5_AE
					);
	 
		m6_x_3D: mul_3D_calc
		port map	(
					in_3D => m6,
					out_3D => m6_3D
					);
	 
		m7_x_19: mul_19_calc
		port map	(
					in_19 => m7,
					out_19 => m7_19
					);
	 
		-- Con la cuarta fila se calcula s03
		m0_x_A4_1: mul_A4_calc
		port map	(
					in_A4 => m0,
					out_A4 => m0_A4p
					);
	 
		m1_x_55: mul_55_calc
		port map	(
					in_55 => m1,
					out_55 => m1_55
					);
	 
		m2_x_87: mul_87_calc
		port map	(
					in_87 => m2,
					out_87 => m2_87
					);
	 
		m3_x_5A: mul_5A_calc
		port map	(
					in_5A => m3,
					out_5A => m3_5A
					);
	 
		m4_x_58: mul_58_calc
		port map	(
					in_58 => m4,
					out_58 => m4_58
					);
	 
		m5_x_DB: mul_DB_calc
		port map	(
					in_DB => m5,
					out_DB => m5_DB
					);
	 
		m6_x_9E: mul_9E_calc
		port map	(
					in_9E => m6,
					out_9E => m6_9E
					);
	 
		m7_x_03: mul_03_calc
		port map	(
					in_03 => m7,
					out_03 => m7_03
					);
	 
	 
		-- Se calculan los coeficientes que forman S1
		-- Con la primera fila se calcula s10
		m8_x_01: mul_01
		port map	(
					in_01 => m8,
					out_01 => m8_01
					);
	 
		m9_x_A4: mul_A4_calc
		port map	(
					in_A4 => m9,
					out_A4 => m9_A4
					);
	 
		m10_x_55: mul_55_calc
		port map	(
					in_55 => m10,
					out_55 => m10_55
					);
	 
		m11_x_87: mul_87_calc
		port map	(
					in_87 => m11,
					out_87 => m11_87
					);
	 
		m12_x_5A: mul_5A_calc
		port map	(
					in_5A => m12,
					out_5A => m12_5A
					);
	 
		m13_x_58: mul_58_calc
		port map	(
					in_58 => m13,
					out_58 => m13_58
					);
	 
		m14_x_DB: mul_DB_calc
		port map	(
					in_DB => m14,
					out_DB => m14_DB
					);
	 
		m15_x_9E: mul_9E_calc
		port map	(
					in_9E => m15,
					out_9E => m15_9E
					);
	 
		-- Con la segunda fila se calcula s11
		m8_x_A4: mul_A4_calc
		port map	(
					in_A4 => m8,
					out_A4 => m8_A4
					);
	 
		m9_x_56: mul_56_calc
		port map	(
					in_56 => m9,
					out_56 => m9_56
					);
	 
		m10_x_82: mul_82_calc
		port map	(
					in_82 => m10,
					out_82 => m10_82
					);
	 
		m11_x_F3: mul_F3_calc
		port map	(
					in_F3 => m11,
					out_F3 => m11_F3
					);
	 
		m12_x_1E: mul_1E_calc
		port map	(
					in_1E => m12,
					out_1E => m12_1E
					);
	 
		m13_x_C6: mul_C6_calc
		port map	(
					in_C6 => m13,
					out_C6 => m13_C6
					);
	 
		m14_x_68: mul_68_calc
		port map	(
					in_68 => m14,
					out_68 => m14_68
					);
	 
		m15_x_E5: mul_E5_calc
		port map	(
					in_E5 => m15,
					out_E5 => m15_E5
					);
	 
		-- Con la tercera fila se calcula s12
		m8_x_02: mul_02_calc
		port map	(
					in_02 => m8,
					out_02 => m8_02
					);
	 
		m9_x_A1: mul_A1_calc
		port map	(
					in_A1 => m9,
					out_A1 => m9_A1
					);
	 
		m10_x_FC: mul_FC_calc
		port map	(
					in_FC => m10,
					out_FC => m10_FC
					);
	 
		m11_x_C1: mul_C1_calc
		port map	(
					in_C1 => m11,
					out_C1 => m11_C1
					);
	 
		m12_x_47: mul_47_calc
		port map	(
					in_47 => m12,
					out_47 => m12_47
					);
	 
		m13_x_AE: mul_AE_calc
		port map	(
					in_AE => m13,
					out_AE => m13_AE
					);
	 
		m14_x_3D: mul_3D_calc
		port map	(
					in_3D => m14,
					out_3D => m14_3D
					);
	 
		m15_x_19: mul_19_calc
		port map	(
					in_19 => m15,
					out_19 => m15_19
					);
	 
		-- Con la cuarta fila se calcula s13
		m8_x_A4_1: mul_A4_calc
		port map	(
					in_A4 => m8,
					out_A4 => m8_A4p
					);
	 
		m9_x_55: mul_55_calc
		port map	(
					in_55 => m9,
					out_55 => m9_55
					);
	 
		m10_x_87: mul_87_calc
		port map	(
					in_87 => m10,
					out_87 => m10_87
					);
	 
		m11_x_5A: mul_5A_calc
		port map	(
					in_5A => m11,
					out_5A => m11_5A
					);
	 
		m12_x_58: mul_58_calc
		port map	(
					in_58 => m12,
					out_58 => m12_58
					);
	 
		m13_x_DB: mul_DB_calc
		port map	(
					in_DB => m13,
					out_DB => m13_DB
					);
	 
		m14_x_9E: mul_9E_calc
		port map	(
					in_9E => m14,
					out_9E => m14_9E
					);
	 
		m15_x_03: mul_03_calc
		port map	(
					in_03 => m15,
					out_03 => m15_03
					);
	 
	 
		-- Despues de hacer todas las multiplicacaciones y coeficientes, se hacen las sumas
		-- para obtener los coeficientes de la matriz de salida.
		s00 <= m0_01 XOR m1_A4 XOR m2_55 XOR m3_87 XOR m4_5A XOR m5_58 XOR m6_DB XOR m7_9E;
		s01 <= m0_A4 XOR m1_56 XOR m2_82 XOR m3_F3 XOR m4_1E XOR m5_C6 XOR m6_68 XOR m7_E5;
		s02 <= m0_02 XOR m1_A1 XOR m2_FC XOR m3_C1 XOR m4_47 XOR m5_AE XOR m6_3D XOR m7_19;
		s03 <= m0_A4p XOR m1_55 XOR m2_87 XOR m3_5A XOR m4_58 XOR m5_DB XOR m6_9E XOR m7_03;
	 
		-- Despues de obtener s00, s01, s02 y s03 se obtiene la compoenente S0.
		out_S0_rs128 <= s03 & s02 & s01 & s00;
	 
		s10 <= m8_01 XOR m9_A4 XOR m10_55 XOR m11_87 XOR m12_5A XOR m13_58 XOR m14_DB XOR m15_9E;
		s11 <= m8_A4 XOR m9_56 XOR m10_82 XOR m11_F3 XOR m12_1E XOR m13_C6 XOR m14_68 XOR m15_E5;
		s12 <= m8_02 XOR m9_A1 XOR m10_FC XOR m11_C1 XOR m12_47 XOR m13_AE XOR m14_3D XOR m15_19;
		s13 <= m8_A4p XOR m9_55 XOR m10_87 XOR m11_5A XOR m12_58 XOR m13_DB XOR m14_9E XOR m15_03;
	 
		-- Despues de obtener s10, s11, s12 y s13 se obtiene la compoenente S1.
		out_S1_rs128 <= s13 & s12 & s11 & s10;

end RS128_calc;

