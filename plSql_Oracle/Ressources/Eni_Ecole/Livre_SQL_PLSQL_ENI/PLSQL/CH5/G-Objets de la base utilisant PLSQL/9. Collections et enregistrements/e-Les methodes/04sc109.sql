DECLARE
  TYPE LaListe IS TABLE OF VARCHAR2(50);
  LesCourses LaListe;
BEGIN
  LesCourses:=LaListe('Tomates','Melon','Salade');
  --Supprimer le Melon et la Salade de la collection
  LesCourses.TRIM(2);
  --Ajouter le Jambon à la collection
  LesCourses.EXTEND;
  LesCourses(2):='Jambon';
END;
/