DECLARE
 TYPE tableau_numero IS TABLE OF NUMBER(4);
 TYPE tableau_nom IS TABLE OF CHAR(5);
  lesNumeros tableau_numero:=tableau_numero(1,2,3,4);
  lesNoms tableau_nom:=tableau_nom('Velo','Roue','Frein','Selle');
BEGIN
  FORALL i IN lesNumeros.FIRST..lesNumeros.LAST
    INSERT INTO composants values(lesNumeros(i),LesNoms(i));
  FORALL i IN lesNumeros.FIRST..lesNumeros.LAST
    DELETE FROM composants WHERE numero=2*lesNumeros(i);
  FORALL i IN lesNumeros.FIRST..lesNumeros.LAST
    INSERT INTO composants values(100+lesNumeros(i),LesNoms(i));
END;
/