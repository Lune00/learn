SELECT nocde, nocli, datecde, etatcde
FROM commandes;
insert into commandes (nocde, nocli, datecde, etatcde)
values (2000,35,sysdate,'EC');
SELECT nocde, nocli, datecde, etatcde
FROM commandes;