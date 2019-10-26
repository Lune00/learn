insert into membres (numero, nom, prenom, adresse, adhesion, duree) 
values(seq_membre.nextval, 'LOMOBO','Laurent','31 rue des Lilas',
  sysdate -1000, 1);
commit;
SELECT * 
FROM membres
WHERE months_between(sysdate, add_months(adhesion, duree))>24;

DESC emprunts
 
Alter table emprunts modify (membre number(6) null);

DECLARE
  CURSOR cLesMembres IS SELECT * FROM membres 
    WHERE MONTHS_BETWEEN(sysdate, adhesion)>24;
  Vnombre number(5);
BEGIN
  FOR vLesMembres IN cLesMembres LOOP
    SELECT count(*) INTO vnombre
    FROM details INNER JOIN emprunts ON details.emprunt= emprunts.numero
    WHERE rendule is null AND emprunts.membre=vLesMembres.numero;
    IF (vnombre=0) THEN
      SELECT count(*) INTO vnombre FROM emprunts WHERE membre=vLesMembres.numero;
      IF (vnombre!=0) THEN
        UPDATE emprunts SET membre=null 
          WHERE membre=vLesMembres.numero;
      END IF;
      DELETE FROM membres WHERE numero=vLesMembres.numero;
      COMMIT;
    END IF;
  END LOOP;
END;
/
