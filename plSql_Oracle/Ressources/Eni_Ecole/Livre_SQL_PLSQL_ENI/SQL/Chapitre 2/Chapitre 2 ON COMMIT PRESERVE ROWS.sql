create global temporary table TCLI(
NOCLI number(4),
NOMCLI varchar2(30))
ON COMMIT PRESERVE ROWS;
insert into tcli
select cli.nocli, nomcli
from clients cli, commandes cde
where cli.nocli=cde.nocli;
commit;
select count(*) from tcli;

