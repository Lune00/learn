Declare
      TYPE Emp_rec IS RECORD
      ( empno    emp.empno%type,
        empname  emp.ename%type,
        salaire  emp.sal%type
      );
      emp_info Emp_rec ;
    Begin
       Select empno, ename, sal Into emp_info From EMP where empno = 7499 ;
       dbms_output.put_line( 'Ancien  salaire pour ' || emp_info.empno || ' : ' || To_char(emp_info.salaire) ) ;
    
       Update EMP set sal = sal * 1.1 Where empno = 7499 
          RETURNING empno, ename, sal INTO emp_info ; 
    
       dbms_output.put_line( 'Nouveau salaire pour ' || emp_info.empno || ' : ' || To_char(emp_info.salaire) ) ;
   End  ;
/

create table test(a number, B number);
truncate table test;
alter system flush shared_pool;
alter system flush buffer_cache;
-- Test boucle FOR
Declare
    TYPE   TYP_TAB_NUM IS TABLE OF TEST.B%TYPE INDEX BY PLS_INTEGER ;
    TYPE   TYP_TAB_CAR IS TABLE OF TEST.A%TYPE INDEX BY PLS_INTEGER ;
    tab1   TYP_TAB_NUM ;
    tab2   TYP_TAB_CAR ;
    LN$T1  number ;
    LN$T2  number ;
    LN$T3  number ;
    begin
      For i in 1..300000 Loop
        tab1(i) := i ;
        tab2(i) := ltrim( to_char( i ) ) ;
      End loop ;
   
      Select to_char( sysdate, 'SSSSS' ) into LN$T1 from dual ;
      
      For i in 1..300000 Loop
          Insert into TEST( A, B ) Values( tab2(i), tab1(i) ) ;
      End loop ;   
   
      Select to_char( sysdate, 'SSSSS' ) into LN$T2 from dual ;
      
      dbms_output.put_line( 'Temps d''exécution en secondes' ) ;
      dbms_output.put_line( 'For    ' || to_char(LN$T2 - LN$T1) ) ;  
   End ;    
   /
--Temps d'exécution en secondes
--For    14

truncate table test;
alter system flush shared_pool;
alter system flush buffer_cache;
-- Test boucle FORALL
Declare
    TYPE   TYP_TAB_NUM IS TABLE OF TEST.B%TYPE INDEX BY PLS_INTEGER ;
    TYPE   TYP_TAB_CAR IS TABLE OF TEST.A%TYPE INDEX BY PLS_INTEGER ;
    tab1   TYP_TAB_NUM ;
    tab2   TYP_TAB_CAR ;
    LN$T1  number ;
    LN$T2  number ;
    LN$T3  number ;
    begin
      For i in 1..300000 Loop
        tab1(i) := i ;
        tab2(i) := ltrim( to_char( i ) ) ;
      End loop ;
   
      Select to_char( sysdate, 'SSSSS' ) into LN$T1 from dual ;
       
      Forall i in 1..300000
         Insert into TEST( A, B ) Values( tab2(i), tab1(i) ) ;
      
     Select to_char( sysdate, 'SSSSS' ) into LN$T2 from dual ;
      
      dbms_output.put_line( 'Temps d''exécution en secondes' ) ;
      dbms_output.put_line( 'Forall ' || to_char(LN$T2 - LN$T1) ) ;        
   End ;    
   /
--Temps d'exécution en secondes
--Forall 1

Declare
     TYPE    TYP_TAB_EMP IS TABLE OF EMP.EMPNO%Type ;
     Temp_no TYP_TAB_EMP ;
     Cursor  C_EMP is Select empno From EMP ;
     Pass    Pls_integer := 1 ;
    Begin
     Open C_EMP ;
     Loop
       Fetch C_EMP BULK COLLECT into Temp_no LIMIT 3 ;
      For i In Temp_no.first..Temp_no.last Loop
        dbms_output.put_line( 'Pass ' || to_char(Pass) || ' Empno= ' || Temp_no(i) ) ;
      End loop ;
      Pass := Pass + 1 ;
      Exit When C_EMP%NOTFOUND ;
    End Loop ;
   End ;
/

Declare
     TYPE    TYP_TAB_EMP IS TABLE OF EMP.EMPNO%Type ;
     Temp_no TYP_TAB_EMP ;
     Cursor  C_EMP is Select empno From EMP ;
    Begin
     Open C_EMP ;
     Loop
       Fetch C_EMP BULK COLLECT into Temp_no LIMIT 3 ;
        Forall i In Temp_no.first..Temp_no.last 
          Update EMP set SAL = Round(SAL * 2) Where empno = Temp_no(i) ;
       Commit ;
       Temp_no.DELETE ;
       Exit When C_EMP%NOTFOUND ;
    End Loop ;
   End ;
/

-- idem avec indices of
Declare
     TYPE    TYP_TAB_EMP IS TABLE OF EMP.EMPNO%Type ;
     Temp_no TYP_TAB_EMP ;
     Cursor  C_EMP is Select empno From EMP ;
    Begin
     Open C_EMP ;
     Loop
       Fetch C_EMP BULK COLLECT into Temp_no LIMIT 3 ;
        Forall i In indices of temp_no 
          Update EMP set SAL = Round(SAL / 2) Where empno = Temp_no(i) ;
       Commit ;
       Temp_no.DELETE ;
       Exit When C_EMP%NOTFOUND ;
    End Loop ;
   End ;
/

Declare
     TYPE    TYP_TAB_EMP IS TABLE OF EMP.EMPNO%Type ;
     Temp_no TYP_TAB_EMP ;
     Cursor  C_EMP is Select empno From EMP ;
     nb  integer:=0;
    Begin
     Open C_EMP ;
     Loop
       Fetch C_EMP BULK COLLECT into Temp_no  ;
        Forall i In indices of temp_no 
          Update EMP set SAL = Round(SAL / 2) Where empno = Temp_no(i) ;
   --    Commit ;
   FOR i in temp_no.first..temp_no.last loop
        nb:=nb+SQL%BULK_ROWCOUNT(i);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE(nb);
       Temp_no.DELETE ;
       Exit When C_EMP%NOTFOUND ;
    End Loop ;

   End ;
/

Declare
      TYPE    TYP_TAB_EMPNO IS TABLE OF EMP.EMPNO%Type ;
      TYPE    TYP_TAB_NOM   IS TABLE OF EMP.ENAME%Type ;  
      Temp_no TYP_TAB_EMPNO ;
      Tnoms   TYP_TAB_NOM ;  
    Begin
       Delete From EMP where sal < 100 
          RETURNING empno, ename BULK COLLECT INTO Temp_no, Tnoms ;
       For i in Temp_no.first..Temp_no.last Loop
         dbms_output.put_line( 'Employé viré : ' || To_char( Temp_no(i) ) || ' ' || Tnoms(i) ) ;
      End  loop ;
   End ;
   /

Declare
      TYPE    TYP_TAB_EMPNO IS TABLE OF EMP.EMPNO%Type ;
      TYPE    TYP_TAB_NOM   IS TABLE OF EMP.ENAME%Type ;  
      Temp_no TYP_TAB_EMPNO ;
      Tnoms   TYP_TAB_NOM ;  
    Begin
       Delete From EMP where sal < 100 
          RETURNING empno, ename BULK COLLECT INTO Temp_no, Tnoms ;
       If Temp_no.first is not null Then
       For i in Temp_no.first..Temp_no.last Loop
           dbms_output.put_line( 'Employé viré : ' || To_char( Temp_no(i) ) || ' ' || Tnoms(i) ) ;
        End  loop ;
       else
        dbms_output.put_line('Personne');
      End if ;
   End ;
 /


