DECLARE
  TYPE LaListe IS TABLE OF VARCHAR2(50);
  LesCourses LaListe;
BEGIN
  LesCourses:=LaListe('Tomates','Melon','Salade');
  --Supprimer le Melon 
  LesCourses.DELETE(2);
  --Mettre le Jambon 
  LesCourses(2):='Jambon';
END;
/