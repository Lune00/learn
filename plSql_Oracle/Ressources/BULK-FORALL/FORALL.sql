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
    TEMPS1  number ;
    TEMPS2  number ;
    begin
      For i in 1..3000000 Loop
        tab1(i) := i ;
        tab2(i) := ltrim( to_char( i ) ) ;
      End loop ;
   
      Select to_char( sysdate, 'SSSSS' ) into TEMPS1 from dual ;
      
      For i in 1..3000000 Loop
          Insert into TEST( A, B ) Values( tab2(i), tab1(i) ) ;
      End loop ;   
   
      Select to_char( sysdate, 'SSSSS' ) into TEMPS2 from dual ;
      
      dbms_output.put_line( 'Temps d''exécution en secondes' ) ;
      dbms_output.put_line( 'For    ' || to_char(TEMPS2 - TEMPS1) ) ;  
   End ;    
   /

Declare
    TYPE   TYP_TAB_NUM IS TABLE OF TEST.B%TYPE INDEX BY PLS_INTEGER ;
    TYPE   TYP_TAB_CAR IS TABLE OF TEST.A%TYPE INDEX BY PLS_INTEGER ;
    tab1   TYP_TAB_NUM ;
    tab2   TYP_TAB_CAR ;
    TEMPS1  number ;
    TEMPS2  number ;
    begin
      For i in 1..3000000 Loop
        tab1(i) := i ;
        tab2(i) := ltrim( to_char( i ) ) ;
      End loop ;
   
      Select to_char( sysdate, 'SSSSS' ) into TEMPS1 from dual ;
       
      Forall i in 1..3000000
         Insert into TEST( A, B ) Values( tab2(i), tab1(i) ) ;
      
     Select to_char( sysdate, 'SSSSS' ) into TEMPS2 from dual ;
      
      dbms_output.put_line( 'Temps d''exécution en secondes' ) ;
      dbms_output.put_line( 'Forall ' || to_char(TEMPS2 - TEMPS1) ) ;        
   End ;    
   /
