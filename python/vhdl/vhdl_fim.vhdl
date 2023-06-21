
			  out_00 <= outcome/2;
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
		
			  O00 <= logic(outcome mod 2);
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
	
end arvore_decisao;