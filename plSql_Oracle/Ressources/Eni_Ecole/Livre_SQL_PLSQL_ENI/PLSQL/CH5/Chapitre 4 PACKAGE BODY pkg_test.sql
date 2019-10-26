CREATE OR REPLACE PACKAGE BODY pkg_test IS
  PROCEDURE affiche(liste IN Noms) IS
    i NUMBER;
  BEGIN
    FOR i IN liste.FIRST..liste.LAST LOOP
	DBMS_OUTPUT.PUT_LINE(TO_CHAR(i)||'-->'||liste(i));
    END LOOP;
  END;
END;
/
