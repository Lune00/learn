create or replace view v_cmdcli(nocde, datecde, noclient,nomcli) as
  select nocde, datecde, commandes.nocli, nomcli
  from commandes, clients
  where clients.nocli=commandes.nocli;
select * from v_cmdcli; order by noclient;
insert into v_cmdcli(nocde, datecde, noclient)
  values (1501, sysdate, 176);
select * from v_cmdcli; order by noclient;