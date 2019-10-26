
CREATE OR REPLACE FUNCTION DureeDernierEmprunt(vmembre number) RETURN integer AS
  vnb integer;
  vduree integer:=0;
BEGIN
  SELECT count(*) INTO vnb FROM membres where numero = vmembre;
  IF vnb = 0 THEN
    RAISE_APPLICATION_ERROR(-20514,'Ce membre n''existe pas');
  END IF;
  SELECT count(*) INTO vnb FROM emprunts WHERE membre = vmembre;
   IF vnb = 0 THEN
    RAISE_APPLICATION_ERROR(-20514,'Ce membre n''a jamais emprunté d''ouvrage');
  END IF;
    SELECT count(*) INTO vnb FROM emprunts INNER JOIN details ON emprunts.numero = details.emprunt 
      WHERE membre = vmembre AND rendule IS NULL;
   IF vnb <> 0 THEN
    vduree:=-1;
    ELSE
    SELECT TRUNC(MAX(rendule),'DD')-TRUNC(creele,'DD') +1 INTO vduree FROM emprunts INNER JOIN details ON emprunts.numero = details.emprunt 
      WHERE membre = vmembre AND creele = (select MAX(creele) FROM emprunts where membre = vmembre)
      GROUP BY creele;
  END IF;
  RETURN vduree;
END;
