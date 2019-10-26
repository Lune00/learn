declare
  vnocde commandes.nocde%type;
begin
  select nocde into vnocde
    from commandes
    where nocli=1;
exception
  when no_data_found then
    -- il est possible de supprimer le client
    delete from clients where nocli=1;
  when others then
    raise_application_error (-20002,'Suppression impossible');
end;
/
