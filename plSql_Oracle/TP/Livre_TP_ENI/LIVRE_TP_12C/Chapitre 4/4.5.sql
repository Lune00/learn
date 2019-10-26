-- SOLUTION EN PL/SQL
SET SERVEROUTPUT ON
DECLARE
  CURSOR cLesMembres IS SELECT * FROM membres;  
BEGIN
  -- Traiter chaque membre
  FOR vmembre IN cLesMembres LOOP
    IF (vmembre.finadhesion<sysdate+30) THEN
    DBMS_OUTPUT.PUT_LINE('Numero '||vmembre.numero||' - '||vmembre.nom);
    END IF;
  END LOOP; 
END;
/

-- AUTRE SOLUTION EN SQL
SELECT numero, nom
FROM membres
WHERE finadhesion<=sysdate+30;