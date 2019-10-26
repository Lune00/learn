select nocli, nomcli, ville
  from clients
 where ville in (select ville 
                   from clients
                  where nomcli like 'DUBOIS%');