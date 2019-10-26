CREATE OR REPLACE FUNCTION ajouteMembre 
(vnom in char, vprenom in char, vadresse in char, 
 vmobile in char, vdateadhesion in date,
 vduree in number)  
RETURN number AS 
  vnumero membres.numero%type ;
BEGIN
  INSERT INTO MEMBRES (numero, nom, 
    prenom, adresse, mobile, adhesion, duree) 
  VALUES (seq_membre.nextval, vnom, 
    vprenom, vadresse, vmobile, vdateadhesion, vduree) 
  RETURNING  numero INTO vnumero ;
  RETURN vnumero ;
END ;
/
set serveroutput on
DECLARE
  vnumero membres.numero% TYPE;
BEGIN
  vnumero:= ajoutemembre('LUDIMA','Laurent','11 rue des lilas',
    '06 02 01 05 09',sysdate,3);
  dbms_output.put_line('Numero du nouveau membre:'||vnumero);
END;
