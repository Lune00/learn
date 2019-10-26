savepoint s1;
select nocli, rtrim(nomcli), ville from clients;
delete from clients where nocli>35;
select nocli, rtrim(nomcli), ville from clients;
savepoint s2;
insert into clients (nocli, nomcli, ville)
values (111,'DURAND','RENNES');
select nocli, rtrim(nomcli), ville from clients;
rollback to s2;
select nocli, rtrim(nomcli), ville from clients;
rollback to s1;
select nocli, rtrim(nomcli), ville from clients;
commit;
