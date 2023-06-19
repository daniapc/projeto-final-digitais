library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conversor_bin_dec is
    port(
        O00, O01, O02, O03,
        O04, O05, O06, O07,
        O08, O09, O10, O11,
        O12, O13, O14, O15: in std_logic;
	 
        A00, A01, A02, A03,
        B00, B01, B02, B03,
        C00, C01, C02, C03,
        D00, D01, D02, D03,
        E00, E01, E02, E03: out std_logic
    );
end conversor_bin_dec;

architecture arq_conversor_bin_dec of conversor_bin_dec is
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
	 
    signal binario: integer;
	 
	 signal dig_0: integer;
	 signal dig_1: integer;
	 signal dig_2: integer;
	 signal dig_3: integer;
	 
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
	 
	 begin	 
			  binario <= 1*int(O00) + 2*int(O01) + 4*int(O02) + 8*int(O03) +
							16*int(O04) + 32*int(O05) + 64*int(O06) + 128*int(O07) +
							256*int(O08) + 512*int(O09) + 1024*int(O10) + 2048*int(O11) +
							4096*int(O12) + 8192*int(O13) + 16384*int(O14) + 32768*int(O15);
			  
		process (binario) is
		begin
			  
			  dig_0 <= binario/10;
			  dig_1 <= dig_0/10;
			  dig_2 <= dig_1/10;
			  dig_3 <= dig_2/10;
			  
			  out_00 <= (binario mod 10)/2;
			  out_01 <= out_00/2;
			  out_02 <= out_01/2;
			  out_03 <= (dig_0 mod 10)/2;
			  out_04 <= out_03/2;
			  out_05 <= out_04/2;
			  out_06 <= (dig_1 mod 10)/2;
			  out_07 <= out_06/2;
			  out_08 <= out_07/2;
			  out_09 <= (dig_2 mod 10)/2;
			  out_10 <= out_09/2;
			  out_11 <= out_10/2;
			  out_12 <= (dig_3 mod 10)/2;
			  out_13 <= out_12/2;
			  out_14 <= out_13/2;
		
			  A00 <= logic((binario mod 10) mod 2);
			  A01 <= logic(out_00 mod 2);
			  A02 <= logic(out_01 mod 2);
			  A03 <= logic(out_02 mod 2);
			  B00 <= logic((dig_0 mod 10) mod 2);
			  B01 <= logic(out_03 mod 2);
			  B02 <= logic(out_04 mod 2);
			  B03 <= logic(out_05 mod 2);
			  C00 <= logic((dig_1 mod 10) mod 2);
			  C01 <= logic(out_06);
			  C02 <= logic(out_07);
			  C03 <= logic(out_08);
			  D00 <= logic((dig_2 mod 10) mod 2);
			  D01 <= logic(out_09);
			  D02 <= logic(out_10);
			  D03 <= logic(out_11);
			  E00 <= logic((dig_3 mod 10) mod 2);
			  E01 <= logic(out_12);
			  E02 <= logic(out_13);
			  E03 <= logic(out_14);
			  
			  
		end process;	
	
     
end arq_conversor_bin_dec;