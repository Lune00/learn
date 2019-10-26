declare
  vnom clients.nomcli%type;
begin
  select nomcli into vnom
    from clients;
exception
  when too_many_rows then
    rollback;
end;
/