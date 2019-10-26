CREATE OR REPLACE PROCEDURE MAJEtatExemplaire IS
  CURSOR cLesExemplaires IS SELECT exemplaires.*,dateCalculEmprunts,nombreEmprunts FROM exemplaires 
    FOR UPDATE OF nombreEmprunts, dateCalculEmprunts;
  vNbre number(3);
BEGIN
  -- parcourir l'ensemble des exemplaires
  FOR vexemplaire IN CLesExemplaires LOOP
    -- Calcul du nombre d'emprunts
    SELECT count(*) INTO vnbre
      FROM details INNER JOIN emprunts ON details.emprunt=emprunts.numero
      WHERE isbn=vexemplaire.isbn 
      AND exemplaire=vexemplaire.numero
      AND creele>=vexemplaire.dateCalculEmprunts;
    -- mettre à jour les informations exemplaires
    UPDATE exemplaires SET 
      nombreEmprunts=nombreEmprunts+vnbre,
      dateCalculEmprunts=sysdate 
      WHERE CURRENT OF CLesExemplaires;
  END LOOP;
  -- Mise à jour de l'état des exemplaires
  UPDATE exemplaires SET etat='NE' WHERE nombreEmprunts<=10;
  UPDATE exemplaires SET etat='BO' 
    WHERE nombreEmprunts BETWEEN 11 AND 25;
  UPDATE exemplaires SET etat='MO' 
    WHERE nombreEmprunts BETWEEN 26 AND 40;
  UPDATE exemplaires SET etat='DO' 
    WHERE nombreEmprunts BETWEEN 41 AND 60;
  UPDATE exemplaires SET etat='MA' 
    WHERE nombreEmprunts >=61;
  -- valider les modifications 
  COMMIT;
END;
/

BEGIN
  DBMS_SCHEDULER.CREATE_JOB('CalculEtatExemplaire',
  'MAJEtatExemplaire',systimestamp, 'systimestamp+14');
END;
/
