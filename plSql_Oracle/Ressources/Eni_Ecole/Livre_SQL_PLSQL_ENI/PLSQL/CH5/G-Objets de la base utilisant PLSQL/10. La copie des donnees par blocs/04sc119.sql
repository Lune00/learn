DECLARE
 TYPE tableau_numero IS TABLE OF clients.nocli%type;
  lesClients tableau_numero;
  CURSOR ccli IS SELECT nocli FROM clients;
BEGIN
  OPEN ccli;
  LOOP
    FETCH ccli  BULK COLLECT INTO lesClients LIMIT 10;
    EXIT WHEN CCLI%NOTFOUND;
  END LOOP;
END;
/