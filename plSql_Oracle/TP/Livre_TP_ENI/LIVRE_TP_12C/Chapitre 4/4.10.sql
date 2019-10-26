
INSERT INTO emprunts values (22,2,sysdate -1,'EC');
INSERT INTO details values (22,1,2080720872,1,null);

SET SERVEROUTPUT ON
DECLARE
  CURSOR CEmpruntsEnCours IS SELECT Distinct me.numero,me.nom,me.prenom FROM details de 
                        inner join emprunts emp on emp.numero = de.emprunt
                        inner join membres me on me.numero = emp.membre
                        where rendule is null;
  CURSOR COuvrages (pNum number) IS  SELECT ou.isbn,ou.titre ,ROUND(sysdate - emp.creele,1) as duree FROM details de
                        INNER JOIN OUVRAGEs ou on ou.isbn = de.isbn
                        inner join emprunts emp on emp.numero = de.emprunt                      
                        where rendule is null and emp.membre = pNum;         
  OuvrageEmp COuvrages%ROWTYPE;                        
  nbEmp number(4):=0;
BEGIN
   DBMS_OUTPUT.PUT_LINE('Voici la liste des membres possédant des ouvrages en cours d''emprunt : ');
      DBMS_OUTPUT.PUT_LINE('');
  FOR EmpEnCours IN CEmpruntsEnCours LOOP
    DBMS_OUTPUT.PUT_LINE('les ouvrages empruntés par ' || empEnCours.nom|| ' ' || EmpEnCours.prenom || ' sont : ');     
    nbEmp:=nbEmp+1;
    OPEN COuvrages(empEnCours.numero);
    LOOP
      FETCH Couvrages INTO OuvrageEmp;
      EXIT WHEN COuvrages%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE('      ' || OuvrageEmp.titre || ' depuis ' || OuvrageEmp.duree || ' jour(s)');
   END LOOP;
    CLOSE COuvrages;
  END LOOP;
  IF nbEmp =0 THEN
   DBMS_OUTPUT.PUT_LINE('Aucun emprunt en cours');
  END IF;
END;