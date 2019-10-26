select nocli, nomcli
  from clients cl
 where not exists (select nocli
                     from commandes co
                    where cl.nocli=co.nocli);