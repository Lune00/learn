CREATE OR REPLACE FUNCTION dureeMoyenne(
  visbn in number, vexemplaire in number default null) 
RETURN number IS
  vduree number;
BEGIN
  IF (vexemplaire is null) THEN
    SELECT AVG(TRUNC(rendule,'DD')-TRUNC(creele,'DD')+1)
    INTO vduree
    FROM emprunts INNER JOIN details
    ON emprunts.numero=details.emprunt
    WHERE details.isbn=visbn
    AND rendule is not null;
  ELSE
    SELECT AVG(TRUNC(rendule,'DD')-TRUNC(creele,'DD')+1)
    INTO vduree
    FROM emprunts INNER JOIN details
    ON emprunts.numero=details.emprunt
    WHERE details.isbn=visbn
    AND details.exemplaire=vexemplaire
    AND rendule is not null;
  END IF;
  RETURN vduree;
END;
/
