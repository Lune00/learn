SELECT nocde, nocli, datecde, etatcde
FROM commandes;
insert into commandes (nocde, nocli, datecde, etatcde)
values (2001,15,sysdate,'EC');
SELECT nocde, nocli, datecde, etatcde
FROM commandes;