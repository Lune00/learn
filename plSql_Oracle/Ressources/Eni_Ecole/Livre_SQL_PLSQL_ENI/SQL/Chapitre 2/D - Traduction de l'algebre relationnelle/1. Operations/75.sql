select nocli, nomcli from clients
union
select nocli, nomcli from clidivers;

select nomcli from clients
union
select nomcli from clidivers;

