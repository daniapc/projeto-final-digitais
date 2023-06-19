-- Circuitos Digitais: Projeto Final --
-- Feito por Daniel Augusto Pires de Castro RA 2240246 --

Library IEEE;
use ieee.std_logic_1164.all;

entity contador_karnaught is
port(
	X0, X1, X2, X3: in std_logic;
	D3, D2, D1, D0: out std_logic
);
end contador_karnaught;

architecture arc_d_ports of contador_karnaught is
begin
	-- D3
	D3 <= (X2 and X1 and X0) or
			(X3 and not(X0));
	
	-- D2
	D2 <= (X2 and not(X1)) or
			(X2 and not(X0)) or
			(not(X2) and X1 and X0);
	-- D1
	D1 <= (X1 and not(X0)) or
			(not(X3) and not(X1) and X0);
	-- D0
	D0 <= (not(X0));
	
end arc_d_ports;




