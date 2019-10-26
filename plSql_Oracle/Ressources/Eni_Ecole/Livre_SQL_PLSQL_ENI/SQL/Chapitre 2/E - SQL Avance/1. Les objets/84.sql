create or replace view v_clicmd(noclient, nom, commande, cp) as
  select clients.nocli, nomcli, nocde, code_postal
  from clients, commandes
  where clients.nocli=commandes.nocli;
select * from v_clicmd order by noclient

create or replace view v_clicmd44 as
  select * from v_clicmd
  where cp between 44000 and 44999;

select * from v_clicmd44 order by noclient;
drop table commandes cascades constraints;
alter view v_clicmd compile;
select * from v_clicmd44 order by noclient;
