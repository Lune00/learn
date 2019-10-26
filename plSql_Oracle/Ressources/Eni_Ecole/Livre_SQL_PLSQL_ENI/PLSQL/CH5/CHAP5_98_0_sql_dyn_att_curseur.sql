CREATE OR REPLACE FUNCTION supp_lignes(
  nom_table varchar2,
  condition varchar2) RETURN INTEGER AS
BEGIN
  EXECUTE IMMEDIATE 
    ' DELETE FROM '||nom_table||' WHERE '||condition;
  -- le nombre de lignes supprimées est renvoyé
  RETURN SQL%ROWCOUNT;
END;
/