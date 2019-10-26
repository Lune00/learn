Set serveroutput on

DECLARE
  CURSOR ccroissant IS SELECT e.membre, count(*) nb
    FROM emprunts e INNER JOIN details d ON e.numero=d.emprunt
	  WHERE months_between(sysdate, creele)<=10
    GROUP BY e.membre
    ORDER BY 2 ASC;
CURSOR cdecroissant IS 
SELECT membre,nb from 
( SELECT e.membre, count(*) NB
    FROM emprunts e INNER JOIN details d ON e.numero=d.emprunt
	  WHERE months_between(sysdate, creele)<=10
    GROUP BY e.membre
    ORDER BY 2 DESC ) R
    where rownum <= 3;

  vreception ccroissant%rowtype;
  i number;
  vmembre membres%rowtype;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Les plus faibles emprunteurs');
  OPEN ccroissant;
  FOR i in 1..3 LOOP
    FETCH ccroissant INTO vreception;
    IF ccroissant%NOTFOUND 
      THEN EXIT;
    END IF;
    SELECT * INTO vmembre 
      FROM membres 
      WHERE numero=vreception.membre;
    DBMS_OUTPUT.PUT_LINE(i||')  '||vmembre.numero||' '||vmembre.nom);
  END LOOP;
  CLOSE ccroissant;
  DBMS_OUTPUT.PUT_LINE('Les gros emprunteurs');
-- autre methode
  FOR vrec IN cdecroissant LOOP
  SELECT * INTO vmembre 
      FROM membres 
      WHERE numero=vrec.membre;
    DBMS_OUTPUT.PUT_LINE(cdecroissant%ROWCOUNT||') '||vmembre.numero||' '||vmembre.nom);
  END LOOP;
END;
/
