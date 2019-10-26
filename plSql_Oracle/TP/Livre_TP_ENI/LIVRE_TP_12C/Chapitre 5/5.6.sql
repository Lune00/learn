CREATE OR REPLACE FUNCTION empruntMoyen(vmembre in number) 
RETURN number IS
  vdureeMoyenne number;
BEGIN
  SELECT AVG(rendule-creele+1) INTO vdureeMoyenne
  FROM emprunts INNER JOIN details  ON details.emprunt=emprunts.numero
  WHERE emprunts.membre=vmembre 
  AND details.rendule is not null;
  RETURN vdureeMoyenne;
END;
/



CREATE OR REPLACE FUNCTION empruntMoyen(vmembre in number) 
RETURN number IS
  vdureeMoyenne number;
BEGIN
  SELECT TRUNC(AVG(TRUNC(rendule,'DD')-TRUNC(creele,'DD')+1),2) INTO vdureeMoyenne
  FROM emprunts INNER JOIN  details   ON details.emprunt=emprunts.numero
  WHERE emprunts.membre=vmembre
  AND details.rendule is not null;
  RETURN vdureeMoyenne;
END;
/
