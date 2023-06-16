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
    
    type t_vector is array (0 to 15) of integer;

    signal atributo_0: integer: 0;
    signal atributo_1: integer: 0;
    signal atributo_2: integer: 0;
    signal atributo_3: integer: 0;
    signal atributo_4: integer: 0;

    signal i: integer: 0;
    signal outcome_array: t_vector;
    signal outcome: integer: 0;
      
    process is
    begin
        atributo_0 <= 2**A00 + 2**A01 + 2**A02 + 2**A03 +
                      2**A04 + 2**A05 + 2**A06 + 2**A07 +
                      2**A08 + 2**A09 + 2**A10 + 2**A11 +
                      2**A12 + 2**A13 + 2**A14 + 2**A15;
        atributo_1 <= 2**B00 + 2**B01 + 2**B02 + 2**B03 +
                      2**B04 + 2**B05 + 2**B06 + 2**B07 +
                      2**B08 + 2**B09 + 2**B10 + 2**B11 +
                      2**B12 + 2**B13 + 2**B14 + 2**B15;
        atributo_2 <= 2**C00 + 2**C01 + 2**C02 + 2**C03 +
                      2**C04 + 2**C05 + 2**C06 + 2**C07 +
                      2**C08 + 2**C09 + 2**C10 + 2**C11 +
                      2**C12 + 2**C13 + 2**C14 + 2**C15;
        atributo_3 <= 2**D00 + 2**D01 + 2**D02 + 2**D03 +
                      2**D04 + 2**D05 + 2**D06 + 2**D07 +
                      2**D08 + 2**D09 + 2**D10 + 2**D11 +
                      2**D12 + 2**D13 + 2**D14 + 2**D15;
        atributo_4 <= 2**E00 + 2**E01 + 2**E02 + 2**E03 +
                      2**E04 + 2**E05 + 2**E06 + 2**E07 +
                      2**E08 + 2**E09 + 2**E10 + 2**E11 +
                      2**E12 + 2**E13 + 2**E14 + 2**E15;

        if(atributo_1 != 2) then
            if (atributo_2 <= 1050.00) then
                if(atributo_3 != 1) then
                    outcome <= 0;
                else
                    outcome <= 1;
                end if;
            else
                if(atributo_0 <= 23.50) then
                    outcome <= 1;
                else
                    outcome <= 1;
                end if;
            end if;
        else
            if (atributo_3 != 3) then
                if(atributo_0 <= 6) then
                    outcome <= 1;
                else
                    outcome <= 0;
                end if;
            else
                if(atributo_0 <= 5.50) then
                    outcome <= 0;
                else
                    outcome <= 0;
                end if;
            end if;
        end if;

        i <= 0;
        
        while outcome > 0 loop
            outcome_array(i) <= outcome%2;
            outcome <= outcome/2;
            i <= i + 1;

            if (outcome = 0) then
                outcome_array(i) <= 1
                i <= i + 1;
                while (i < 15) loop
                    outcome_array(i) <= 0
                    i <= i + 1;
                end loop;
            end if;
        end loop;

        O00 <= outcome_array(0);
        O01 <= outcome_array(1);
        O02 <= outcome_array(2);
        O03 <= outcome_array(3);
        O04 <= outcome_array(4);
        O05 <= outcome_array(5);
        O06 <= outcome_array(6);
        O07 <= outcome_array(7);
        O08 <= outcome_array(8);
        O09 <= outcome_array(9);
        O10 <= outcome_array(10);
        O11 <= outcome_array(11);
        O12 <= outcome_array(12);
        O13 <= outcome_array(13);
        O14 <= outcome_array(14);
        O15 <= outcome_array(15);
    end process;
     
end arvore_decisao;