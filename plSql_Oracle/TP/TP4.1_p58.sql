--SELECT details.isbn, details.exemplaire, exemplaires.etat,
--    COUNT(*) AS "Nombre d'emprunts"
--    FROM details INNER JOIN exemplaires
--    ON details.isbn = exemplaires.isbn 
--    AND details.exemplaire = exemplaires.numero
--    GROUP BY details.isbn, details.exemplaire, exemplaires.etat;
--    

DECLARE

CURSOR c_update_etat IS SELECT details.isbn, details.exemplaire, exemplaires.etat,
    COUNT(*) as nbemprunt
    FROM details  
    INNER JOIN exemplaires
    ON details.isbn = exemplaires.isbn 
    AND details.exemplaire = exemplaires.numero
    GROUP BY details.isbn, details.exemplaire, exemplaires.etat;

    v_etat exemplaires.etat%type;    
    
BEGIN

FOR i IN c_update_etat LOOP
    
    IF (i.nbemprunt  <= 10) THEN
    v_etat:='NE';
    ELSIF (i.nbemprunt <= 25) THEN
    v_etat:='BO';
    ELSIF (i.nbemprunt <= 40) THEN
    v_etat:='MO';
    DBMS_OUTPUT.put_line('here');
    ELSE
    v_etat:='MA';
    END IF;
    
    UPDATE exemplaires SET etat=v_etat WHERE isbn=i.isbn AND numero=i.exemplaire; 
    
    DBMS_OUTPUT.put_line(v_etat||' '||i.nbemprunt);
END LOOP;

END;
/


SELECT * FROM exemplaires;

SELECT details.isbn, details.exemplaire, exemplaires.etat,
    COUNT(*) AS "Nombre d'emprunts"
    FROM details INNER JOIN exemplaires
    ON details.isbn = exemplaires.isbn 
    AND details.exemplaire = exemplaires.numero
    GROUP BY details.isbn, details.exemplaire, exemplaires.etat;
