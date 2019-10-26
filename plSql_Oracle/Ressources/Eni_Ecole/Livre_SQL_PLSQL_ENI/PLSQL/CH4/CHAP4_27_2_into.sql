declare
  vnocli clients.nocli%type:=15;
  vnom   clients.nomcli%type;
begin
  vnom:='Dupont';
  update clients set nomcli=vnom
  where nocli=vnocli;
  vnocli:=vnocli+1;
  insert into clients (nocli, nomcli) values (vnocli, vnom);
end;
/