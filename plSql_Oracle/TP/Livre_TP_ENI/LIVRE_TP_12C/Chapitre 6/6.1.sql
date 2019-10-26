CREATE OR REPLACE TRIGGER af_ins_emprunts
  AFTER INSERT ON emprunts
  FOR EACH ROW
DECLARE
  Vfinvalidite date ;
BEGIN
  -- calcul de la date de fin de validité d’un adhesion
  SELECT adhesion INTO vfinvalidite
  FROM membres
  WHERE numero= :new.membre ;
  -- comparer la date de fin de validité avec la date du jour
  IF (vfinvalidite<sysdate) THEN
    -- lever une exception 
    RAISE_APPLICATION_ERROR(-20200,'Adhesion non valide') ;
  END IF;
END ;
/
