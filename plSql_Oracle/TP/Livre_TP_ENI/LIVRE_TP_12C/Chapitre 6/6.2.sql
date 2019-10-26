CREATE OR REPLACE TRIGGER bf_upd_emprunts
  BEFORE UPDATE ON emprunts
  FOR EACH ROW
  WHEN (new.membre !=old.membre)
BEGIN
  -- le corps de déclencheur est exécuté s’il y a eu une modi-fication sur le membre.
  RAISE_APPLICATION_ERROR(-20300,'impossible de modifier le membre') ;
END ;
/
