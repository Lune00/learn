
--ADhesion qui expire dans 30 jours ou adhesion deja expirée
SELECT * FROM membres
    WHERE (sysdate + 30) >= finadhesion OR sysdate > finadhesion ;
    

DECLARE
 
CURSOR c_adherants_expired IS  SELECT * FROM membres
    WHERE (sysdate + 30) >= finadhesion OR sysdate > finadhesion ;
   
BEGIN

    FOR i IN c_adherants_expired LOOP
    dbms_output.put_line(i.nom);
    END LOOP;

END;
/

