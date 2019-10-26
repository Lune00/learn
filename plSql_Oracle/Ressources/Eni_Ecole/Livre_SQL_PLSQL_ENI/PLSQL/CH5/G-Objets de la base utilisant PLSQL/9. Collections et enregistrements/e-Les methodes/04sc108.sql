DECLARE
  TYPE LaListe IS TABLE OF VARCHAR2(50);
  LesCourses LaListe;
BEGIN
  LesCourses:=LaListe('Tomates','Melon','Salade');
  LesCourses.EXTEND;
  LesCourses(4):='Jambon';
END;
/