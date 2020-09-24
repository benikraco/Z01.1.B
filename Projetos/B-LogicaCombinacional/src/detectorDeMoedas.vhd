library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detectorDeMoedas is
	port (
    Q,D,N : in  STD_LOGIC;
    cents     : out STD_LOGIC_VECTOR(4 downto 0));
end entity;

architecture arch of detectorDeMoedas is

begin

	with sel select
  -- Q = 25 / D = 10 / N = 5
	cents <= "11001" when Q = "1" and D = "0" and N = "0";
    cents <= "01010" when Q = "0" and D = "1" and N = "0";
	cents <= "00101" when Q = "0" and D = "0" and N = "1";
    cents <= "00000" when others;
		
end architecture;