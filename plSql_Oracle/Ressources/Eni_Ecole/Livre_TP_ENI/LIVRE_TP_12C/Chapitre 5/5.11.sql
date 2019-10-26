SELECT MAX(numero) FROM emprunts;

CREATE SEQUENCE seq_emprunts START WITH 50;

CREATE OR REPLACE PROCEDURE empruntExpress(vmembre number,
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
/
