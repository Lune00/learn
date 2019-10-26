DECLARE
  requete varchar2(200);
  vrefart articles.refart%type:='ZZ01';
  vdes articles.designation%type;
  vprix articles.prix%type:=150;
  vtva articles.codetva%type;
BEGIN
  requete:='Update articles set prix=:1 where refart=:2
                    RETURNING designation, codetva into :3,:4';
  /* Utilisation de la clause USING */
  EXECUTE IMMEDIATE requete USING vprix, vrefart, OUT vdes, OUT vtva;
  /* utilisation de la clause RETURNING INTO */
  EXECUTE IMMEDIATE requete USING vprix, vrefart RETURNING INTO vdes, vtva;
END;
/