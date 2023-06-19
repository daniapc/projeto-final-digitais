library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conversor is
    port(
        A00, A01, A02, A03,
        B00, B01, B02, B03,
        C00, C01, C02, C03,
        D00, D01, D02, D03,
        E00, E01, E02, E03: in std_logic;

        O00, O01, O02, O03,
        O04, O05, O06, O07,
        O08, O09, O10, O11,
        O12, O13, O14, O15: out std_logic
    );
end conversor;

architecture arq_conversor of conversor is
	 function int( s : std_logic ) return integer is
	 begin
	 	if s = '1' then
	 		return 1;
		else
	 		return 0;
		end if;
	 end function;
	 
	 function logic( s : integer ) return std_logic is
	 begin
	 	if s = 1 then
	 		return '1';
		else
	 		return '0';
		end if;
	 end function;	 
	 
    signal decimal: integer;
	 
	 signal out_00: integer;
	 signal out_01: integer;
	 signal out_02: integer;
	 signal out_03: integer;
	 signal out_04: integer;
	 signal out_05: integer;
	 signal out_06: integer;
	 signal out_07: integer;
	 signal out_08: integer;
	 signal out_09: integer;
	 signal out_10: integer;
	 signal out_11: integer;
	 signal out_12: integer;
	 signal out_13: integer;
	 signal out_14: integer;

    signal outcome: integer;
	 
	 begin	 
			  decimal <= (1*int(A00) + 2*int(A01) + 4*int(A02) + 8*int(A03)) +
			             (1*int(B00) + 2*int(B01) + 4*int(B02) + 8*int(B03))*10 +
							 (1*int(C00) + 2*int(C01) + 4*int(C02) + 8*int(C03))*100 +
							 (1*int(D00) + 2*int(D01) + 4*int(D02) + 8*int(D03))*1000 +
							 (1*int(E00) + 2*int(E01) + 4*int(E02) + 8*int(E03))*10000;
			  
		process (decimal) is
		begin
			  
			  out_00 <= decimal/2;
			  out_01 <= out_00/2;
			  out_02 <= out_01/2;
			  out_03 <= out_02/2;
			  out_04 <= out_03/2;
			  out_05 <= out_04/2;
			  out_06 <= out_05/2;
			  out_07 <= out_06/2;
			  out_08 <= out_07/2;
			  out_09 <= out_08/2;
			  out_10 <= out_09/2;
			  out_11 <= out_10/2;
			  out_12 <= out_11/2;
			  out_13 <= out_12/2;
			  out_14 <= out_13/2;
		
			  O00 <= logic(decimal mod 2);
			  O01 <= logic(out_00 mod 2);
			  O02 <= logic(out_01 mod 2);
			  O03 <= logic(out_02 mod 2);
			  O04 <= logic(out_03 mod 2);
			  O05 <= logic(out_04 mod 2);
			  O06 <= logic(out_05 mod 2);
			  O07 <= logic(out_06 mod 2);
			  O08 <= logic(out_07 mod 2);
			  O09 <= logic(out_08 mod 2);
			  O10 <= logic(out_09 mod 2);
			  O11 <= logic(out_10 mod 2);
			  O12 <= logic(out_11 mod 2);
			  O13 <= logic(out_12 mod 2);
			  O14 <= logic(out_13 mod 2);
			  O15 <= logic(out_14 mod 2);
			  
			  
		end process;	
	
     
end arq_conversor;