CREATE OR REPLACE TRIGGER af_del_details
  AFTER DELETE ON details
  FOR EACH ROW
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
  vcreele emprunts.creele%type;
  vdatecalculemprunts date;
BEGIN
  -- ce calcul ne concerne que les éléments les plus récents
  SELECT creele INTO vcreele
    FROM emprunts
    WHERE numero=:old.emprunt;
  SELECT datecalculemprunts INTO vdatecalculemprunts
    FROM exemplaires
    WHERE exemplaires.isbn=:old.isbn
      AND exemplaires.numero=:old.exemplaire;
  IF (vdatecalculemprunts<vcreele) THEN
    -- la valorisation du nombre d'emprunts est antérieure à la location
    UPDATE exemplaires
      SET nombreEmprunts=nombreEmprunts+1
      WHERE exemplaires.isbn=:old.isbn
        AND exemplaires.numero=:old.exemplaire;
  END IF;
  COMMIT;
END;
/
