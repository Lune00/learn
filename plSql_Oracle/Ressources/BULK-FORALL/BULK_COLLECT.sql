-- Test BULK COLLECT
Declare
     Cursor  C_EMP is Select empno From EMP ;
     Pass    Pls_integer := 1 ;
    Begin
      For i In c_emp Loop
            dbms_output.put_line( 'Pass ' || to_char(Pass) || ' Empno= ' || i.empno ) ;
            pass:=pass+1;
      End loop ;
   End ;
/

Declare
     TYPE    TYP_TAB_EMP IS TABLE OF EMP.EMPNO%Type ;
     Temp_no TYP_TAB_EMP ;
     Cursor  C_EMP is Select empno From EMP ;
     Pass    Pls_integer := 1 ;
    Begin
     Open C_EMP ;
     Loop
       Fetch C_EMP BULK COLLECT into Temp_no LIMIT 6 ;
      For i In Temp_no.first..Temp_no.last Loop
        dbms_output.put_line( 'Pass ' || to_char(Pass) || ' Empno= ' || Temp_no(i) ) ;
      End loop ;
      Pass := Pass + 1 ;
      Exit When C_EMP%NOTFOUND ;
    End Loop ;
     Close C_emp;
   End ;
/