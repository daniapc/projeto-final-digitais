library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity resetor is
    port(
		est_0, est_1, est_2, est_3: in std_logic;

		CLR: out std_logic
    );
end resetor;

architecture arq_resetor of resetor is
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
			  
		process (estado) is
		begin
			  
			if estado = 12 then
				CLR <= '0';
			else
				CLR <= '1';
			end if;

		end process;	
	
end arq_resetor;