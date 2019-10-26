UPDATE emprunts
  SET etat='RE'
  WHERE numero NOT IN (SELECT emprunt
	FROM details
	WHERE rendule IS NULL);

CREATE TABLE compteEnCours(
  emprunt number(10),
  encours number(2) default 1);




CREATE OR REPLACE TRIGGER af_ins_details
  AFTER INSERT ON details
  FOR EACH ROW
DECLARE
  vtest number;
BEGIN
  IF (:new.rendule IS NULL) THEN
    -- l'emprunt est il present dans la table compteEnCours
    SELECT count(*) INTO vtest
      FROM compteEnCours
      WHERE emprunt=:new.emprunt;
    -- Réagir en foncion du résultat
    IF (vtest=0) THEN
      INSERT INTO compteEnCours(emprunt)
        VALUES (:new.emprunt);
    ELSE
      UPDATE compteEnCours 
        SET encours=encours+1
        WHERE emprunt=:new.emprunt;
    END IF;
  END IF;
END;
/

CREATE OR REPLACE TRIGGER af_upd_details
  AFTER UPDATE ON details
  FOR EACH ROW
DECLARE
  vnombre compteEnCours.encours%type;
BEGIN
  -- reprise du code de l'exercice 6.4
  IF ( :old.isbn != :new.isbn) THEN
      RAISE_APPLICATION_ERROR(-20400,
        'impossible de changer d''ouvrage') ;
  END IF;
  IF (:old.exemplaire!=:new.exemplaire) THEN
      RAISE_APPLICATION_ERROR(-20401,
        'impossible de changer d''exemplaire') ;
    END IF;
  -- s'agit t il d'un retour?
  IF (:new.rendule is not null AND :old.rendule is null) THEN
    UPDATE compteEnCours 
      SET encours=encours-1
      WHERE emprunt=:new.emprunt
      RETURNING encours INTO vnombre;
    IF (vnombre=0) THEN
      -- il faut modifier l'etat de l'emprunt
      UPDATE emprunts 
        SET etat='RE'
        WHERE numero=:new.emprunt;
      DELETE FROM compteEnCours
        WHERE emprunt=:new.emprunt;
    END IF;
  END IF;
END ;
/


CREATE OR REPLACE TRIGGER af_del_details
  AFTER DELETE ON details
  FOR EACH ROW
DECLARE
  vnombre compteEnCours.encours%type;
BEGIN
  IF (:old.rendule is null) THEN
    UPDATE compteEnCours 
      SET encours=encours-1
      WHERE emprunt=:old.emprunt
      RETURNING encours INTO vnombre;
    IF (vnombre=0) THEN
      -- il faut modifier l'etat de l'emprunt
      UPDATE emprunts 
        SET etat='RE'
        WHERE numero=:old.emprunt;
      DELETE FROM compteEnCours
        WHERE emprunt=:old.emprunt;
    END IF;
  END IF;
END;
/


INSERT INTO compteEnCours(emprunt, encours)
  SELECT emprunt, count(*)
  FROM details
  WHERE rendule is null
  GROUP BY emprunt;
