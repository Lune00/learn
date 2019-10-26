--Supprimer les membres dont l'adhésion a expiré depuis plus de 2 ans.
--Si emprunt existe pour ce membre, mettre a null la valeur dans la colonne membre


--On cree un membre expiré depuis plus de 2 ans
INSERT INTO membres (numero, nom, prenom, adresse, adhesion, duree)
   VALUES(seq_membre.NEXTVAL, 'LOMOBO','Laurent','31 rue des lilas',sysdate-1000,1);

INSERT INTO details(emprunt,numero,ISBN,exemplaire,rendule)
    VALUES(21,	1,	2038704015,	1,	sysdate);


--On lui ajoute un emprunt
INSERT INTO emprunts(numero,membre,creele) VALUES(22,12,sysdate);
    
--SELECT * FROM membres WHERE MONTHS_BETWEEN(sysdate,FINADHESION)>24;

    
SELECT membres.numero,membres.nom,details.rendule FROM membres
    INNER JOIN emprunts ON membres.numero = emprunts.membre
    INNER JOIN details ON emprunts.numero=details.emprunt
    WHERE MONTHS_BETWEEN(sysdate,FINADHESION)>24
    GROUP BY membres.numero, membres.nom, details.rendule;

SELECT membres.numero,membres.nom, details.rendule, COUNT(*) as nbemprunts FROM membres
    INNER JOIN emprunts ON membres.numero = emprunts.membre
    INNER JOIN details ON emprunts.numero=details.emprunt
    --WHERE MONTHS_BETWEEN(sysdate,FINADHESION)>24
    GROUP BY membres.numero, membres.nom, details.rendule;


 SELECT membres.numero,membres.nom,
        COUNT(*) as nbemprunts FROM membres
    INNER JOIN emprunts ON membres.numero = emprunts.membre
    INNER JOIN details ON emprunts.numero=details.emprunt
    WHERE MONTHS_BETWEEN(sysdate,FINADHESION)>24
    GROUP BY membres.numero, membres.nom;

DECLARE

CURSOR c_expired_members IS SELECT membres.numero,membres.nom,
        COUNT(*) as nbemprunts FROM membres
    INNER JOIN emprunts ON membres.numero = emprunts.membre
    WHERE MONTHS_BETWEEN(sysdate,FINADHESION)>24
    GROUP BY membres.numero, membres.nom;
   

BEGIN

FOR v_member IN c_expired_members LOOP
 
    IF( v_member.nbemprunts > 0 ) THEN
    DBMS_OUTPUT.put_line('Emprunt detecte pour '||v_member.nom);
    UPDATE emprunts SET membre=NULL WHERE membre=v_member.numero;
    DELETE FROM membres WHERE numero=v_member.numero;
    END IF;

END LOOP;

COMMIT;



END;
/

SELECT * FROM membres;
