CREATE OR REPLACE PACKAGE livre AS
  FUNCTION adhesionAJour(vnumero number) RETURN boolean;
  FUNCTION ajouteMembre (vnom in char, 
                          vprenom in char,
                          vadresse in char,
                          vmobile in char, 
                          vdateadhesion in date, 
                          vduree in number)  
    RETURN number;
  FUNCTION dureeMoyenne (visbn in number, 
                         vexemplaire in number default null) 
    RETURN number;
  PROCEDURE empruntExpress(vmembre number,
      visbn number, vexemplaire number);
  FUNCTION empruntMoyen(vmembre in number) RETURN number;
  FUNCTION finValidite(vnumero in number) RETURN DATE ;
   FUNCTION DureeDernierEmprunt(vmembre number) RETURN integer ;
  PROCEDURE MAJEtatExemplaire;
  FUNCTION mesureActivite(vmois in number) RETURN number;
  PROCEDURE purgeMembres;
  PROCEDURE retourExemplaire(visbn in number, 
                             vnumero in number);
PROCEDURE supprimeExemplaire(visbn in number, 
                             vnumero in number);
END livre;
/



CREATE OR REPLACE PACKAGE BODY livre AS
------------------- Fonction adhesionAJour
  FUNCTION adhesionAJour(vnumero number) 
    RETURN boolean AS
  BEGIN
    IF (finValidite(vnumero)>=sysdate()) THEN
  	RETURN TRUE;
    ELSE
	  RETURN FALSE;
    END IF;
  END;
------------------- Fonction ajouteMembre
FUNCTION ajouteMembre 
(vnom in char, vprenom in char, vadresse in char, 
 vmobile in char, vdateadhesion in date,
 vduree in number)  
RETURN number AS 
  vnumero membres.numero%type ;
BEGIN
  INSERT INTO MEMBRES (numero, nom, 
    prenom, adresse, mobile, adhesion, duree) 
  VALUES (seq_membre.nextval, vnom, 
    vprenom, vadresse, vmobile, vdateadhesion, vduree) 
  RETURNING  numero INTO vnumero ;
  RETURN vnumero ;
END ;
------------------- Fonction duréeMoyenne
  FUNCTION dureeMoyenne(
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
------------------- Procédure empruntExpress
PROCEDURE empruntExpress(vmembre number,
      visbn number, vexemplaire number) 
  AS
  vemprunt emprunts.numero%type;
BEGIN
  INSERT INTO emprunts (numero, membre,creele)
    VALUES(seq_emprunts.NEXTVAL, vmembre, sysdate)
    RETURNING numero INTO vemprunt;
  INSERT INTO details(emprunt, numero, isbn, exemplaire)
    VALUES(vemprunt,1,visbn, vexemplaire);
END;
------------------- Fonction empruntMoyen
FUNCTION empruntMoyen(vmembre in number) 
RETURN number IS
  vdureeMoyenne number;
BEGIN
  SELECT TRUNC(AVG(TRUNC(rendule,'DD')-TRUNC(creele,'DD')+1),2) INTO vdureeMoyenne
  FROM emprunts INNER JOIN  details   ON details.emprunt=emprunts.numero
  WHERE emprunts.membre=vmembre
  AND details.rendule is not null;
  RETURN vdureeMoyenne;
END;
------------------- Fonction finValidité
  FUNCTION finValidite(vnumero in number) 
    RETURN Date IS
      vfin date;
    BEGIN
      SELECT adhesion - 14 INTO vfin 
        FROM membres
        WHERE numero=vnumero;
      RETURN vfin;
    END;
------------------- Fonction mesureActivité
FUNCTION mesureActivite(vmois in number) 
RETURN number IS
  CURSOR cActivite(vm in number) IS 
    SELECT membre, count(*) 
      FROM emprunts INNER JOIN details
      ON details.emprunt=emprunts.numero
      WHERE months_between(sysdate, creele)<vm
      GROUP BY membre
      ORDER BY 2 DESC FETCH FIRST 1 ROWS ONLY ;
    vmembre cActivite%rowtype;
BEGIN
  OPEN cActivite(vmois);
  FETCH cActivite INTO vmembre;
  CLOSE cActivite;
  RETURN vmembre.membre;
END;
-------------------fonction DureeDernierEmprunt
FUNCTION DureeDernierEmprunt(vmembre number) RETURN integer AS
  vnb integer;
  vduree integer:=0;
BEGIN
  SELECT count(*) INTO vnb FROM membres where numero = vmembre;
  IF vnb = 0 THEN
    RAISE_APPLICATION_ERROR(-20514,'Ce membre n''existe pas');
  END IF;
  SELECT count(*) INTO vnb FROM emprunts WHERE membre = vmembre;
   IF vnb = 0 THEN
    RAISE_APPLICATION_ERROR(-20514,'Ce membre n''a jamais emprunté d''ouvrage');
  END IF;
    SELECT count(*) INTO vnb FROM emprunts INNER JOIN details ON emprunts.numero = details.emprunt 
      WHERE membre = vmembre AND rendule IS NULL;
   IF vnb <> 0 THEN
    vduree:=-1;
    ELSE
    SELECT TRUNC(MAX(rendule),'DD')-TRUNC(creele,'DD') +1 INTO vduree FROM emprunts INNER JOIN details ON emprunts.numero = details.emprunt 
      WHERE membre = vmembre AND creele = (select MAX(creele) FROM emprunts where membre = vmembre)
      GROUP BY creele;
  END IF;
  RETURN vduree;
END;
------------------- Procédure MAJEtatExemplaire
PROCEDURE MAJEtatExemplaire IS
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
------------------- Procédure purgeMembres
PROCEDURE purgeMembres AS
CURSOR cLesMembres IS SELECT numero FROM membres 
  WHERE months_between(sysdate, adhesion) > 36;
BEGIN
  FOR vnumero IN cLesMembres LOOP
    BEGIN
      DELETE FROM membres WHERE numero=vnumero.numero;
      -- valider la transations
      COMMIT;
    EXCEPTION
      WHEN others THEN null;
    END;
  END LOOP;
END;
------------------- Procédure retourExemplaire
  PROCEDURE retourExemplaire
    (visbn in number, vnumero in number) AS
  BEGIN
    UPDATE details SET rendule=sysdate 
      WHERE rendule is null
        AND isbn= visbn and exemplaire=vnumero;
  END;
------------------- Procédure supprimeExemplaire
PROCEDURE supprimeExemplaire
  (visbn in number, vnumero in number) AS
BEGIN
  -- supprimer l’exemplaire
  DELETE FROM exemplaires 
    WHERE isbn=visbn AND numero=vnumero ;
  IF (SQL%ROWCOUNT=0) THEN
    RAISE NO_DATA_FOUND;
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    raise_application_error(-20010, 'exemplaire inconnu') ;
END ;

END livre;
/
