create or replace procedure nom_bien_forme as
  PRAGMA AUTONOMOUS_TRANSACTION;
begin
  update clients set nomcli=initcap(nomcli);
  commit;
end;
/