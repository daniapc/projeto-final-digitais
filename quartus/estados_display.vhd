library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity estados_display is
    port(
        A00, A01, A02, A03,
        A10, A11, A12, A13,
        A20, A21, A22, A23,
        A30, A31, A32, A33,
        A40, A41, A42, A43,
        B00, B01, B02, B03,
        B10, B11, B12, B13,
        B20, B21, B22, B23,
        B30, B31, B32, B33,
        B40, B41, B42, B43,
        C00, C01, C02, C03,
        C10, C11, C12, C13,
        C20, C21, C22, C23,
        C30, C31, C32, C33,
        C40, C41, C42, C43,
        D00, D01, D02, D03,
        D10, D11, D12, D13,
        D20, D21, D22, D23,
        D30, D31, D32, D33,
        D40, D41, D42, D43,
        E00, E01, E02, E03,
        E10, E11, E12, E13,
        E20, E21, E22, E23,
        E30, E31, E32, E33,
        E40, E41, E42, E43,
        O00, O01, O02, O03,
        O10, O11, O12, O13,
        O20, O21, O22, O23,
        O30, O31, O32, O33,
        O40, O41, O42, O43,
		est_0, est_1, est_2, est_3: in std_logic;

		Sa0, Sb0, Sc0, Sd0, Se0, Sf0, Sg0,
		Sa1, Sb1, Sc1, Sd1, Se1, Sf1, Sg1,
		Sa2, Sb2, Sc2, Sd2, Se2, Sf2, Sg2,
		Sa3, Sb3, Sc3, Sd3, Se3, Sf3, Sg3,
		Sa4, Sb4, Sc4, Sd4, Se4, Sf4, Sg4,
		Sa5, Sb5, Sc5, Sd5, Se5, Sf5, Sg5: out std_logic
    );
end estados_display;

architecture arq_estados_display of estados_display is
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
			  
		process (        
		  A00, A01, A02, A03,
        A10, A11, A12, A13,
        A20, A21, A22, A23,
        A30, A31, A32, A33,
        A40, A41, A42, A43,
        B00, B01, B02, B03,
        B10, B11, B12, B13,
        B20, B21, B22, B23,
        B30, B31, B32, B33,
        B40, B41, B42, B43,
        C00, C01, C02, C03,
        C10, C11, C12, C13,
        C20, C21, C22, C23,
        C30, C31, C32, C33,
        C40, C41, C42, C43,
        D00, D01, D02, D03,
        D10, D11, D12, D13,
        D20, D21, D22, D23,
        D30, D31, D32, D33,
        D40, D41, D42, D43,
        E00, E01, E02, E03,
        E10, E11, E12, E13,
        E20, E21, E22, E23,
        E30, E31, E32, E33,
        E40, E41, E42, E43,
        O00, O01, O02, O03,
        O10, O11, O12, O13,
        O20, O21, O22, O23,
        O30, O31, O32, O33,
        O40, O41, O42, O43) is
		begin
			  
			if estado = 0 then
				-- F
				Sa0 <= '0';
				Sb0 <= '1';
				Sc0 <= '1';
				Sd0 <= '1';
				Se0 <= '0';
				Sf0 <= '0';
				Sg0 <= '0';
				-- I
				Sa1 <= '1';
				Sb1 <= '1';
				Sc1 <= '1';
				Sd1 <= '1';
				Se1 <= '0';
				Sf1 <= '0';
				Sg1 <= '1';
				-- E
				Sa2 <= '1';
				Sb2 <= '1';
				Sc2 <= '0';
				Sd2 <= '0';
				Se2 <= '0';
				Sf2 <= '0';
				Sg2 <= '0';
				-- L
				Sa3 <= '1';
				Sb3 <= '1';
				Sc3 <= '1';
				Sd3 <= '0';
				Se3 <= '0';
				Sf3 <= '0';
				Sg3 <= '1';
				-- d
				Sa4 <= '1';
				Sb4 <= '0';
				Sc4 <= '0';
				Sd4 <= '0';
				Se4 <= '0';
				Sf4 <= '1';
				Sg4 <= '0';
				-- 0
				Sa5 <= '0';
				Sb5 <= '0';
				Sc5 <= '0';
				Sd5 <= '0';
				Se5 <= '0';
				Sf5 <= '0';
				Sg5 <= '1';
			elsif estado = 1 then
				-- HEX0
				Sa0 <= (not(A03) and (A02) and not(A01) and not(A00)) or	(not(A03) and not(A02) and not(A01) and (A00)) or ((A03) and (A02) and not(A01) and (A00)) or ((A03) and not(A02) and (A01) and (A00));
				Sb0 <= (not(A03) and (A02) and not(A01) and (A00)) or ((A03) and (A02) and not(A00)) or ((A03) and (A01) and (A00)) or ((A02) and (A01) and not(A00));
				Sc0 <= (not(A03) and not(A02) and (A01) and not(A00)) or ((A03) and (A02) and (A01)) or ((A03) and (A02) and not(A00));
				Sd0 <= (not(A03) and not(A02) and not(A01) and (A00)) or (not(A03) and (A02) and not(A01) and not(A00)) or ((A03) and not(A02) and (A01) and not(A00)) or ((A02) and (A01) and (A00));
				Se0 <= (not(A03) and (A02) and not(A01)) or (not(A02) and not(A01) and (A00)) or (not(A03) and (A00));
				Sf0 <= ((A03) and (A02) and not(A01) and (A00)) or (not(A03) and not(A02) and (A00)) or (not(A03) and not(A02) and (A01)) or (not(A03) and (A01) and (A00));
				Sg0 <= ((A03) and (A02) and not(A01) and not(A00)) or (not(A03) and (A02) and (A01) and (A00)) or (not(A03) and not(A02) and not(A01));
				-- HEX1
				Sa1 <= (not(A13) and (A12) and not(A11) and not(A10)) or	(not(A13) and not(A12) and not(A11) and (A10)) or ((A13) and (A12) and not(A11) and (A10)) or ((A13) and not(A12) and (A11) and (A10));
				Sb1 <= (not(A13) and (A12) and not(A11) and (A10)) or ((A13) and (A12) and not(A10)) or ((A13) and (A11) and (A10)) or ((A12) and (A11) and not(A10));
				Sc1 <= (not(A13) and not(A12) and (A11) and not(A10)) or ((A13) and (A12) and (A11)) or ((A13) and (A12) and not(A10));
				Sd1 <= (not(A13) and not(A12) and not(A11) and (A10)) or (not(A13) and (A12) and not(A11) and not(A10)) or ((A13) and not(A12) and (A11) and not(A10)) or ((A12) and (A11) and (A10));
				Se1 <= (not(A13) and (A12) and not(A11)) or (not(A12) and not(A11) and (A10)) or (not(A13) and (A10));
				Sf1 <= ((A13) and (A12) and not(A11) and (A10)) or (not(A13) and not(A12) and (A10)) or (not(A13) and not(A12) and (A11)) or (not(A13) and (A11) and (A10));
				Sg1 <= ((A13) and (A12) and not(A11) and not(A10)) or (not(A13) and (A12) and (A11) and (A10)) or (not(A13) and not(A12) and not(A11));
				-- HEX2
				Sa2 <= (not(A23) and (A22) and not(A21) and not(A20)) or	(not(A23) and not(A22) and not(A21) and (A20)) or ((A23) and (A22) and not(A21) and (A20)) or ((A23) and not(A22) and (A21) and (A20));
				Sb2 <= (not(A23) and (A22) and not(A21) and (A20)) or ((A23) and (A22) and not(A20)) or ((A23) and (A21) and (A20)) or ((A22) and (A21) and not(A20));
				Sc2 <= (not(A23) and not(A22) and (A21) and not(A20)) or ((A23) and (A22) and (A21)) or ((A23) and (A22) and not(A20));
				Sd2 <= (not(A23) and not(A22) and not(A21) and (A20)) or (not(A23) and (A22) and not(A21) and not(A20)) or ((A23) and not(A22) and (A21) and not(A20)) or ((A22) and (A21) and (A20));
				Se2 <= (not(A23) and (A22) and not(A21)) or (not(A22) and not(A21) and (A20)) or (not(A23) and (A20));
				Sf2 <= ((A23) and (A22) and not(A21) and (A20)) or (not(A23) and not(A22) and (A20)) or (not(A23) and not(A22) and (A21)) or (not(A23) and (A21) and (A20));
				Sg2 <= ((A23) and (A22) and not(A21) and not(A20)) or (not(A23) and (A22) and (A21) and (A20)) or (not(A23) and not(A22) and not(A21));
				-- HEX3
				Sa3 <= (not(A33) and (A32) and not(A31) and not(A30)) or	(not(A33) and not(A32) and not(A31) and (A30)) or ((A33) and (A32) and not(A31) and (A30)) or ((A33) and not(A32) and (A31) and (A30));
				Sb3 <= (not(A33) and (A32) and not(A31) and (A30)) or ((A33) and (A32) and not(A30)) or ((A33) and (A31) and (A30)) or ((A32) and (A31) and not(A30));
				Sc3 <= (not(A33) and not(A32) and (A31) and not(A30)) or ((A33) and (A32) and (A31)) or ((A33) and (A32) and not(A30));
				Sd3 <= (not(A33) and not(A32) and not(A31) and (A30)) or (not(A33) and (A32) and not(A31) and not(A30)) or ((A33) and not(A32) and (A31) and not(A30)) or ((A32) and (A31) and (A30));
				Se3 <= (not(A33) and (A32) and not(A31)) or (not(A32) and not(A31) and (A30)) or (not(A33) and (A30));
				Sf3 <= ((A33) and (A32) and not(A31) and (A30)) or (not(A33) and not(A32) and (A30)) or (not(A33) and not(A32) and (A31)) or (not(A33) and (A31) and (A30));
				Sg3 <= ((A33) and (A32) and not(A31) and not(A30)) or (not(A33) and (A32) and (A31) and (A30)) or (not(A33) and not(A32) and not(A31));
				-- HEX4
				Sa4 <= (not(A43) and (A42) and not(A41) and not(A40)) or	(not(A43) and not(A42) and not(A41) and (A40)) or ((A43) and (A42) and not(A41) and (A40)) or ((A43) and not(A42) and (A41) and (A40));
				Sb4 <= (not(A43) and (A42) and not(A41) and (A40)) or ((A43) and (A42) and not(A40)) or ((A43) and (A41) and (A40)) or ((A42) and (A41) and not(A40));
				Sc4 <= (not(A43) and not(A42) and (A41) and not(A40)) or ((A43) and (A42) and (A41)) or ((A43) and (A42) and not(A40));
				Sd4 <= (not(A43) and not(A42) and not(A41) and (A40)) or (not(A43) and (A42) and not(A41) and not(A40)) or ((A43) and not(A42) and (A41) and not(A40)) or ((A42) and (A41) and (A40));
				Se4 <= (not(A43) and (A42) and not(A41)) or (not(A42) and not(A41) and (A40)) or (not(A43) and (A40));
				Sf4 <= ((A43) and (A42) and not(A41) and (A40)) or (not(A43) and not(A42) and (A40)) or (not(A43) and not(A42) and (A41)) or (not(A43) and (A41) and (A40));
				Sg4 <= ((A43) and (A42) and not(A41) and not(A40)) or (not(A43) and (A42) and (A41) and (A40)) or (not(A43) and not(A42) and not(A41));
			elsif estado = 2 then
				-- F
				Sa0 <= '0';
				Sb0 <= '1';
				Sc0 <= '1';
				Sd0 <= '1';
				Se0 <= '0';
				Sf0 <= '0';
				Sg0 <= '0';
				-- I
				Sa1 <= '1';
				Sb1 <= '1';
				Sc1 <= '1';
				Sd1 <= '1';
				Se1 <= '0';
				Sf1 <= '0';
				Sg1 <= '1';
				-- E
				Sa2 <= '1';
				Sb2 <= '1';
				Sc2 <= '0';
				Sd2 <= '0';
				Se2 <= '0';
				Sf2 <= '0';
				Sg2 <= '0';
				-- L
				Sa3 <= '1';
				Sb3 <= '1';
				Sc3 <= '1';
				Sd3 <= '0';
				Se3 <= '0';
				Sf3 <= '0';
				Sg3 <= '1';
				-- d
				Sa4 <= '1';
				Sb4 <= '0';
				Sc4 <= '0';
				Sd4 <= '0';
				Se4 <= '0';
				Sf4 <= '1';
				Sg4 <= '0';
				-- 1
				Sa5 <= '0';
				Sb5 <= '0';
				Sc5 <= '1';
				Sd5 <= '1';
				Se5 <= '1';
				Sf5 <= '1';
				Sg5 <= '1';
			elsif estado = 3 then
				-- HEX0
				Sa0 <= (not(B03) and (B02) and not(B01) and not(B00)) or	(not(B03) and not(B02) and not(B01) and (B00)) or ((B03) and (B02) and not(B01) and (B00)) or ((B03) and not(B02) and (B01) and (B00));
				Sb0 <= (not(B03) and (B02) and not(B01) and (B00)) or ((B03) and (B02) and not(B00)) or ((B03) and (B01) and (B00)) or ((B02) and (B01) and not(B00));
				Sc0 <= (not(B03) and not(B02) and (B01) and not(B00)) or ((B03) and (B02) and (B01)) or ((B03) and (B02) and not(B00));
				Sd0 <= (not(B03) and not(B02) and not(B01) and (B00)) or (not(B03) and (B02) and not(B01) and not(B00)) or ((B03) and not(B02) and (B01) and not(B00)) or ((B02) and (B01) and (B00));
				Se0 <= (not(B03) and (B02) and not(B01)) or (not(B02) and not(B01) and (B00)) or (not(B03) and (B00));
				Sf0 <= ((B03) and (B02) and not(B01) and (B00)) or (not(B03) and not(B02) and (B00)) or (not(B03) and not(B02) and (B01)) or (not(B03) and (B01) and (B00));
				Sg0 <= ((B03) and (B02) and not(B01) and not(B00)) or (not(B03) and (B02) and (B01) and (B00)) or (not(B03) and not(B02) and not(B01));
				-- HEX1
				Sa1 <= (not(B13) and (B12) and not(B11) and not(B10)) or	(not(B13) and not(B12) and not(B11) and (B10)) or ((B13) and (B12) and not(B11) and (B10)) or ((B13) and not(B12) and (B11) and (B10));
				Sb1 <= (not(B13) and (B12) and not(B11) and (B10)) or ((B13) and (B12) and not(B10)) or ((B13) and (B11) and (B10)) or ((B12) and (B11) and not(B10));
				Sc1 <= (not(B13) and not(B12) and (B11) and not(B10)) or ((B13) and (B12) and (B11)) or ((B13) and (B12) and not(B10));
				Sd1 <= (not(B13) and not(B12) and not(B11) and (B10)) or (not(B13) and (B12) and not(B11) and not(B10)) or ((B13) and not(B12) and (B11) and not(B10)) or ((B12) and (B11) and (B10));
				Se1 <= (not(B13) and (B12) and not(B11)) or (not(B12) and not(B11) and (B10)) or (not(B13) and (B10));
				Sf1 <= ((B13) and (B12) and not(B11) and (B10)) or (not(B13) and not(B12) and (B10)) or (not(B13) and not(B12) and (B11)) or (not(B13) and (B11) and (B10));
				Sg1 <= ((B13) and (B12) and not(B11) and not(B10)) or (not(B13) and (B12) and (B11) and (B10)) or (not(B13) and not(B12) and not(B11));
				-- HEX2
				Sa2 <= (not(B23) and (B22) and not(B21) and not(B20)) or	(not(B23) and not(B22) and not(B21) and (B20)) or ((B23) and (B22) and not(B21) and (B20)) or ((B23) and not(B22) and (B21) and (B20));
				Sb2 <= (not(B23) and (B22) and not(B21) and (B20)) or ((B23) and (B22) and not(B20)) or ((B23) and (B21) and (B20)) or ((B22) and (B21) and not(B20));
				Sc2 <= (not(B23) and not(B22) and (B21) and not(B20)) or ((B23) and (B22) and (B21)) or ((B23) and (B22) and not(B20));
				Sd2 <= (not(B23) and not(B22) and not(B21) and (B20)) or (not(B23) and (B22) and not(B21) and not(B20)) or ((B23) and not(B22) and (B21) and not(B20)) or ((B22) and (B21) and (B20));
				Se2 <= (not(B23) and (B22) and not(B21)) or (not(B22) and not(B21) and (B20)) or (not(B23) and (B20));
				Sf2 <= ((B23) and (B22) and not(B21) and (B20)) or (not(B23) and not(B22) and (B20)) or (not(B23) and not(B22) and (B21)) or (not(B23) and (B21) and (B20));
				Sg2 <= ((B23) and (B22) and not(B21) and not(B20)) or (not(B23) and (B22) and (B21) and (B20)) or (not(B23) and not(B22) and not(B21));
				-- HEX3
				Sa3 <= (not(B33) and (B32) and not(B31) and not(B30)) or	(not(B33) and not(B32) and not(B31) and (B30)) or ((B33) and (B32) and not(B31) and (B30)) or ((B33) and not(B32) and (B31) and (B30));
				Sb3 <= (not(B33) and (B32) and not(B31) and (B30)) or ((B33) and (B32) and not(B30)) or ((B33) and (B31) and (B30)) or ((B32) and (B31) and not(B30));
				Sc3 <= (not(B33) and not(B32) and (B31) and not(B30)) or ((B33) and (B32) and (B31)) or ((B33) and (B32) and not(B30));
				Sd3 <= (not(B33) and not(B32) and not(B31) and (B30)) or (not(B33) and (B32) and not(B31) and not(B30)) or ((B33) and not(B32) and (B31) and not(B30)) or ((B32) and (B31) and (B30));
				Se3 <= (not(B33) and (B32) and not(B31)) or (not(B32) and not(B31) and (B30)) or (not(B33) and (B30));
				Sf3 <= ((B33) and (B32) and not(B31) and (B30)) or (not(B33) and not(B32) and (B30)) or (not(B33) and not(B32) and (B31)) or (not(B33) and (B31) and (B30));
				Sg3 <= ((B33) and (B32) and not(B31) and not(B30)) or (not(B33) and (B32) and (B31) and (B30)) or (not(B33) and not(B32) and not(B31));
				-- HEX4
				Sa4 <= (not(B43) and (B42) and not(B41) and not(B40)) or	(not(B43) and not(B42) and not(B41) and (B40)) or ((B43) and (B42) and not(B41) and (B40)) or ((B43) and not(B42) and (B41) and (B40));
				Sb4 <= (not(B43) and (B42) and not(B41) and (B40)) or ((B43) and (B42) and not(B40)) or ((B43) and (B41) and (B40)) or ((B42) and (B41) and not(B40));
				Sc4 <= (not(B43) and not(B42) and (B41) and not(B40)) or ((B43) and (B42) and (B41)) or ((B43) and (B42) and not(B40));
				Sd4 <= (not(B43) and not(B42) and not(B41) and (B40)) or (not(B43) and (B42) and not(B41) and not(B40)) or ((B43) and not(B42) and (B41) and not(B40)) or ((B42) and (B41) and (B40));
				Se4 <= (not(B43) and (B42) and not(B41)) or (not(B42) and not(B41) and (B40)) or (not(B43) and (B40));
				Sf4 <= ((B43) and (B42) and not(B41) and (B40)) or (not(B43) and not(B42) and (B40)) or (not(B43) and not(B42) and (B41)) or (not(B43) and (B41) and (B40));
				Sg4 <= ((B43) and (B42) and not(B41) and not(B40)) or (not(B43) and (B42) and (B41) and (B40)) or (not(B43) and not(B42) and not(B41));
			elsif estado = 4 then
				-- F
				Sa0 <= '0';
				Sb0 <= '1';
				Sc0 <= '1';
				Sd0 <= '1';
				Se0 <= '0';
				Sf0 <= '0';
				Sg0 <= '0';
				-- I
				Sa1 <= '1';
				Sb1 <= '1';
				Sc1 <= '1';
				Sd1 <= '1';
				Se1 <= '0';
				Sf1 <= '0';
				Sg1 <= '1';
				-- E
				Sa2 <= '1';
				Sb2 <= '1';
				Sc2 <= '0';
				Sd2 <= '0';
				Se2 <= '0';
				Sf2 <= '0';
				Sg2 <= '0';
				-- L
				Sa3 <= '1';
				Sb3 <= '1';
				Sc3 <= '1';
				Sd3 <= '0';
				Se3 <= '0';
				Sf3 <= '0';
				Sg3 <= '1';
				-- d
				Sa4 <= '1';
				Sb4 <= '0';
				Sc4 <= '0';
				Sd4 <= '0';
				Se4 <= '0';
				Sf4 <= '1';
				Sg4 <= '0';
				-- 2
				Sa5 <= '0';
				Sb5 <= '1';
				Sc5 <= '0';
				Sd5 <= '0';
				Se5 <= '1';
				Sf5 <= '0';
				Sg5 <= '0';
			elsif estado = 5 then
				-- HEX0
				Sa0 <= (not(C03) and (C02) and not(C01) and not(C00)) or	(not(C03) and not(C02) and not(C01) and (C00)) or ((C03) and (C02) and not(C01) and (C00)) or ((C03) and not(C02) and (C01) and (C00));
				Sb0 <= (not(C03) and (C02) and not(C01) and (C00)) or ((C03) and (C02) and not(C00)) or ((C03) and (C01) and (C00)) or ((C02) and (C01) and not(C00));
				Sc0 <= (not(C03) and not(C02) and (C01) and not(C00)) or ((C03) and (C02) and (C01)) or ((C03) and (C02) and not(C00));
				Sd0 <= (not(C03) and not(C02) and not(C01) and (C00)) or (not(C03) and (C02) and not(C01) and not(C00)) or ((C03) and not(C02) and (C01) and not(C00)) or ((C02) and (C01) and (C00));
				Se0 <= (not(C03) and (C02) and not(C01)) or (not(C02) and not(C01) and (C00)) or (not(C03) and (C00));
				Sf0 <= ((C03) and (C02) and not(C01) and (C00)) or (not(C03) and not(C02) and (C00)) or (not(C03) and not(C02) and (C01)) or (not(C03) and (C01) and (C00));
				Sg0 <= ((C03) and (C02) and not(C01) and not(C00)) or (not(C03) and (C02) and (C01) and (C00)) or (not(C03) and not(C02) and not(C01));
				-- HEX1
				Sa1 <= (not(C13) and (C12) and not(C11) and not(C10)) or	(not(C13) and not(C12) and not(C11) and (C10)) or ((C13) and (C12) and not(C11) and (C10)) or ((C13) and not(C12) and (C11) and (C10));
				Sb1 <= (not(C13) and (C12) and not(C11) and (C10)) or ((C13) and (C12) and not(C10)) or ((C13) and (C11) and (C10)) or ((C12) and (C11) and not(C10));
				Sc1 <= (not(C13) and not(C12) and (C11) and not(C10)) or ((C13) and (C12) and (C11)) or ((C13) and (C12) and not(C10));
				Sd1 <= (not(C13) and not(C12) and not(C11) and (C10)) or (not(C13) and (C12) and not(C11) and not(C10)) or ((C13) and not(C12) and (C11) and not(C10)) or ((C12) and (C11) and (C10));
				Se1 <= (not(C13) and (C12) and not(C11)) or (not(C12) and not(C11) and (C10)) or (not(C13) and (C10));
				Sf1 <= ((C13) and (C12) and not(C11) and (C10)) or (not(C13) and not(C12) and (C10)) or (not(C13) and not(C12) and (C11)) or (not(C13) and (C11) and (C10));
				Sg1 <= ((C13) and (C12) and not(C11) and not(C10)) or (not(C13) and (C12) and (C11) and (C10)) or (not(C13) and not(C12) and not(C11));
				-- HEX2
				Sa2 <= (not(C23) and (C22) and not(C21) and not(C20)) or	(not(C23) and not(C22) and not(C21) and (C20)) or ((C23) and (C22) and not(C21) and (C20)) or ((C23) and not(C22) and (C21) and (C20));
				Sb2 <= (not(C23) and (C22) and not(C21) and (C20)) or ((C23) and (C22) and not(C20)) or ((C23) and (C21) and (C20)) or ((C22) and (C21) and not(C20));
				Sc2 <= (not(C23) and not(C22) and (C21) and not(C20)) or ((C23) and (C22) and (C21)) or ((C23) and (C22) and not(C20));
				Sd2 <= (not(C23) and not(C22) and not(C21) and (C20)) or (not(C23) and (C22) and not(C21) and not(C20)) or ((C23) and not(C22) and (C21) and not(C20)) or ((C22) and (C21) and (C20));
				Se2 <= (not(C23) and (C22) and not(C21)) or (not(C22) and not(C21) and (C20)) or (not(C23) and (C20));
				Sf2 <= ((C23) and (C22) and not(C21) and (C20)) or (not(C23) and not(C22) and (C20)) or (not(C23) and not(C22) and (C21)) or (not(C23) and (C21) and (C20));
				Sg2 <= ((C23) and (C22) and not(C21) and not(C20)) or (not(C23) and (C22) and (C21) and (C20)) or (not(C23) and not(C22) and not(C21));
				-- HEX3
				Sa3 <= (not(C33) and (C32) and not(C31) and not(C30)) or	(not(C33) and not(C32) and not(C31) and (C30)) or ((C33) and (C32) and not(C31) and (C30)) or ((C33) and not(C32) and (C31) and (C30));
				Sb3 <= (not(C33) and (C32) and not(C31) and (C30)) or ((C33) and (C32) and not(C30)) or ((C33) and (C31) and (C30)) or ((C32) and (C31) and not(C30));
				Sc3 <= (not(C33) and not(C32) and (C31) and not(C30)) or ((C33) and (C32) and (C31)) or ((C33) and (C32) and not(C30));
				Sd3 <= (not(C33) and not(C32) and not(C31) and (C30)) or (not(C33) and (C32) and not(C31) and not(C30)) or ((C33) and not(C32) and (C31) and not(C30)) or ((C32) and (C31) and (C30));
				Se3 <= (not(C33) and (C32) and not(C31)) or (not(C32) and not(C31) and (C30)) or (not(C33) and (C30));
				Sf3 <= ((C33) and (C32) and not(C31) and (C30)) or (not(C33) and not(C32) and (C30)) or (not(C33) and not(C32) and (C31)) or (not(C33) and (C31) and (C30));
				Sg3 <= ((C33) and (C32) and not(C31) and not(C30)) or (not(C33) and (C32) and (C31) and (C30)) or (not(C33) and not(C32) and not(C31));
				-- HEX4
				Sa4 <= (not(C43) and (C42) and not(C41) and not(C40)) or	(not(C43) and not(C42) and not(C41) and (C40)) or ((C43) and (C42) and not(C41) and (C40)) or ((C43) and not(C42) and (C41) and (C40));
				Sb4 <= (not(C43) and (C42) and not(C41) and (C40)) or ((C43) and (C42) and not(C40)) or ((C43) and (C41) and (C40)) or ((C42) and (C41) and not(C40));
				Sc4 <= (not(C43) and not(C42) and (C41) and not(C40)) or ((C43) and (C42) and (C41)) or ((C43) and (C42) and not(C40));
				Sd4 <= (not(C43) and not(C42) and not(C41) and (C40)) or (not(C43) and (C42) and not(C41) and not(C40)) or ((C43) and not(C42) and (C41) and not(C40)) or ((C42) and (C41) and (C40));
				Se4 <= (not(C43) and (C42) and not(C41)) or (not(C42) and not(C41) and (C40)) or (not(C43) and (C40));
				Sf4 <= ((C43) and (C42) and not(C41) and (C40)) or (not(C43) and not(C42) and (C40)) or (not(C43) and not(C42) and (C41)) or (not(C43) and (C41) and (C40));
				Sg4 <= ((C43) and (C42) and not(C41) and not(C40)) or (not(C43) and (C42) and (C41) and (C40)) or (not(C43) and not(C42) and not(C41));
			elsif estado = 6 then
				-- F
				Sa0 <= '0';
				Sb0 <= '1';
				Sc0 <= '1';
				Sd0 <= '1';
				Se0 <= '0';
				Sf0 <= '0';
				Sg0 <= '0';
				-- I
				Sa1 <= '1';
				Sb1 <= '1';
				Sc1 <= '1';
				Sd1 <= '1';
				Se1 <= '0';
				Sf1 <= '0';
				Sg1 <= '1';
				-- E
				Sa2 <= '1';
				Sb2 <= '1';
				Sc2 <= '0';
				Sd2 <= '0';
				Se2 <= '0';
				Sf2 <= '0';
				Sg2 <= '0';
				-- L
				Sa3 <= '1';
				Sb3 <= '1';
				Sc3 <= '1';
				Sd3 <= '0';
				Se3 <= '0';
				Sf3 <= '0';
				Sg3 <= '1';
				-- d
				Sa4 <= '1';
				Sb4 <= '0';
				Sc4 <= '0';
				Sd4 <= '0';
				Se4 <= '0';
				Sf4 <= '1';
				Sg4 <= '0';
				-- 3
				Sa5 <= '0';
				Sb5 <= '0';
				Sc5 <= '0';
				Sd5 <= '0';
				Se5 <= '1';
				Sf5 <= '1';
				Sg5 <= '0';
			elsif estado = 7 then
				-- HEX0
				Sa0 <= (not(D03) and (D02) and not(D01) and not(D00)) or	(not(D03) and not(D02) and not(D01) and (D00)) or ((D03) and (D02) and not(D01) and (D00)) or ((D03) and not(D02) and (D01) and (D00));
				Sb0 <= (not(D03) and (D02) and not(D01) and (D00)) or ((D03) and (D02) and not(D00)) or ((D03) and (D01) and (D00)) or ((D02) and (D01) and not(D00));
				Sc0 <= (not(D03) and not(D02) and (D01) and not(D00)) or ((D03) and (D02) and (D01)) or ((D03) and (D02) and not(D00));
				Sd0 <= (not(D03) and not(D02) and not(D01) and (D00)) or (not(D03) and (D02) and not(D01) and not(D00)) or ((D03) and not(D02) and (D01) and not(D00)) or ((D02) and (D01) and (D00));
				Se0 <= (not(D03) and (D02) and not(D01)) or (not(D02) and not(D01) and (D00)) or (not(D03) and (D00));
				Sf0 <= ((D03) and (D02) and not(D01) and (D00)) or (not(D03) and not(D02) and (D00)) or (not(D03) and not(D02) and (D01)) or (not(D03) and (D01) and (D00));
				Sg0 <= ((D03) and (D02) and not(D01) and not(D00)) or (not(D03) and (D02) and (D01) and (D00)) or (not(D03) and not(D02) and not(D01));
				-- HEX1
				Sa1 <= (not(D13) and (D12) and not(D11) and not(D10)) or	(not(D13) and not(D12) and not(D11) and (D10)) or ((D13) and (D12) and not(D11) and (D10)) or ((D13) and not(D12) and (D11) and (D10));
				Sb1 <= (not(D13) and (D12) and not(D11) and (D10)) or ((D13) and (D12) and not(D10)) or ((D13) and (D11) and (D10)) or ((D12) and (D11) and not(D10));
				Sc1 <= (not(D13) and not(D12) and (D11) and not(D10)) or ((D13) and (D12) and (D11)) or ((D13) and (D12) and not(D10));
				Sd1 <= (not(D13) and not(D12) and not(D11) and (D10)) or (not(D13) and (D12) and not(D11) and not(D10)) or ((D13) and not(D12) and (D11) and not(D10)) or ((D12) and (D11) and (D10));
				Se1 <= (not(D13) and (D12) and not(D11)) or (not(D12) and not(D11) and (D10)) or (not(D13) and (D10));
				Sf1 <= ((D13) and (D12) and not(D11) and (D10)) or (not(D13) and not(D12) and (D10)) or (not(D13) and not(D12) and (D11)) or (not(D13) and (D11) and (D10));
				Sg1 <= ((D13) and (D12) and not(D11) and not(D10)) or (not(D13) and (D12) and (D11) and (D10)) or (not(D13) and not(D12) and not(D11));
				-- HEX2
				Sa2 <= (not(D23) and (D22) and not(D21) and not(D20)) or	(not(D23) and not(D22) and not(D21) and (D20)) or ((D23) and (D22) and not(D21) and (D20)) or ((D23) and not(D22) and (D21) and (D20));
				Sb2 <= (not(D23) and (D22) and not(D21) and (D20)) or ((D23) and (D22) and not(D20)) or ((D23) and (D21) and (D20)) or ((D22) and (D21) and not(D20));
				Sc2 <= (not(D23) and not(D22) and (D21) and not(D20)) or ((D23) and (D22) and (D21)) or ((D23) and (D22) and not(D20));
				Sd2 <= (not(D23) and not(D22) and not(D21) and (D20)) or (not(D23) and (D22) and not(D21) and not(D20)) or ((D23) and not(D22) and (D21) and not(D20)) or ((D22) and (D21) and (D20));
				Se2 <= (not(D23) and (D22) and not(D21)) or (not(D22) and not(D21) and (D20)) or (not(D23) and (D20));
				Sf2 <= ((D23) and (D22) and not(D21) and (D20)) or (not(D23) and not(D22) and (D20)) or (not(D23) and not(D22) and (D21)) or (not(D23) and (D21) and (D20));
				Sg2 <= ((D23) and (D22) and not(D21) and not(D20)) or (not(D23) and (D22) and (D21) and (D20)) or (not(D23) and not(D22) and not(D21));
				-- HEX3
				Sa3 <= (not(D33) and (D32) and not(D31) and not(D30)) or	(not(D33) and not(D32) and not(D31) and (D30)) or ((D33) and (D32) and not(D31) and (D30)) or ((D33) and not(D32) and (D31) and (D30));
				Sb3 <= (not(D33) and (D32) and not(D31) and (D30)) or ((D33) and (D32) and not(D30)) or ((D33) and (D31) and (D30)) or ((D32) and (D31) and not(D30));
				Sc3 <= (not(D33) and not(D32) and (D31) and not(D30)) or ((D33) and (D32) and (D31)) or ((D33) and (D32) and not(D30));
				Sd3 <= (not(D33) and not(D32) and not(D31) and (D30)) or (not(D33) and (D32) and not(D31) and not(D30)) or ((D33) and not(D32) and (D31) and not(D30)) or ((D32) and (D31) and (D30));
				Se3 <= (not(D33) and (D32) and not(D31)) or (not(D32) and not(D31) and (D30)) or (not(D33) and (D30));
				Sf3 <= ((D33) and (D32) and not(D31) and (D30)) or (not(D33) and not(D32) and (D30)) or (not(D33) and not(D32) and (D31)) or (not(D33) and (D31) and (D30));
				Sg3 <= ((D33) and (D32) and not(D31) and not(D30)) or (not(D33) and (D32) and (D31) and (D30)) or (not(D33) and not(D32) and not(D31));
				-- HEX4
				Sa4 <= (not(D43) and (D42) and not(D41) and not(D40)) or	(not(D43) and not(D42) and not(D41) and (D40)) or ((D43) and (D42) and not(D41) and (D40)) or ((D43) and not(D42) and (D41) and (D40));
				Sb4 <= (not(D43) and (D42) and not(D41) and (D40)) or ((D43) and (D42) and not(D40)) or ((D43) and (D41) and (D40)) or ((D42) and (D41) and not(D40));
				Sc4 <= (not(D43) and not(D42) and (D41) and not(D40)) or ((D43) and (D42) and (D41)) or ((D43) and (D42) and not(D40));
				Sd4 <= (not(D43) and not(D42) and not(D41) and (D40)) or (not(D43) and (D42) and not(D41) and not(D40)) or ((D43) and not(D42) and (D41) and not(D40)) or ((D42) and (D41) and (D40));
				Se4 <= (not(D43) and (D42) and not(D41)) or (not(D42) and not(D41) and (D40)) or (not(D43) and (D40));
				Sf4 <= ((D43) and (D42) and not(D41) and (D40)) or (not(D43) and not(D42) and (D40)) or (not(D43) and not(D42) and (D41)) or (not(D43) and (D41) and (D40));
				Sg4 <= ((D43) and (D42) and not(D41) and not(D40)) or (not(D43) and (D42) and (D41) and (D40)) or (not(D43) and not(D42) and not(D41));
			elsif estado = 8 then
				-- F
				Sa0 <= '0';
				Sb0 <= '1';
				Sc0 <= '1';
				Sd0 <= '1';
				Se0 <= '0';
				Sf0 <= '0';
				Sg0 <= '0';
				-- I
				Sa1 <= '1';
				Sb1 <= '1';
				Sc1 <= '1';
				Sd1 <= '1';
				Se1 <= '0';
				Sf1 <= '0';
				Sg1 <= '1';
				-- E
				Sa2 <= '1';
				Sb2 <= '1';
				Sc2 <= '0';
				Sd2 <= '0';
				Se2 <= '0';
				Sf2 <= '0';
				Sg2 <= '0';
				-- L
				Sa3 <= '1';
				Sb3 <= '1';
				Sc3 <= '1';
				Sd3 <= '0';
				Se3 <= '0';
				Sf3 <= '0';
				Sg3 <= '1';
				-- d
				Sa4 <= '1';
				Sb4 <= '0';
				Sc4 <= '0';
				Sd4 <= '0';
				Se4 <= '0';
				Sf4 <= '1';
				Sg4 <= '0';
				-- 4
				Sa5 <= '1';
				Sb5 <= '0';
				Sc5 <= '0';
				Sd5 <= '1';
				Se5 <= '1';
				Sf5 <= '0';
				Sg5 <= '0';
			elsif estado = 9 then
				-- HEX0
				Sa0 <= (not(E03) and (E02) and not(E01) and not(E00)) or	(not(E03) and not(E02) and not(E01) and (E00)) or ((E03) and (E02) and not(E01) and (E00)) or ((E03) and not(E02) and (E01) and (E00));
				Sb0 <= (not(E03) and (E02) and not(E01) and (E00)) or ((E03) and (E02) and not(E00)) or ((E03) and (E01) and (E00)) or ((E02) and (E01) and not(E00));
				Sc0 <= (not(E03) and not(E02) and (E01) and not(E00)) or ((E03) and (E02) and (E01)) or ((E03) and (E02) and not(E00));
				Sd0 <= (not(E03) and not(E02) and not(E01) and (E00)) or (not(E03) and (E02) and not(E01) and not(E00)) or ((E03) and not(E02) and (E01) and not(E00)) or ((E02) and (E01) and (E00));
				Se0 <= (not(E03) and (E02) and not(E01)) or (not(E02) and not(E01) and (E00)) or (not(E03) and (E00));
				Sf0 <= ((E03) and (E02) and not(E01) and (E00)) or (not(E03) and not(E02) and (E00)) or (not(E03) and not(E02) and (E01)) or (not(E03) and (E01) and (E00));
				Sg0 <= ((E03) and (E02) and not(E01) and not(E00)) or (not(E03) and (E02) and (E01) and (E00)) or (not(E03) and not(E02) and not(E01));
				-- HEX1
				Sa1 <= (not(E13) and (E12) and not(E11) and not(E10)) or	(not(E13) and not(E12) and not(E11) and (E10)) or ((E13) and (E12) and not(E11) and (E10)) or ((E13) and not(E12) and (E11) and (E10));
				Sb1 <= (not(E13) and (E12) and not(E11) and (E10)) or ((E13) and (E12) and not(E10)) or ((E13) and (E11) and (E10)) or ((E12) and (E11) and not(E10));
				Sc1 <= (not(E13) and not(E12) and (E11) and not(E10)) or ((E13) and (E12) and (E11)) or ((E13) and (E12) and not(E10));
				Sd1 <= (not(E13) and not(E12) and not(E11) and (E10)) or (not(E13) and (E12) and not(E11) and not(E10)) or ((E13) and not(E12) and (E11) and not(E10)) or ((E12) and (E11) and (E10));
				Se1 <= (not(E13) and (E12) and not(E11)) or (not(E12) and not(E11) and (E10)) or (not(E13) and (E10));
				Sf1 <= ((E13) and (E12) and not(E11) and (E10)) or (not(E13) and not(E12) and (E10)) or (not(E13) and not(E12) and (E11)) or (not(E13) and (E11) and (E10));
				Sg1 <= ((E13) and (E12) and not(E11) and not(E10)) or (not(E13) and (E12) and (E11) and (E10)) or (not(E13) and not(E12) and not(E11));
				-- HEX2
				Sa2 <= (not(E23) and (E22) and not(E21) and not(E20)) or	(not(E23) and not(E22) and not(E21) and (E20)) or ((E23) and (E22) and not(E21) and (E20)) or ((E23) and not(E22) and (E21) and (E20));
				Sb2 <= (not(E23) and (E22) and not(E21) and (E20)) or ((E23) and (E22) and not(E20)) or ((E23) and (E21) and (E20)) or ((E22) and (E21) and not(E20));
				Sc2 <= (not(E23) and not(E22) and (E21) and not(E20)) or ((E23) and (E22) and (E21)) or ((E23) and (E22) and not(E20));
				Sd2 <= (not(E23) and not(E22) and not(E21) and (E20)) or (not(E23) and (E22) and not(E21) and not(E20)) or ((E23) and not(E22) and (E21) and not(E20)) or ((E22) and (E21) and (E20));
				Se2 <= (not(E23) and (E22) and not(E21)) or (not(E22) and not(E21) and (E20)) or (not(E23) and (E20));
				Sf2 <= ((E23) and (E22) and not(E21) and (E20)) or (not(E23) and not(E22) and (E20)) or (not(E23) and not(E22) and (E21)) or (not(E23) and (E21) and (E20));
				Sg2 <= ((E23) and (E22) and not(E21) and not(E20)) or (not(E23) and (E22) and (E21) and (E20)) or (not(E23) and not(E22) and not(E21));
				-- HEX3
				Sa3 <= (not(E33) and (E32) and not(E31) and not(E30)) or	(not(E33) and not(E32) and not(E31) and (E30)) or ((E33) and (E32) and not(E31) and (E30)) or ((E33) and not(E32) and (E31) and (E30));
				Sb3 <= (not(E33) and (E32) and not(E31) and (E30)) or ((E33) and (E32) and not(E30)) or ((E33) and (E31) and (E30)) or ((E32) and (E31) and not(E30));
				Sc3 <= (not(E33) and not(E32) and (E31) and not(E30)) or ((E33) and (E32) and (E31)) or ((E33) and (E32) and not(E30));
				Sd3 <= (not(E33) and not(E32) and not(E31) and (E30)) or (not(E33) and (E32) and not(E31) and not(E30)) or ((E33) and not(E32) and (E31) and not(E30)) or ((E32) and (E31) and (E30));
				Se3 <= (not(E33) and (E32) and not(E31)) or (not(E32) and not(E31) and (E30)) or (not(E33) and (E30));
				Sf3 <= ((E33) and (E32) and not(E31) and (E30)) or (not(E33) and not(E32) and (E30)) or (not(E33) and not(E32) and (E31)) or (not(E33) and (E31) and (E30));
				Sg3 <= ((E33) and (E32) and not(E31) and not(E30)) or (not(E33) and (E32) and (E31) and (E30)) or (not(E33) and not(E32) and not(E31));
				-- HEX4
				Sa4 <= (not(E43) and (E42) and not(E41) and not(E40)) or	(not(E43) and not(E42) and not(E41) and (E40)) or ((E43) and (E42) and not(E41) and (E40)) or ((E43) and not(E42) and (E41) and (E40));
				Sb4 <= (not(E43) and (E42) and not(E41) and (E40)) or ((E43) and (E42) and not(E40)) or ((E43) and (E41) and (E40)) or ((E42) and (E41) and not(E40));
				Sc4 <= (not(E43) and not(E42) and (E41) and not(E40)) or ((E43) and (E42) and (E41)) or ((E43) and (E42) and not(E40));
				Sd4 <= (not(E43) and not(E42) and not(E41) and (E40)) or (not(E43) and (E42) and not(E41) and not(E40)) or ((E43) and not(E42) and (E41) and not(E40)) or ((E42) and (E41) and (E40));
				Se4 <= (not(E43) and (E42) and not(E41)) or (not(E42) and not(E41) and (E40)) or (not(E43) and (E40));
				Sf4 <= ((E43) and (E42) and not(E41) and (E40)) or (not(E43) and not(E42) and (E40)) or (not(E43) and not(E42) and (E41)) or (not(E43) and (E41) and (E40));
				Sg4 <= ((E43) and (E42) and not(E41) and not(E40)) or (not(E43) and (E42) and (E41) and (E40)) or (not(E43) and not(E42) and not(E41));
			elsif estado = 10 then
				-- P
				Sa0 <= '0';
				Sb0 <= '0';
				Sc0 <= '1';
				Sd0 <= '1';
				Se0 <= '0';
				Sf0 <= '0';
				Sg0 <= '0';
				-- r
				Sa1 <= '0';
				Sb1 <= '0';
				Sc1 <= '1';
				Sd1 <= '1';
				Se1 <= '0';
				Sf1 <= '0';
				Sg1 <= '1';
				-- E
				Sa2 <= '1';
				Sb2 <= '1';
				Sc2 <= '0';
				Sd2 <= '0';
				Se2 <= '0';
				Sf2 <= '0';
				Sg2 <= '0';
				-- d
				Sa3 <= '1';
				Sb3 <= '0';
				Sc3 <= '0';
				Sd3 <= '0';
				Se3 <= '0';
				Sf3 <= '1';
				Sg3 <= '0';
				-- I
				Sa4 <= '1';
				Sb4 <= '1';
				Sc4 <= '1';
				Sd4 <= '1';
				Se4 <= '0';
				Sf4 <= '0';
				Sg4 <= '1';
				-- C
				Sa5 <= '0';
				Sb5 <= '1';
				Sc5 <= '1';
				Sd5 <= '0';
				Se5 <= '0';
				Sf5 <= '0';
				Sg5 <= '1';
			elsif estado = 11 then
				-- HEX0
				Sa0 <= (not(O03) and (O02) and not(O01) and not(O00)) or	(not(O03) and not(O02) and not(O01) and (O00)) or ((O03) and (O02) and not(O01) and (O00)) or ((O03) and not(O02) and (O01) and (O00));
				Sb0 <= (not(O03) and (O02) and not(O01) and (O00)) or ((O03) and (O02) and not(O00)) or ((O03) and (O01) and (O00)) or ((O02) and (O01) and not(O00));
				Sc0 <= (not(O03) and not(O02) and (O01) and not(O00)) or ((O03) and (O02) and (O01)) or ((O03) and (O02) and not(O00));
				Sd0 <= (not(O03) and not(O02) and not(O01) and (O00)) or (not(O03) and (O02) and not(O01) and not(O00)) or ((O03) and not(O02) and (O01) and not(O00)) or ((O02) and (O01) and (O00));
				Se0 <= (not(O03) and (O02) and not(O01)) or (not(O02) and not(O01) and (O00)) or (not(O03) and (O00));
				Sf0 <= ((O03) and (O02) and not(O01) and (O00)) or (not(O03) and not(O02) and (O00)) or (not(O03) and not(O02) and (O01)) or (not(O03) and (O01) and (O00));
				Sg0 <= ((O03) and (O02) and not(O01) and not(O00)) or (not(O03) and (O02) and (O01) and (O00)) or (not(O03) and not(O02) and not(O01));
				-- HEX1
				Sa1 <= (not(O13) and (O12) and not(O11) and not(O10)) or	(not(O13) and not(O12) and not(O11) and (O10)) or ((O13) and (O12) and not(O11) and (O10)) or ((O13) and not(O12) and (O11) and (O10));
				Sb1 <= (not(O13) and (O12) and not(O11) and (O10)) or ((O13) and (O12) and not(O10)) or ((O13) and (O11) and (O10)) or ((O12) and (O11) and not(O10));
				Sc1 <= (not(O13) and not(O12) and (O11) and not(O10)) or ((O13) and (O12) and (O11)) or ((O13) and (O12) and not(O10));
				Sd1 <= (not(O13) and not(O12) and not(O11) and (O10)) or (not(O13) and (O12) and not(O11) and not(O10)) or ((O13) and not(O12) and (O11) and not(O10)) or ((O12) and (O11) and (O10));
				Se1 <= (not(O13) and (O12) and not(O11)) or (not(O12) and not(O11) and (O10)) or (not(O13) and (O10));
				Sf1 <= ((O13) and (O12) and not(O11) and (O10)) or (not(O13) and not(O12) and (O10)) or (not(O13) and not(O12) and (O11)) or (not(O13) and (O11) and (O10));
				Sg1 <= ((O13) and (O12) and not(O11) and not(O10)) or (not(O13) and (O12) and (O11) and (O10)) or (not(O13) and not(O12) and not(O11));
				-- HEX2
				Sa2 <= (not(O23) and (O22) and not(O21) and not(O20)) or	(not(O23) and not(O22) and not(O21) and (O20)) or ((O23) and (O22) and not(O21) and (O20)) or ((O23) and not(O22) and (O21) and (O20));
				Sb2 <= (not(O23) and (O22) and not(O21) and (O20)) or ((O23) and (O22) and not(O20)) or ((O23) and (O21) and (O20)) or ((O22) and (O21) and not(O20));
				Sc2 <= (not(O23) and not(O22) and (O21) and not(O20)) or ((O23) and (O22) and (O21)) or ((O23) and (O22) and not(O20));
				Sd2 <= (not(O23) and not(O22) and not(O21) and (O20)) or (not(O23) and (O22) and not(O21) and not(O20)) or ((O23) and not(O22) and (O21) and not(O20)) or ((O22) and (O21) and (O20));
				Se2 <= (not(O23) and (O22) and not(O21)) or (not(O22) and not(O21) and (O20)) or (not(O23) and (O20));
				Sf2 <= ((O23) and (O22) and not(O21) and (O20)) or (not(O23) and not(O22) and (O20)) or (not(O23) and not(O22) and (O21)) or (not(O23) and (O21) and (O20));
				Sg2 <= ((O23) and (O22) and not(O21) and not(O20)) or (not(O23) and (O22) and (O21) and (O20)) or (not(O23) and not(O22) and not(O21));
				-- HEX3
				Sa3 <= (not(O33) and (O32) and not(O31) and not(O30)) or	(not(O33) and not(O32) and not(O31) and (O30)) or ((O33) and (O32) and not(O31) and (O30)) or ((O33) and not(O32) and (O31) and (O30));
				Sb3 <= (not(O33) and (O32) and not(O31) and (O30)) or ((O33) and (O32) and not(O30)) or ((O33) and (O31) and (O30)) or ((O32) and (O31) and not(O30));
				Sc3 <= (not(O33) and not(O32) and (O31) and not(O30)) or ((O33) and (O32) and (O31)) or ((O33) and (O32) and not(O30));
				Sd3 <= (not(O33) and not(O32) and not(O31) and (O30)) or (not(O33) and (O32) and not(O31) and not(O30)) or ((O33) and not(O32) and (O31) and not(O30)) or ((O32) and (O31) and (O30));
				Se3 <= (not(O33) and (O32) and not(O31)) or (not(O32) and not(O31) and (O30)) or (not(O33) and (O30));
				Sf3 <= ((O33) and (O32) and not(O31) and (O30)) or (not(O33) and not(O32) and (O30)) or (not(O33) and not(O32) and (O31)) or (not(O33) and (O31) and (O30));
				Sg3 <= ((O33) and (O32) and not(O31) and not(O30)) or (not(O33) and (O32) and (O31) and (O30)) or (not(O33) and not(O32) and not(O31));
				-- HEX4
				Sa4 <= (not(O43) and (O42) and not(O41) and not(O40)) or	(not(O43) and not(O42) and not(O41) and (O40)) or ((O43) and (O42) and not(O41) and (O40)) or ((O43) and not(O42) and (O41) and (O40));
				Sb4 <= (not(O43) and (O42) and not(O41) and (O40)) or ((O43) and (O42) and not(O40)) or ((O43) and (O41) and (O40)) or ((O42) and (O41) and not(O40));
				Sc4 <= (not(O43) and not(O42) and (O41) and not(O40)) or ((O43) and (O42) and (O41)) or ((O43) and (O42) and not(O40));
				Sd4 <= (not(O43) and not(O42) and not(O41) and (O40)) or (not(O43) and (O42) and not(O41) and not(O40)) or ((O43) and not(O42) and (O41) and not(O40)) or ((O42) and (O41) and (O40));
				Se4 <= (not(O43) and (O42) and not(O41)) or (not(O42) and not(O41) and (O40)) or (not(O43) and (O40));
				Sf4 <= ((O43) and (O42) and not(O41) and (O40)) or (not(O43) and not(O42) and (O40)) or (not(O43) and not(O42) and (O41)) or (not(O43) and (O41) and (O40));
				Sg4 <= ((O43) and (O42) and not(O41) and not(O40)) or (not(O43) and (O42) and (O41) and (O40)) or (not(O43) and not(O42) and not(O41));
			end if;

		end process;	
	
end arq_estados_display;