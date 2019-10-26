CREATE OR REPLACE FUNCTION finValidite(vnumero in number) 
RETURN Date IS
  vfin date;
BEGIN
 SELECT adhesion - 14 INTO vfin
  FROM membres
  WHERE numero=vnumero;
  RETURN vfin;
END;
/
SELECT finValidite(1) FROM dual;