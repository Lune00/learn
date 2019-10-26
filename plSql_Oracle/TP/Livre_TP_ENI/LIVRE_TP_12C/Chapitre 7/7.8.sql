CREATE OR REPLACE PROCEDURE infoEquipe(pcode varchar) IS
  vnb integer;
  CURSOR CurCoureurs IS SELECT dossard,nom,prenom fROM coureurs WHERE equipe = pcode;
  vnat varchar2(3);
  vetape varchar2(8);
  vjour date;
  vvilles varchar2(200);
BEGIN
  SELECT count(*) INTO vnb FROM equipes WHERE code = pcode;
  IF vnb=0 THEN
    RAISE_APPLICATION_ERROR(-20051,'Cette équipe n''existe pas');
  END IF;
  SELECT count(*) INTO vnb FROM coureurs WHERE equipe = pcode;
  IF vnb=0 THEN
    DBMS_OUTPUT.PUT_LINE('Cette équipe ne dispose d''aucun coureur');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Cette équipe est composée de ' || vnb || ' coureur(s) : ' );
   
    FOR vcour IN CurCoureurs LOOP
        DBMS_OUTPUT.PUT_LINE('      ' || vcour.nom || '   ' || vcour.prenom || '  dossard numéro '|| vcour.dossard);
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
    SELECT nationalite INTO vnat FROM equipes WHERE code=pcode;
    SELECT count(*) - 1 INTO vnb FROM equipes WHERE nationalite = vnat;
    IF vnb = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Cette équipe est de nationalité ' || vnat || '. c''est la seule équipe de cette nationalité');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cette équipe est de nationalité ' || vnat || '. Il y a '|| vnb || ' autre(s) équipe(s) de cette nationalité');
    END IF;
    SELECT count(distinct nationalite) into vnb FROM coureurs WHERE equipe = pcode;
    DBMS_OUTPUT.PUT_LINE('  On trouve '|| vnb|| ' nationalité(s) différente(s) au sein de l''équipe');    
    DBMS_OUTPUT.NEW_LINE;
    SELECT count(*) into vnb FROM resultats INNER JOIN coureurs on coureurs.dossard = resultats.coureur
     WHERE coureurs.equipe = pcode;
     IF vnb = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Cette équipe ne dispose d''aucun résultat');
     ELSE
        SELECT distinct etape,jour,villedepart || ' à '|| villearrivee INTO vetape,vjour,vvilles
        FROM resultats  INNER JOIN coureurs on coureurs.dossard = resultats.coureur
                        INNER JOIN etapes ON etapes.code = resultats.etape
        WHERE coureurs.equipe = pcode ORDER BY jour DESC FETCH FIRST 1 ROWS ONLY;
        DBMS_OUTPUT.PUT_LINE('Les derniers résultats pour cette équipe concernent l''étape ' || vetape || ' qui part de '|| vvilles || ' et s''est déroulée le '|| vjour);
     END IF;
  END IF;
END;
--test
SET SERVEROUTPUT ON
BEGIN
  infoEquipe('LST');
END;