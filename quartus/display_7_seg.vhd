-- Circuitos Digitais: Laboratório 01 --
-- Feito por Daniel Augusto Pires de Castro RA 2240246 --

Library IEEE;
use ieee.std_logic_1164.all;

entity display_7_seg is
port(
	D, C, B, A: in std_logic;
	Sa, Sb, Sc, Sd, Se, Sf, Sg: out std_logic
);
end display_7_seg;

architecture arc_display_7_seg of display_7_seg is
begin
	-- Segmento a
	Sa <= (not(A) and (B) and not(C) and not(D)) or
			(not(A) and not(B) and not(C) and (D)) or
			((A) and (B) and not(C) and (D)) or
			((A) and not(B) and (C) and (D));
	-- Segmento b
	Sb <= (not(A) and (B) and not(C) and (D)) or
			((A) and (B) and not(D)) or
			((A) and (C) and (D)) or
			((B) and (C) and not(D));
	-- Segmento c
	Sc <= (not(A) and not(B) and (C) and not(D)) or
			((A) and (B) and (C)) or
			((A) and (B) and not(D));
	-- Segmento d
	Sd <= (not(A) and not(B) and not(C) and (D)) or
			(not(A) and (B) and not(C) and not(D)) or
			((A) and not(B) and (C) and not(D)) or
			((B) and (C) and (D));
	-- Segmento e	
	Se <= (not(A) and (B) and not(C)) or
			(not(B) and not(C) and (D)) or
			(not(A) and (D));
	-- Segmento f	
	Sf <= ((A) and (B) and not(C) and (D)) or
			(not(A) and not(B) and (D)) or
			(not(A) and not(B) and (C)) or
			(not(A) and (C) and (D));
	-- Segmento g	
	Sg <= ((A) and (B) and not(C) and not(D)) or
			(not(A) and (B) and (C) and (D)) or
			(not(A) and not(B) and not(C));
end arc_display_7_seg;




