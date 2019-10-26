DECLARE
  TYPE tableau_numero IS TABLE OF NUMBER(4);
  TYPE tableau_nom IS TABLE OF CHAR(5);
  lesNumeros tableau_numero:=tableau_numero(1,2,3,4);
  lesNoms tableau_nom := tableau_nom('Velo','Roue','Frein','Selle');
BEGIN
  FORALL i IN INDICES OF lesNumeros
    INSERT INTO composants values(lesNumeros(i), lesNoms(i));
END;
/