select nocli, nomcli
  from clients
 where exists (select 'x' from commandes);
delete from commandes;
select nocli, nomcli
  from clients
 where exists (select 'x' from commandes);

