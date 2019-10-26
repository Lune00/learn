CREATE OR REPLACE PROCEDURE ajout_cde(
  vnocde IN OUT number,
  vnocli IN number) AS
BEGIN
  SELECT seq_cde.NEXTVAL 
    INTO vnocde 
    FROM dual;
  INSERT into commandes (nocde, nocli, datecde, etatcde)
    VALUES (vnocde, vnocli, sysdate, 'EC');
END;
/