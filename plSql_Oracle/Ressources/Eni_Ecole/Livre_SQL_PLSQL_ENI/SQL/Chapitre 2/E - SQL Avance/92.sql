create sequence c_nocli start with 1000 maxvalue 9999 no cycle;
insert into clients (nocli, nomcli, ville)
  values (c_nocli.nextval, 'Dupond et Dupont','Lille');
insert into clients (nocli, nomcli, ville)
  values (c_nocli.nextval, 'Durand et Durant','Tourcoing');

select nocli, nomcli, ville from clients order by nocli;
