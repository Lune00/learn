CREATE OR REPLACE PROCEDURE purgeMembres AS
BEGIN
DELETE FROM membres 
  WHERE months_between(sysdate, adhesion) > 36 ;
EXCEPTION
  WHEN others THEN
    raise_application_error(-20001,'Suppression impossible');
END;
/

CREATE OR REPLACE PROCEDURE purgeMembres AS
CURSOR cLesMembres IS SELECT numero FROM membres 
  WHERE months_between(sysdate, adhesion) > 36;
BEGIN
  FOR vnumero IN cLesMembres LOOP
    BEGIN
      DELETE FROM membres WHERE numero=vnumero.numero;
      -- valider la transaction
      COMMIT;
    EXCEPTION
      WHEN others THEN null;
    END;
  END LOOP;
END;
/
