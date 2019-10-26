begin
  insert into clients (nocli, nomcli)
    values(14,'paul');
  nom_bien_forme();
  rollback;
end;
/
select nocli, nomcli from clients;
