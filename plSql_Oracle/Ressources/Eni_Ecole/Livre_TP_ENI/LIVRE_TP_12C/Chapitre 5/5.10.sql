CREATE OR REPLACE PROCEDURE supprimeExemplaire
  (visbn in number, vnumero in number) AS
BEGIN
  -- supprimer l’exemplaire
  DELETE FROM exemplaires 
    WHERE isbn=visbn AND numero=vnumero ;
  IF (SQL%ROWCOUNT=0) THEN
    RAISE NO_DATA_FOUND;
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    raise_application_error(-20010, 'exemplaire inconnu') ;
END ;
/
