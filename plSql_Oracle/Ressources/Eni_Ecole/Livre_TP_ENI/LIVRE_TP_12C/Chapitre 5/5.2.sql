CREATE OR REPLACE function adhesionAJour(vnumero number) 
RETURN boolean AS
BEGIN
  IF (finValidite(vnumero)>=sysdate()) THEN
	RETURN TRUE;
  ELSE
	RETURN FALSE;
  END IF;
END;
/
SET SERVEROUTPUT ON
BEGIN
  IF (adhesionajour(1)) THEN
    dbms_output.put_line('Membre 1 : adhesion a jour');
  ELSE
    dbms_output.put_line('Membre 1 : adhesion pas a jour');
  END IF;
END;
/
