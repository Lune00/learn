declare
  vnocli clients.nocli%type;
begin
  -- instructions
  if vnocli=15 then
    update clients set nomcli='Dupont' where nocli=vnocli;
    commit;
  else
    rollback;
  end if;
end;
/