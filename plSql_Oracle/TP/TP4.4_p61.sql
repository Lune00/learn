SELECT * FROM ( SELECT ouvrages.ISBN, COUNT(*) AS "Nombre d'emprunts" FROM ouvrages 
    INNER JOIN details ON ouvrages.isbn = details.isbn
    INNER JOIN emprunts ON details.numero = emprunts.numero
    GROUP BY ouvrages.ISBN ) WHERE ROWNUM <=5;

DECLARE

CURSOR c_list IS SELECT * FROM ( SELECT ouvrages.ISBN, COUNT(*) AS "Nombre d'emprunts" FROM ouvrages 
    INNER JOIN details ON ouvrages.isbn = details.isbn
    INNER JOIN emprunts ON details.numero = emprunts.numero
    GROUP BY ouvrages.ISBN ) WHERE ROWNUM <=5;
    n INT;
BEGIN

n:=0;

FOR i IN c_list LOOP
DBMS_OUTPUT.PUT_LINE ('Numero '||n||': '|| i.isbn);
n:=n+1;
END LOOP;

END;
/
    
    

    