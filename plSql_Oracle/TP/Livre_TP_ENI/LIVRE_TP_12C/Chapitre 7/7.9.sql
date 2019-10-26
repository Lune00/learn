-- premier français
CREATE OR REPLACE FUNCTION positionPremierFrancais RETURN number AS
  CURSOR cClassement IS  SELECT coureurs.dossard, temps, nationalite
  FROM jaune INNER JOIN coureurs  ON jaune.dossard=coureurs.dossard
  ORDER BY 2 ASC;
  vClassement cClassement%rowtype;
  vposition number(3);
BEGIN
  vposition:=1;
  OPEN  cClassement;
  LOOP
    FETCH cCLassement INTO vClassement;
    IF (cClassement%NOTFOUND) THEN
      raise_application_error(-20701,'Pas de français');
    END IF;
    IF (vClassement.nationalite='FRA') THEN
      exit;
    END IF;
    vposition:=vposition+1;
  END LOOP;
  CLOSE cClassement;
  RETURN vposition;
END;
/

-- temps Maillot jaune exprimé en secondes
CREATE OR REPLACE FUNCTION tempsMaillotJaune RETURN number AS
  CURSOR cClassement IS   SELECT * 
  FROM jaune
  ORDER BY temps ASC;
  vClassement cClassement%rowtype;
BEGIN
  OPEN  cClassement;
  FETCH cCLassement INTO vClassement;
  CLOSE cClassement;
  RETURN vClassement.temps;
END;
/
-- temps vainqueur Etape exprimé en secondes
CREATE OR REPLACE FUNCTION tempsVainqueurEtape(vetape in varchar) RETURN number IS
  vtemps number;
BEGIN
  SELECT min(tempsEnSeconde(temps)) INTO vtemps
  FROM resultats
  WHERE etape=vetape;
  RETURN vtemps;
EXCEPTION
  WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-20700,'Etape non courrue');
END;
/
-- vitesse Moyenne
CREATE OR REPLACE FUNCTION vitesseMoyenne(codeEtape in varchar2 default null) RETURN number IS
  vitesseMoyenne number:=0;
  vdistance number(7,2);
  vtemps number;
BEGIN
  IF (codeEtape IS NULL) THEN
    vtemps:=tempsMaillotJaune;
    SELECT sum(distance) INTO vdistance
    FROM etapes
    WHERE code IN (SELECT distinct etape FROM resultats);
  ELSE
    vtemps:=tempsVainqueurEtape(codeEtape);
    SELECT distance INTO vdistance
    FROM etapes
    WHERE code=codeEtape;
  END IF;
  vitesseMoyenne:=vdistance/vtemps*3600;
  RETURN vitesseMoyenne;
END;
/