SET SERVEROUTPUT ON
DECLARE
 TYPE tableau_numero IS TABLE OF NUMBER(4);
  lesClients tableau_numero;
BEGIN
  SELECT nocli 
    BULK COLLECT INTO lesClients 
    FROM clients;
  DBMS_OUTPUT.PUT_LINE ('Un numero  :'||TO_CHAR(lesClients(1)));
END;
/