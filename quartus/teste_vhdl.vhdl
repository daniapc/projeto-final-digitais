library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity atributos is
    port(
        A00, A01, A02, A03,
        A04, A05, A06, A07,
        A08, A09, A10, A11,
        A12, A13, A14, A15, 
        B00, B01, B02, B03,
        B04, B05, B06, B07,
        B08, B09, B10, B11,
        B12, B13, B14, B15,
        C00, C01, C02, C03,
        C04, C05, C06, C07,
        C08, C09, C10, C11,
        C12, C13, C14, C15,
        D00, D01, D02, D03,
        D04, D05, D06, D07,
        D08, D09, D10, D11,
        D12, D13, D14, D15,
        E00, E01, E02, E03,
        E04, E05, E06, E07,
        E08, E09, E10, E11,
        E12, E13, E14, E15: in std_logic;

        O00, O01, O02, O03,
        O04, O05, O06, O07,
        O08, O09, O10, O11,
        O12, O13, O14, O15: out std_logic
    );
end atributos;

architecture arvore_decisao of atributos is
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
	 
	 
    type t_vector is array (0 to 15) of integer;
    
	 signal atributo_0_array: t_vector;
    signal atributo_0: integer:=0;
    signal atributo_1: integer:=0;
    signal atributo_2: integer:=0;
    signal atributo_3: integer:=0;
    signal atributo_4: integer:=0;

    signal outcome_array: t_vector;
    signal outcome: integer:=0;
	 
	 begin
	 
		 process 
			(A00, A01, A02, A03,
        A04, A05, A06, A07,
        A08, A09, A10, A11,
        A12, A13, A14, A15, 
        B00, B01, B02, B03,
        B04, B05, B06, B07,
        B08, B09, B10, B11,
        B12, B13, B14, B15,
        C00, C01, C02, C03,
        C04, C05, C06, C07,
        C08, C09, C10, C11,
        C12, C13, C14, C15,
        D00, D01, D02, D03,
        D04, D05, D06, D07,
        D08, D09, D10, D11,
        D12, D13, D14, D15,
        E00, E01, E02, E03,
        E04, E05, E06, E07,
        E08, E09, E10, E11,
        E12, E13, E14, E15,
		  atributo_0_array, outcome_array,outcome,
		  atributo_0, atributo_1, atributo_2, atributo_3, atributo_4)
			
		 is
		 
		 begin
		
			  atributo_0 <= 1*int(A00) + 2*int(A01) + 4*int(A02) + 8*int(A03) +
							16*int(A04) + 32*int(A05) + 64*int(A06) + 128*int(A07) +
							256*int(A08) + 512*int(A09) + 1024*int(A10) + 2048*int(A11) +
							4096*int(A12) + 8192*int(A13) + 16384*int(A14) + 32768*int(A15);
			  atributo_1 <= 1*int(B00) + 2*int(B01) + 4*int(B02) + 8*int(B03) +
							16*int(B04) + 32*int(B05) + 64*int(B06) + 128*int(B07) +
							256*int(B08) + 512*int(B09) + 1024*int(B10) + 2048*int(B11) +
							4096*int(B12) + 8192*int(B13) + 16384*int(B14) + 32768*int(B15);
			  atributo_2 <= 1*int(C00) + 2*int(C01) + 4*int(C02) + 8*int(C03) +
							16*int(C04) + 32*int(C05) + 64*int(C06) + 128*int(C07) +
							256*int(C08) + 512*int(C09) + 1024*int(C10) + 2048*int(C11) +
							4096*int(C12) + 8192*int(C13) + 16384*int(C14) + 32768*int(C15);
			  atributo_3 <= 1*int(D00) + 2*int(D01) + 4*int(D02) + 8*int(D03) +
							16*int(D04) + 32*int(D05) + 64*int(D06) + 128*int(D07) +
							256*int(D08) + 512*int(D09) + 1024*int(D10) + 2048*int(D11) +
							4096*int(D12) + 8192*int(D13) + 16384*int(D14) + 32768*int(D15);
			  atributo_4 <= 1*int(E00) + 2*int(E01) + 4*int(E02) + 8*int(E03) +
							16*int(E04) + 32*int(E05) + 64*int(E06) + 128*int(E07) +
							256*int(E08) + 512*int(E09) + 1024*int(E10) + 2048*int(E11) +
							4096*int(E12) + 8192*int(E13) + 16384*int(E14) + 32768*int(E15);

			  if(atributo_1 /= 2) then
					if (atributo_2 <= 1050) then
						 if(atributo_3 /= 1) then
							  outcome <= 0;
						 else
							  outcome <= 1;
						 end if;
					else
						 if(atributo_0 <= 23) then
							  outcome <= 1;
						 else
							  outcome <= 1;
						 end if;
					end if;
			  else
					if (atributo_3 /= 3) then
						 if(atributo_0 <= 6) then
							  outcome <= 1;
						 else
							  outcome <= 0;
						 end if;
					else
						 if(atributo_0 <= 5) then
							  outcome <= 0;
						 else
							  outcome <= 0;
						 end if;
					end if;
			  end if;
			 
			  outcome_array(0) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(1) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(2) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(3) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(4) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(5) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(6) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(7) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(8) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(9) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(10) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(11) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(12) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(13) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(14) <= outcome mod 2;
			  outcome <= outcome/2;
			  outcome_array(15) <= outcome mod 2;
			  outcome <= outcome/2;

			  O00 <= logic(outcome_array(0));
			  O01 <= logic(outcome_array(1));
			  O02 <= logic(outcome_array(2));
			  O03 <= logic(outcome_array(3));
			  O04 <= logic(outcome_array(4));
			  O05 <= logic(outcome_array(5));
			  O06 <= logic(outcome_array(6));
			  O07 <= logic(outcome_array(7));
			  O08 <= logic(outcome_array(8));
			  O09 <= logic(outcome_array(9));
			  O10 <= logic(outcome_array(10));
			  O11 <= logic(outcome_array(11));
			  O12 <= logic(outcome_array(12));
			  O13 <= logic(outcome_array(13));
			  O14 <= logic(outcome_array(14));
			  O15 <= logic(outcome_array(15));
			  
		 end process;
     
end arvore_decisao;