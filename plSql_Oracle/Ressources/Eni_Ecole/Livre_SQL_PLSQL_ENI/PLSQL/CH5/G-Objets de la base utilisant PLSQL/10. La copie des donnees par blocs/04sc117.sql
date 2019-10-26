SET SERVEROUTPUT ON
DECLARE
 TYPE tableau_numero IS TABLE OF NUMBER(4);
 TYPE tableau_nom IS TABLE OF CHAR(5);
  lesNumeros tableau_numero:=tableau_numero(1,2,3,4);
  lesNoms tableau_nom:=tableau_nom('Velo','Roue','Frein','Selle');
BEGIN
  FORALL i IN lesNumeros.FIRST..lesNumeros.LAST
   UPDATE composants set nom=LesNoms(i) WHERE numero=lesNumeros(i);
  DBMS_OUTPUT.PUT_LINE('Instruction1 :'||TO_CHAR(SQL%BULK_ROWCOUNT(1))||' lignes modifiés');
END;
/