ALTER TABLE exemplaires 
ADD (nombreEmprunts number(3) invisible default 0 ,
     dateCalculEmprunts date invisible default sysdate );

DESC exemplaires;

SELECT exemplaires.*, nombreEmprunts,dateCalculEmprunts FROM exemplaires;


UPDATE exemplaires SET dateCalculEmprunts =(select min(creele)
  FROM emprunts e inner join details de 
    ON  e.numero=de.emprunt
    AND de.isbn=exemplaires.isbn
    AND de.exemplaire=exemplaires.numero);
UPDATE exemplaires SET dateCalculEmprunts = sysdate
WHERE dateCalculEmprunts IS NULL;
COMMIT;

DECLARE
  CURSOR cLesExemplaires IS 
    SELECT exemplaires.*, nombreEmprunts,dateCalculEmprunts FROM exemplaires 
    FOR UPDATE OF nombreEmprunts, dateCalculEmprunts;
  vnbre number(3);
BEGIN
  -- parcourir l'ensemble des exemplaires
  FOR vexemplaire IN CLesExemplaires LOOP
    -- Calcul du nombre d'emprunts
    SELECT count(*) INTO vnbre
      FROM details INNER JOIN emprunts
      ON details.emprunt=emprunts.numero
        AND isbn=vexemplaire.isbn 
        AND exemplaire=vexemplaire.numero
        WHERE creele>=vexemplaire.dateCalculEmprunts;
      -- mettre à jour les informations exemplaires
      UPDATE exemplaires SET 
        nombreEmprunts=nombreEmprunts+vnbre,
        dateCalculEmprunts=sysdate 
        WHERE CURRENT OF CLesExemplaires;
      -- Mise à jour de l'état des exemplaires
      UPDATE exemplaires SET etat='NE' 
        WHERE nombreEmprunts<=10;
      UPDATE exemplaires SET etat='BO' 
        WHERE nombreEmprunts BETWEEN 11 AND 25;
      UPDATE exemplaires SET etat='MO' 
        WHERE nombreEmprunts BETWEEN 26 AND 40;
      UPDATE exemplaires SET etat='MA' 
        WHERE nombreEmprunts >=41;
    END LOOP;
    -- valider les modifications 
    COMMIT;
  END;
/
  