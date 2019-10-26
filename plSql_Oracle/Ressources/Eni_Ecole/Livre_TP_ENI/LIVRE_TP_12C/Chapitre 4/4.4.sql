DECLARE
  CURSOR couvrages IS SELECT isbn, count(*) AS NombreEmprunts
    FROM  details
    GROUP BY  isbn
    ORDER BY 2 DESC;
  vouvrage couvrages%rowtype;
  i number;
BEGIN
  OPEN couvrages;
  i:=0;
  LOOP
    i:=i+1;
    EXIT WHEN i>5;
    FETCH couvrages INTO vouvrage;
    EXIT WHEN couvrages%notfound;
    DBMS_OUTPUT.PUT_LINE('Numero: '||i||' isbn:' || 
      vouvrage.isbn);
  END LOOP;
  CLOSE couvrages;
END;
/
