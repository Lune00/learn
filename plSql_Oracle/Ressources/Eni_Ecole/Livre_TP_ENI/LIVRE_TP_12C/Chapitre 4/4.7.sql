DECLARE
  Vnbre number(6);
  Vtotal number(6);
BEGIN
  -- calculer le rapport exemplaires dans un état moyen ou mauvais par rapport au nombre total d'exemplaires
  SELECT count(*) INTO vnbre 
  FROM exemplaires 
  WHERE etat IN ('MO','MA');
  SELECT count(*) INTO vtotal 
  FROM exemplaires;
  IF (vnbre>vtotal/2) THEN
    -- supprimer la contrainte existante
    EXECUTE IMMEDIATE 'ALTER TABLE exemplaires DROP CONSTRAINT ck_exemplaires_etat';
    -- ajouter la nouvelle contrainte
    EXECUTE IMMEDIATE 'ALTER TABLE exemplaires ADD CONSTRAINT ck_emplaires_etat CHECK etat IN (''NE'',''BO'',''MO'',''DO'',''MA'')';
    -- mettre à jour l'état de l'exemplaire
    UPDATE exemplaires SET etat='DO' 
      WHERE nombreEmprunts BETWEEN  41 AND 60;
    -- valider les modifications de données
    COMMIT;
  END IF;
END;
/
