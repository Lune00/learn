CREATE OR REPLACE PROCEDURE change_nom
AS
BEGIN
    UPDATE CLIENTS set nomcli=UPPER(nomcli);
    DBMS_OUTPUT.PUT_LINE('Op�ration r�alis�e');
END;
