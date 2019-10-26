ALTER TABLE resultats
  ADD tempscorrige date null;

CREATE OR REPLACE TRIGGER bf_insupd_resultats
  BEFORE INSERT OR UPDATE OF bonification
  ON resultats
  FOR EACH ROW
BEGIN
  :new.tempscorrige:=to_date(tempsHHMISS(tempsEnSeconde(:new.temps)-:new.bonification), 'HH24:MI:SS');
END;
/

CREATE OR REPLACE TRIGGER bf_insupd_coureurs
  BEFORE INSERT OR UPDATE
  ON coureurs
  FOR EACH ROW
BEGIN
  :new.nationalite:=upper(:new.nationalite);
END;
/


CREATE OR REPLACE TRIGGER bf_insupd_equipes
  BEFORE INSERT OR UPDATE
  ON equipes
  FOR EACH ROW
BEGIN
  :new.nationalite:=upper(:new.nationalite);
END;
/

CREATE OR REPLACE FUNCTION villeSansEspaceEtEnMaj(pnomville varchar) RETURN varchar
IS
  vvillesansespace varchar(100):='';
BEGIN
  FOR i IN 1..LENGTH(pnomville) LOOP
  IF SUBSTR(pnomville,i,1) NOT IN ('''',' ')then
    vvillesansespace := vvillesansespace || UPPER(SUBSTR(pnomville,i,1)) ;
  END IF;
  END LOOP;
  RETURN vvillesansespace;
END;
/
CREATE OR REPLACE FUNCTION VerifCodeEtape(pcode varchar,pnomvilledepart varchar,pnomvillearrivee varchar) RETURN boolean
IS
valide boolean := false;
BEGIN
  IF LENGTH(TRIM(pcode)) = 8 AND
      SUBSTR(pcode,1,3) = SUBSTR(villeSansEspaceEtEnMaj(pnomvilledepart),1,3) AND
      SUBSTR(pcode,4,3) = SUBSTR(villeSansEspaceEtEnMaj(pnomvillearrivee),1,3) AND
      SUBSTR(pcode,7,2) BETWEEN '01' AND '99' THEN
      valide := true;
      END IF;     
  return valide;
END;

CREATE OR REPLACE TRIGGER bf_ins_upd_etapes 
BEFORE INSERT OR UPDATE OF code,villedepart,villearrivee ON ETAPES 
FOR EACH ROW
DECLARE
  vconcatvilles varchar2(8);
  vnb integer;
BEGIN 
  IF inserting THEN
  vconcatvilles := SUBSTR(villeSansEspaceEtEnMaj(:new.villedepart),1,3) ||  SUBSTR(villeSansEspaceEtEnMaj(:new.villearrivee),1,3);
  Select count(*) + 1 INTO vnb FROM ETAPES WHERE code LIKE (vconcatvilles ||'%');
  IF vnb <> 1 THEN
    SELECT  TO_NUMBER(MAX(SUBSTR(code,7,2))) + 1  INTO vnb FROM ETAPES WHERE code LIKE (vconcatvilles ||'%');
  END IF;
  IF vnb < 10 THEN
    vconcatvilles := vconcatvilles || '0';
  END IF;
  vconcatvilles :=vconcatvilles || vnb;
  :new.code := vconcatvilles;
   
  END IF;
  IF updating THEN
    IF :new.code <> :old.code THEN
      RAISE_APPLICATION_ERROR(-20050,'pas possible de modifier le code de l''étape');
    END IF;
    IF :new.villedepart <> :old.villedepart OR :new.villearrivee <> :old.villearrivee THEN
      IF NOT VerifCodeEtape(:new.code,:new.villedepart,:new.villearrivee) THEN
         RAISE_APPLICATION_ERROR(-20050,'La modification des villes entraîne une incohérence pour le code de l''étape');
      END IF;
    END IF;
  END IF;
END;
