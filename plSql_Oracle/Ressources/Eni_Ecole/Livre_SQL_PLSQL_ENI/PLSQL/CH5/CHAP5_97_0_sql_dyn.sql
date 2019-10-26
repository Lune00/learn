DECLARE
  requete VARCHAR2(200);
  bloc_pl VARCHAR2(200);
  vnocli commandes.nocli%type:=8;
  vnocde commandes.nocde%type:=6;
  vjour date := sysdate();
  vetat char(2):='EC';
  vclients clients%rowtype;
  vprix articles.prix%type;
  vrefart articles.refart%type:='ZZ01';
BEGIN
  -- exécution d'un ordre DDL
 EXECUTE IMMEDIATE 'CREATE TABLE clients_fideles(nocli number(6), ca number(8,2))';
  -- ordre DML avec passage d'argument en entrée
  requete:='INSERT INTO commandes(nocde, nocli, datecde, etatcde) values(:1, :2, :3, :4)';
  EXECUTE IMMEDIATE requete USING vnocli, vnocde, vjour, vetat;
   -- construction d'un bloc PL/SQL anonyme
  bloc_pl:='BEGIN Update articles set prix=prix*0.99; END;';
  EXECUTE IMMEDIATE bloc_pl;
  -- utilisation du mot clé into
  requete:='SELECT * FROM clients WHERE nocli=:1';
  EXECUTE IMMEDIATE requete INTO vclients USING vnocli;
  -- utilisation de la clause RETURNING INTO
 requete:='Update articles set prix=200 where refart=:1 returning prix into :2';
  EXECUTE IMMEDIATE requete USING vrefart RETURNING INTO vprix;
END;
/