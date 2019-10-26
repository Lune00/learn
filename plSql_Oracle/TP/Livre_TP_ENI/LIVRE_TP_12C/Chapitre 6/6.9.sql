CREATE OR REPLACE TRIGGER bf_ins_details
  BEFORE INSERT ON details
  FOR EACH ROW
DECLARE
  vetat emprunts.etat%type;
BEGIN
  SELECT etat INTO vetat
    FROM emprunts
    WHERE numero=:new.emprunt;
  IF (vetat!='EC') THEN
    Raise_application_error(-20610,'Etat non compatible de la fiche');
  END IF;
END;
/
