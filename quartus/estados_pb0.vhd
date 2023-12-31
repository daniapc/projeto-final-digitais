library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity estados_pb0 is
    port(
		pb0, 
		est_0, est_1, est_2, est_3: in std_logic;

		A, B, C, D, E: out std_logic
    );
end estados_pb0;

architecture arq_estados_pb0 of estados_pb0 is
	 function int( s : std_logic ) return integer is
	 begin
	 	if s = '1' then
	 		return 1;
		else
	 		return 0;
		end if;
	 end function;
	 
     signal estado: integer;
	 
	 begin	 
			  estado <= int(est_0) + 2*int(est_1) + 4*int(est_2) + 8*int(est_3);
			  
		process (pb0, estado) is
		begin
			  
			if estado = 1 then
				A <= pb0;
				B <= '0';
				C <= '0';
				D <= '0';
				E <= '0';
			elsif estado = 3 then
				A <= '0';
				B <= pb0;
				C <= '0';
				D <= '0';
				E <= '0';
			elsif estado = 5 then
				A <= '0';
				B <= '0';
				C <= pb0;
				D <= '0';
				E <= '0';
			elsif estado = 7 then
				A <= '0';
				B <= '0';
				C <= '0';
				D <= pb0;
				E <= '0';
			elsif estado = 9 then
				A <= '0';
				B <= '0';
				C <= '0';
				D <= '0';
				E <= pb0;
			else
				A <= '0';
				B <= '0';
				C <= '0';
				D <= '0';
				E <= '0';
			end if;

		end process;	
	
end arq_estados_pb0;