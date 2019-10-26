DECLARE
 TYPE tableau_numero IS TABLE OF NUMBER(4) INDEX BY BINARY_INTEGER;
 TYPE tableau_nom IS TABLE OF CHAR(5) INDEX BY BINARY_INTEGER;
  lesNumeros tableau_numero;
  lesNoms tableau_nom;
  t1 number(5);
  t2 number(5);
  t3 number(5);
  PROCEDURE top (t out number) IS
    BEGIN SELECT TO_CHAR(SYSDATE,'SSSSS') INTO t FROM DUAL; END;
BEGIN
  -- Remplir les tableau
  FOR i in 1..5000 LOOP
    lesNumeros(i):=i; lesNoms(i):=TO_CHAR(i);
  END LOOP;
  TOP(t1);
  FOR i IN 1..5000 LOOP
    INSERT INTO composants VALUES(lesNumeros(i), lesNoms(i));
  END LOOP;
  TOP(t2);
  FORALL i IN 1..5000 
    INSERT INTO composants VALUES(lesNumeros(i), lesNoms(i));
  TOP(t3);
  DBMS_OUTPUT.PUT_LINE('Temps execution en secondes');
  DBMS_OUTPUT.PUT_LINE('FOR      '||TO_CHAR(t2-t1));
  DBMS_OUTPUT.PUT_LINE('FORALL   '||TO_CHAR(t3-t2));
END;
/