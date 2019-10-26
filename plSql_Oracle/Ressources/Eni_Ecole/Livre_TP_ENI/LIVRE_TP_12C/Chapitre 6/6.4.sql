CREATE OR REPLACE TRIGGER bf_ins_upd_exemplaires
  BEFORE INSERT OR UPDATE OF nombreEmprunts ON exemplaires
  FOR EACH ROW
BEGIN
  IF ( :new.nombreEmprunts<=10) THEN
    :new.etat:='NE' ;
  END IF;
  IF ( :new.nombreEmprunts BETWEEN 11 AND 25) THEN
    :new.etat :='BO' ;
  END IF;
  IF ( :new.nombreEmprunts BETWEEN 26 AND 40) THEN
    :new.etat :='MO' ;
  END IF;
  IF ( :new.nombreEmprunts BETWEEN 41 AND 60) THEN
    :new.etat :='DO' ;
  END IF;
  IF ( :new.nombreEmprunts >=61) THEN
    :new.etat :='MA' ;
  END IF;
END ;
/
